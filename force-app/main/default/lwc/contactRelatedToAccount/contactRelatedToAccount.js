import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME_OBJECT from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_OBJECT from '@salesforce/schema/Contact.LastName';
import PHONE_OBJECT from '@salesforce/schema/Contact.Phone';

export default class ContactRelatedToAccount extends LightningElement {
    contactObject = CONTACT_OBJECT;
    contactFields = [FIRST_NAME_OBJECT, LAST_NAME_OBJECT, PHONE_OBJECT];

    @api getContactValues() {
        if (this.template.querySelector('[data-id="LastName"]').value != null &&
            this.template.querySelector('[data-id="LastName"]').value != undefined &&
            this.template.querySelector('[data-id="LastName"]').value != '') {
            let contactValues = [{
                FirstName: this.template.querySelector('[data-id="FirstName"]').value,
                LastName: this.template.querySelector('[data-id="LastName"]').value,
                Phone: this.template.querySelector('[data-id="Phone"]').value
            }];

            this.template.querySelector('[data-id="FirstName"]').value = null;
            this.template.querySelector('[data-id="LastName"]').value = null;
            this.template.querySelector('[data-id="Phone"]').value = null;

            return contactValues;
        } else {
            const toastEvent = new ShowToastEvent({
                title: 'Erro!',
                message: 'O último nome é obrigatório',
                variant: 'error'
            });
            this.dispatchEvent(toastEvent);

            return null;
        }
    }
}