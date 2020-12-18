public class CalculoImc extends Imc {
    public string condicao = '';
        
    public override string resultado(integer idade, decimal altura, decimal peso) {
        decimal imc = peso / (altura * altura);
        imc = imc.setScale(2);
            
        if (idade > 60) {
            if (imc < 22) {
                condicao = 'IMC igual a ' + imc + '- Baixo peso';
            }
            if (imc >= 22 && imc <= 27) {
                condicao = 'IMC igual a ' + imc + '- Peso normal';
            }
            if (imc > 27) {
                condicao = 'IMC igual a ' + imc + '- Obesidade';
            }
        } else {
            if (imc < 18.5) {
                condicao = 'IMC igual a ' + imc + '- Abaixo do peso';
            }
            if (imc >= 18.5 && imc < 25) {
                condicao = 'IMC igual a ' + imc + '- Peso normal';
            }
            if (imc >= 25 && imc < 30) {
                condicao = 'IMC igual a ' + imc + '- Sobrepeso';
            }
            if (imc >= 30) {
                condicao = 'IMC igual a ' + imc + '- Obesidade grau 1+';
            }
        }
        System.debug(condicao);
        return condicao;
    }
}