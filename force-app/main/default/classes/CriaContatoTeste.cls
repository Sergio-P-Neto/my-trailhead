@isTest
public class CriaContatoTeste {
    @testSetup static void contatoSetup() {
        Account conta1 = new Account();
        conta1.Name = 'Conta Teste';
        conta1.Phone = '1234567890';
        conta1.EstadoCivil__c = 'Solteiro';
        insert conta1;
        System.debug(conta1);
    }
    @isTest public static void criaContatoTeste() {
        Account conta2 = [SELECT Id, Name, Phone FROM Account];
        Test.startTest();
        CriaContato cc = new CriaContato();
        cc.criaContato(conta2.Name);
        Test.stopTest();
    }
}