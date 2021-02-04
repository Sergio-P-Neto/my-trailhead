public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<AccountByRecordType> getAccountFields() {
        List<AccountByRecordType> lstFields = new List<AccountByRecordType>();
        List<Account_Fields_By_Type__mdt> lstFieldByType = [SELECT RecordType__c, AccountFields__c FROM Account_Fields_By_Type__mdt];
        
        for (Account_Fields_By_Type__mdt accountField : lstFieldByType) {
            lstFields.add(new AccountByRecordType(accountField));
        }

        return lstFields;
    }

    @AuraEnabled
    public static SaveAccountResponse saveAccount(List<String> lstFieldValues, String recordType, String contactList) {
        System.debug('lstFieldValues: ' + lstFieldValues);
        System.debug('recordType: ' + recordType);
        System.debug('contactList: ' + contactList);
        SaveAccountResponse response = new SaveAccountResponse();
        try {
            Account account = new Account();
            account.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get(recordType).getRecordTypeId();
            
            for (String fieldValue : lstFieldValues) {
                if (fieldValue.split(';')[1] != 'null') {
                    Schema.DisplayType type = Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap().get(fieldValue.split(';')[0]).getDescribe().getType();
                    if (type == Schema.DisplayType.DATE) {
                        account.put(fieldValue.split(';')[0], Date.valueOf(fieldValue.split(';')[1]));
                    } else if(type == Schema.DisplayType.DOUBLE) {
                        account.put(fieldValue.split(';')[0], Decimal.valueOf(fieldValue.split(';')[1]));
                    } else {
                        account.put(fieldValue.split(';')[0], fieldValue.split(';')[1]);
                    }
                }
            }
            insert account;

            ContactFields contactFields = new ContactFields();
            List<ContactFields> lstContact = contactFields.parse(contactList);

            if (lstContact.size() > 0) {
                List<Contact> contactsToInsert = new List<Contact>();
                
                for (ContactFields fields : lstContact) {
                    Contact contact = new Contact();
                    contact.AccountId = account.Id;
                    contact.FirstName = fields.FirstName;
                    contact.LastName = fields.LastName;
                    contact.Phone = fields.Phone;
                    contactsToInsert.add(contact);
                }
                insert contactsToInsert;
                System.debug('contactsToInsert: ' + contactsToInsert);
            }
        } catch (Exception e) {
            response.HasError = true;
            response.ErrorMessage = 'Erro: ' + e.getMessage() + '-' + e.getStackTraceString();
        }
        
        return response;
    }

    public class AccountByRecordType {
        @AuraEnabled public String RecordType;
        @AuraEnabled public List<String> AccountFields;

        public AccountByRecordType(Account_Fields_By_Type__mdt accountField) {
            this.RecordType = accountField.RecordType__c;
            this.AccountFields = accountField.AccountFields__c.split(',');
        }
    }

    public class ContactFields {
        public String FirstName;
        public String LastName;
        public String Phone;
    
        public List<ContactFields> parse(String json) {
            return (List<ContactFields>) System.JSON.deserialize(json, List<ContactFields>.class);
        }
    }

    public class SaveAccountResponse {
        @AuraEnabled public Boolean HasError = false;
        @AuraEnabled public String ErrorMessage = '';
        @AuraEnabled public String AccountId = '';
    }
}