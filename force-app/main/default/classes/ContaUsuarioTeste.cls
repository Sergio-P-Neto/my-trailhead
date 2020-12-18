@isTest
public class ContaUsuarioTeste {
    @isTest public static void chamadoTeste() {
        User usuario = new User();
        usuario.Username = '48985ohn@khtcme.com';
        usuario.LastName = 'Teste';
        usuario.Email = 'aaaaaaa@gol.com';
        usuario.Alias = 'Teste';
        usuario.CommunityNickname = 'Teste';
        usuario.TimeZoneSidKey = 'America/Sao_Paulo';
        usuario.LocaleSidKey = 'pt_BR';
        usuario.EmailEncodingKey = 'ISO-8859-1';
        usuario.ProfileId = '00e2E000001Dx7eQAC';
        usuario.LanguageLocaleKey = 'pt_BR';
        insert usuario;
        
        Account conta = new Account();
        conta.Name = 'Teste';
        insert conta;
        
        Chamado__c chamado = new Chamado__c();
        chamado.Usuario__c = usuario.Id;
        chamado.Conta__c = conta.Id;
        chamado.DataHora_Inicio__c = date.today();
        insert chamado;
        
        chamado.Telefone__c = '111111111';
        update chamado;
    }

}