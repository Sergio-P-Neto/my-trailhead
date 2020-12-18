trigger CampaignTrigger on Campaign (before insert, before update) {
    
    if (trigger.isInsert) {
        for (Campaign campanha : trigger.new) {
            CampaignTriggerHelper ct = new CampaignTriggerHelper();
            ct.campanhaInsert(campanha);
        }        
    }
    if (trigger.isUpdate) {
        for (Campaign campanha : trigger.new) {
            CampaignTriggerHelper ct = new CampaignTriggerHelper();
            ct.campanhaUpdate(campanha);
        }
    }
}