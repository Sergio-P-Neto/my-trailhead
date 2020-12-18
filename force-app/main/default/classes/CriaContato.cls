public class CriaContato {
    public Contact criaContato(String name) {
        Contact contato = new Contact();
        try {
            Account conta = [SELECT Id, Name, Phone FROM Account WHERE Name =: name];
            contato.FirstName = conta.Name;
            contato.Phone = conta.Phone;
            contato.LastName = '1';
            insert contato;
            System.debug('Contato inserido sem erro!');
        } catch(DmlException e) {
            System.debug('Ocorreu um erro: ' + e.getMessage());
        } finally {
            System.debug('Corrija o erro se necessário');
        }
        return contato;
    }
}