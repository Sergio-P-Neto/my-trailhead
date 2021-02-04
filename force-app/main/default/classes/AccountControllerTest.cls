@isTest
public class AccountControllerTest {
    
    @isTest public static void getAccountFieldsTest() {
        List<AccountController.AccountByRecordType> lstFields = AccountController.getAccountFields();
        System.assertEquals(2, lstFields.size());
    }

    @isTest public static void saveAccountTest() {
        List<String> accountValues = new List<String>{'Name;Test','CNPJ__c;23.438.581/0001-43','RazaoSocial__c;Test Company',
                                                        'NomeFantasia__c;Test Company','DataAbertura__c;2021-02-03','CapitalSocial__c;77200'};
        String contactValues = '[{"FirstName":"Contact","LastName":"Test","Phone":"1234567890"}]';
        AccountController.SaveAccountResponse accountResponse = AccountController.saveAccount(accountValues, 'Pessoa_Juridica', contactValues);
        System.assert(!accountResponse.HasError);
    }
}
