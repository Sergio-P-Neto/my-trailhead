trigger ContaUsuario on Chamado__c (before insert, before update, after insert) {
    if (trigger.isBefore) {
        if (trigger.isUpdate) {
            for (Chamado__c chamado : trigger.new) {
                for (List<Chamado__c> chamados : [SELECT Id, Usuario__c FROM Chamado__c WHERE Usuario__c =: chamado.Usuario__c]) {
                    chamado.Qtd_Chamados__c = chamados.size();
                }
            }
        }
        if (trigger.isInsert) {
            for (Chamado__c chamado : trigger.new) {
                for (List<Chamado__c> chamados : [SELECT Id, Usuario__c FROM Chamado__c WHERE Usuario__c =: chamado.Usuario__c]) {
                    chamado.Qtd_Chamados__c = chamados.size() + 1;
                }
            }
        }
    }
    if (trigger.isAfter) {
        if (trigger.isInsert) {
            ContaUsuarioHelper ch = new ContaUsuarioHelper();
            ch.criaTarefa(Trigger.new);
        }
    }
}