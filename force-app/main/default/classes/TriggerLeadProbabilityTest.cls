@isTest
public class TriggerLeadProbabilityTest {
    @isTest public static void leadProbabilityTest() {
        List<Lead> lsLeads = new List<Lead>();
        for (integer i = 0; i < 15; i++) {
            Lead lead = new Lead();
        	lead.LastName = 'Teste Lead';
            lead.Company = 'Empresa Teste';
            lsLeads.add(lead);
        }
        insert lsLeads;
    }
}