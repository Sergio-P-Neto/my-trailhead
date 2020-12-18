trigger CaseTrigger on Case (before insert, before update) {
    for (Case caso : trigger.new) {
        if (trigger.isInsert) {
            if (caso.ContactId == '' || caso.ContactId == NULL) {
                Contact contato = new Contact();
                contato.LastName = 'Trigger Name';
                insert contato;
                caso.ContactId = contato.Id;
            }
        }
        if (trigger.isUpdate) {
            if (caso.Status == 'New' || caso.Status == 'Working') {
                caso.Priority = 'High';
            }
        }
    }
}