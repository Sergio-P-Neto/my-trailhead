@isTest
public class ImcTeste {
    @isTest static void resultadoTeste1() {
        Test.startTest();
        integer idade = 32;
        decimal altura = 1.67;
        decimal peso = 69;
        CalculoImc ci = new CalculoImc();
        ci.resultado(idade, altura, peso);
        Test.stopTest();
    }
	@isTest static void resultadoTeste2() {
        Test.startTest();
        integer idade = 70;
        decimal altura = 1.7;
        decimal peso = 70;
        CalculoImc ci = new CalculoImc();
        ci.resultado(idade, altura, peso);
        Test.stopTest();
    }
}