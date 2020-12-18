@isTest
public class CaseTriggerTeste {
    @isTest static void caseSetup() {
        Case caso = new Case();
        caso.Status = 'Escaleted';
        caso.Origin = 'Phone';
        insert caso;
        
        caso.Status = 'New';
        update caso;
    }
}