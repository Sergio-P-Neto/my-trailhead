public class PegarContasExistentes {
    public void criarContas() {
        List<Account> contas = new List<Account>();
        for(integer i = 0; i < 10; i++) {
        	Account conta = new Account();
            conta.Name = 'Conta ' + i;
            contas.add(conta);
        }
        Insert contas;
        System.debug(contas);
    }
    
    public void atualizarContas() {
        Account contaMod = [SELECT Id, Name FROM Account WHERE Name = 'Conta 2'];
        contaMod.Name = 'Conta Atualizada';
        update contaMod;
    }
    
}