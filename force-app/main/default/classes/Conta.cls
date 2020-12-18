public class Conta {
    public static void calculadoraMetodos(){
        decimal soma = Calculadora.soma(10, 5);
        System.debug('Soma: ' + soma);
        
        decimal subtracao = Calculadora.subtracao(10, 5);
        System.debug('Subtração: ' + subtracao);
        
        decimal divisao = Calculadora.divisao(10, 5);
        System.debug('Divisão: ' + divisao);
        
        decimal multiplicacao = Calculadora.multiplicacao(10, 5);
        System.debug('Multiplicação: ' + multiplicacao);
    }
}