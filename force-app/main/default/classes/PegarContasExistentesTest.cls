@isTest
public class PegarContasExistentesTest {
    @testSetup static void setupConta() {
        Account conta = new Account();
        conta.Name = 'Conta 2';
        insert conta;
    }
    @isTest static void criaConta() {
        PegarContasExistentes pgConta = new PegarContasExistentes();
        pgConta.criarContas();
    }
    @isTest static void atualizaConta() {
        PegarContasExistentes pgConta = new PegarContasExistentes();
        pgConta.atualizarContas();
    }
}