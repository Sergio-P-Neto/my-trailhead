@isTest
public class CalculadoraTeste {
    @isTest static void somaTeste() {
        Test.startTest();
        decimal num1 = 10;
    	decimal num2 = 5;
        decimal resultadoSoma = Calculadora.soma(num1, num2);
        System.assertEquals(15, resultadoSoma);
        Test.stopTest();
    }
    @isTest static void subtracaoTeste() {
        Test.startTest();
        decimal num1 = 10;
    	decimal num2 = 5;
        decimal resultadoSubtracao = Calculadora.subtracao(num1, num2);
        System.assertEquals(5, resultadoSubtracao);
        Test.stopTest();
    }
    @isTest static void divisaoTeste() {
        Test.startTest();
        decimal num1 = 10;
    	decimal num2 = 5;
        decimal resultadoDivisao = Calculadora.divisao(num1, num2);
        System.assertEquals(2, resultadoDivisao);
        Test.stopTest();
    }
    @isTest static void multiplicacaoTeste() {
        Test.startTest();
        decimal num1 = 10;
    	decimal num2 = 5;
        decimal resultadoMultiplicacao = Calculadora.multiplicacao(num1, num2);
        System.assertEquals(50, resultadoMultiplicacao);
        Test.stopTest();
    }
}