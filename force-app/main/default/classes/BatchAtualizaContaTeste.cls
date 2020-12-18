@isTest
public class BatchAtualizaContaTeste {
    @isTest static void atualizaContaTeste() {
        List<Account> lstConta= new List<Account>();
        for(Integer i = 0; i < 200; i++) {
            Account acc = new Account();
            acc.Name = 'Name ' + i;
            acc.EstadoCivil__c = 'Solteiro';
            lstConta.add(acc);
        }
        insert lstConta;

        Test.startTest();

        BatchAtualizaConta conta = new BatchAtualizaConta();
        DataBase.executeBatch(conta);

        Test.stopTest();
    }
}