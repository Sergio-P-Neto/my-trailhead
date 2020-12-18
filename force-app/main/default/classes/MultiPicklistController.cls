public class MultiPicklistController {
    @AuraEnabled
    public static List<Account> getInfos() {
        
        List<Account> lstAccount = [SELECT Id, Name FROM Account];
        return lstAccount;
    }

    @AuraEnabled
    public static void alteraNomeController(String lstAccountId) {
        Set<Id> lstContaId = (Set<Id>)JSON.deserialize(lstAccountId, Set<Id>.class);
        List<Account> contas = new List<Account>();
        List<Account> lstContas = [SELECT Id, Name FROM Account WHERE Id in: lstContaId];
        for (Account conta : lstContas) {
            conta.Name = 'Nome alterado';
            contas.add(conta);
        }
        if (!contas.isEmpty()) {
            update contas;
        }

    }
}