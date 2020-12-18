public class BancoDoNeto {
    public void pessoaFisica(RecordType fisica) {
        Account conta = [SELECT Id, Name, RecordTypeId FROM Account WHERE RecordType.Name = 'Pessoa Física'];
    }
    public void pessoaJuridica(RecordType juridica) {
        Account conta = [SELECT Id, Name, RecordTypeId FROM Account WHERE RecordType.Name = 'Pessoa Jurídica'];
    }

}