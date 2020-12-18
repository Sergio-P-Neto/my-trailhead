trigger TriggerOpportunity on Opportunity (before update) {
    for (Opportunity oportunidade : Trigger.new) {
        for (Opportunity oportunidade2 : Trigger.old) {
            if (oportunidade.StageName == 'Closed Won' && oportunidade2.StageName == 'Qualification') {
                oportunidade.OrderNumber__c = '999999999';
            }
        }
    }
}