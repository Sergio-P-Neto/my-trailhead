@isTest
public class EmpresaTriggerTeste {
    @isTest static void empresaTeste() {
		Account conta = new Account();
        conta.Name = 'Teste';
        conta.Phone = '123456789';
        conta.NumberOfEmployees = 12;
        insert conta;
        
        Empresa__c empresa = new Empresa__c();
        empresa.Conta__c = conta.Id;
        empresa.Name = conta.Name;
        empresa.Telefone_Celular__c = conta.Phone;
        empresa.Tipo_Da_Empresa__c = 'Administração';
        empresa.Prioridade_do_Cliente__c = 'Alta';
        empresa.Receita_Anual__c = 1234567;
        insert empresa;
    }
}