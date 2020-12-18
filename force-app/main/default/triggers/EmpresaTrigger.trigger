trigger EmpresaTrigger on Empresa__c (before insert, before update) {
    List<Account> contas = [SELECT Id, Name, Phone, NumberOfEmployees FROM Account];
    for (Empresa__c empresa : trigger.new) {
        if (empresa.Conta__c != null || empresa.Conta__c == '') {
            if (empresa.Prioridade_do_Cliente__c == 'Alta') {
                for (Account conta : contas) {
                    if (conta.Id == empresa.Conta__c) {
                        empresa.Name = conta.Name;
                        empresa.Telefone_Celular__c = conta.Phone;
                        empresa.Numero_de_Funcionarios__c = conta.NumberOfEmployees;
                        
                    }
                }
            }
        }
    }
}