@isTest
public class CampaignTriggerTeste {
    @isTest static void campanhaTriggerTeste() {
        Campaign campanha = new Campaign();
        campanha.Name = 'Campanha Teste';
        campanha.IsActive = false;
        campanha.EndDate = date.today().addDays(-5);
        campanha.Type = 'Webinar';
		campanha.Status = 'In Progress';
        campanha.ExpectedRevenue = 100;
        insert campanha;
        
        campanha.Name = 'Campanha Teste 2';
        update campanha;
    }

}