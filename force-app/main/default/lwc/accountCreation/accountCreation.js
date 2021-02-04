import { LightningElement, wire, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LOGO from '@salesforce/resourceUrl/Logo';

import accountFieldsByRecordType from '@salesforce/apex/AccountController.getAccountFields';
import saveAccount from '@salesforce/apex/AccountController.saveAccount';

export default class AccountCreation extends LightningElement {
    @wire(accountFieldsByRecordType)
    accountFieldsTypes;
    logo = LOGO;
    
    columns = [
        {label: 'Nome', fieldName: 'FirstName'},
        {label: 'Último nome', fieldName: 'LastName'},
        {label: 'Telefone', fieldName: 'Phone', type: 'phone'}
    ];

    isLegalEntity = false;
    isSelected = false;
    accountFields = [];

    @api accountValues = [];
    @api recordType;
    @api accountContacts = [];

    showLegalEntityFields(event) {
        this.isLegalEntity = true;
        this.accountContacts = [];
        let phisicalCheckbox = this.template.querySelector('[data-id="physicalPerson"]');

        if (!event.target.checked && !phisicalCheckbox.checked) {
            this.isSelected = false;
            this.isLegalEntity = false;
            this.accountFields = [];
        } else {
            for (let i = 0; i < this.accountFieldsTypes.data.length; i++) {
                if (this.accountFieldsTypes.data[i].RecordType.includes('Juridica')) {
                    this.recordType = this.accountFieldsTypes.data[i].RecordType;
                    this.accountFields = this.accountFieldsTypes.data[i].AccountFields;
                }
            }
            
            phisicalCheckbox.checked = false;
            this.isSelected = true;
        }
    }

    showPhysicalPersonFields(event) {
        this.isLegalEntity = false;
        this.accountContacts = [];
        let legalCheckbox = this.template.querySelector('[data-id="legalEntity"]');

        if (!event.target.checked && !legalCheckbox.checked) {
            this.isSelected = false;
            this.isLegalEntity = false;
            this.accountFields = [];
        } else {
            for (let i = 0; i < this.accountFieldsTypes.data.length; i++) {
                if (this.accountFieldsTypes.data[i].RecordType.includes('Fisica')) {
                    this.recordType = this.accountFieldsTypes.data[i].RecordType;
                    this.accountFields = this.accountFieldsTypes.data[i].AccountFields;
                }
            }

            legalCheckbox.checked = false;
            this.isSelected = true;
        }
    }

    handleCancel() {
        this.isSelected = false;
        this.isLegalEntity = false;

        this.template.querySelector('[data-id="legalEntity"]').checked = false;
        this.template.querySelector('[data-id="physicalPerson"]').checked = false;
        this.accountContacts = [];
        this.accountValues = [];
    }

    handleSave() {
        if (this.template.querySelector('[data-id="Name"]').value != null) {
            for (let i = 0; i < this.accountFields.length; i++) {
                let field = this.accountFields[i];
                let fieldValue = this.template.querySelector('[data-id="' + field + '"]').value;
                this.accountValues.push(field + ';' + fieldValue);
            }

            saveAccount({lstFieldValues: this.accountValues, recordType: this.recordType, contactList: JSON.stringify(this.accountContacts)})
            .then(result =>{
                if (result.HasError) {
                    console.log(result.ErrorMessage);
                    this.showToast("error", "Erro!", "Erro na criação da conta");
                } else {
                    this.showToast("success", "Sucesso!", "Conta criada");
                    this.handleCancel();
                }
            }).catch(error =>{
                this.showToast("error", "Erro!", "Erro na criação da conta");
            });
        } else {
            this.showToast("error", "Erro!", "O nome da conta é obrigatório");
        }
    }

    includeContact() {
        let contact = this.template.querySelector("c-contact-related-to-account").getContactValues();

        if (contact != null) {
            if (this.accountContacts.length > 0) {
                let newContact = {FirstName: contact[0].FirstName, LastName: contact[0].LastName, Phone: contact[0].Phone};
                this.accountContacts = this.accountContacts.concat(newContact);
            } else {
                this.accountContacts = [{FirstName: contact[0].FirstName, LastName: contact[0].LastName, Phone: contact[0].Phone}];
            }
        }
    }

    showToast(type, title, message) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: type
        });
        this.dispatchEvent(toastEvent);
    }

    @wire(saveAccount)
    accountResult({error, data}){
        if (data) {
            console.log('data');
        } else if (error) {
            console.log(error);
        }
    }
}