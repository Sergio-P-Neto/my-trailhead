@isTest
public class TriggerOpportunityTest {
    @isTest public static void testeOportunidade() {
        Opportunity oportunidade = new Opportunity();
        oportunidade.CloseDate = system.today();
        oportunidade.StageName = 'Qualification';
        oportunidade.Name = 'Teste';
        insert oportunidade;
        
        oportunidade.StageName = 'Closed Won';
        update oportunidade;
    }

}