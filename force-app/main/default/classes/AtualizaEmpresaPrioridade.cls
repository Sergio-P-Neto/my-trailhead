public class AtualizaEmpresaPrioridade {
    public List<Empresa__c> empresaPrioridade() {
        List<Empresa__c> empresas = [SELECT Id, Name, Receita_Anual__c, Tipo_Da_Empresa__c, Prioridade_do_Cliente__c FROM Empresa__c ORDER BY Name LIMIT 50];
        if (!empresas.isEmpty()) {
            for (Empresa__c empresa : empresas) {
                System.debug(empresa);
                if (empresa.Receita_Anual__c > 15500000) {
                    empresa.Prioridade_do_Cliente__c = 'Alta';
                    update empresa;
                }
                else if (empresa.Receita_Anual__c > 5000000) {
                    empresa.Prioridade_do_Cliente__c = 'Média';
                    update empresa;
                } 
                else if (empresa.Receita_Anual__c > 500000) {
                    empresa.Prioridade_do_Cliente__c = 'Baixa';
                    update empresa;
                } else {
                    delete empresa;
                }
            }
        }
        System.debug(empresas);
        return empresas;
    }
}