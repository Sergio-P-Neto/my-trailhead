trigger TriggerLeadProbability on Lead (before insert) {
    if (Trigger.new.size() >= 15) {
        List<Lead> lsLeads = Trigger.new;
        integer i = 0;
        integer sameName = 0;
        string leadName;
        for (Lead lead : Trigger.new) {
            if (lead.LastName == lsLeads[i].LastName) {
                sameName += 1;
                if (sameName == 15) {
                    Opportunity oportunidade = new Opportunity();
                    oportunidade.Probability = 50;
                    oportunidade.Name = lead.LastName;
                    oportunidade.StageName = 'Prospecting';
                    oportunidade.CloseDate = system.today();
                    insert oportunidade;
                    System.debug(oportunidade);
                }
            }
            i++;
        }
    }
}