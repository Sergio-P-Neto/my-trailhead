global class BatchAtualizaConta implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name FROM Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> contas) {
        for(Account conta : contas) {
            conta.Name = 'Conta atualizada: ' + conta.Name;
        }
        update contas;
    }
    global void finish(Database.BatchableContext BC) {
    }
}