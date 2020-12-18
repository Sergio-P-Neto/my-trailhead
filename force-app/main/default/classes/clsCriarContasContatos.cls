public class clsCriarContasContatos {
    public string gerarGrupo(string nomeCompleto) {
        if (nomeCompleto != '') {
        	Account conta = new Account();
            conta.Name = nomeCompleto;
            insert conta;
            List<string> nomeConta = nomeCompleto.split(' ');
            for(string nomeContato : nomeConta) {
                Contact contato = new Contact();
                contato.LastName = nomeContato;
                insert contato;
            }
        }
        return nomeCompleto;
    }

}