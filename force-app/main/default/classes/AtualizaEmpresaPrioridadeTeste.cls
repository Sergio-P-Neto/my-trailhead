@isTest
public class AtualizaEmpresaPrioridadeTeste {
    @testSetup public static void empresaSetup() {
        Empresa__c empresa = new Empresa__c();
        empresa.Name = 'Empresa Teste';
        empresa.Numero_de_Funcionarios__c = 150;
        empresa.Tipo_Da_Empresa__c = 'Tecnologia';
        empresa.Prioridade_do_Cliente__c = 'Alta';
        empresa.Receita_Anual__c = 10000000;
        insert empresa;
        
        Empresa__c empresa2 = new Empresa__c();
        empresa2.Name = 'Empresa Teste 2';
        empresa2.Numero_de_Funcionarios__c = 122;
        empresa2.Tipo_Da_Empresa__c = 'Tecnologia';
        empresa2.Prioridade_do_Cliente__c = 'Baixa';
        empresa2.Receita_Anual__c = 15750000;
        insert empresa2;
        
        Empresa__c empresa3 = new Empresa__c();
        empresa3.Name = 'Empresa Teste 3';
        empresa3.Tipo_Da_Empresa__c = 'Varejo';
        empresa3.Receita_Anual__c = 1000000;
        insert empresa3;
        
        Empresa__c empresa4 = new Empresa__c();
        empresa4.Name = 'Empresa Teste 4';
        empresa4.Tipo_Da_Empresa__c = 'Varejo';
        empresa4.Receita_Anual__c = 100000;
        insert empresa4;
    }
    @isTest public static void alteraEmpresaPrioridade() {
        Test.startTest();
        AtualizaEmpresaPrioridade emp = new AtualizaEmpresaPrioridade();
        emp.empresaPrioridade();
        Test.stopTest();
    }
}