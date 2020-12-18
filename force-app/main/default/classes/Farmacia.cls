public class Farmacia {
    public decimal compraFarmacia(integer anoNasc, string clubeDesc, decimal valorCompra) {
	integer idade = Date.today().year() - anoNasc;
        decimal desconto = 0;
        decimal totalPagar = valorCompra;
        if ((idade < 18 || idade > 60) && clubeDesc == 's' && valorCompra > 2000) {
            desconto = valorCompra * 0.5;
            totalPagar = totalPagar - desconto;
            System.debug('O valor do desconto foi de: ' + desconto + '.O valor total da compra é de: ' + totalPagar);
        }
        else if (idade > 60 && clubeDesc == 's' && valorCompra > 1000) {
            desconto = valorCompra * 0.4;
            totalPagar = totalPagar - desconto;
            System.debug('O valor do desconto foi de: ' + desconto + '.O valor total da compra é de: ' + totalPagar);
        }
        else if (idade > 60 && (clubeDesc == 's' || valorCompra > 700)) {
            desconto = valorCompra * 0.3;
            totalPagar = totalPagar - desconto;
            System.debug('O valor do desconto foi de: ' + desconto + '.O valor total da compra é de: ' + totalPagar);
        }
        else if (idade > 65 || clubeDesc == 's' || valorCompra > 300) {
            desconto = valorCompra * 0.1;
            totalPagar = totalPagar - desconto;
            System.debug('O valor do desconto foi de: ' + desconto + '. O valor total da compra é de: ' + totalPagar);
        }
        return totalPagar;
    }
    public static decimal compraFarmaciaOnline(integer anoNasc, string clubeDesc, decimal valorCompra, string online) {
        integer idade = Date.today().year() - anoNasc;
        decimal desconto = 0;
        decimal totalPagar = valorCompra;
        if(idade > 60 || clubeDesc == 's' || online == 's') {
            desconto = valorCompra * 0.3;
            totalPagar = totalPagar - desconto;
            System.debug('O valor do desconto foi de: ' + desconto + '. O valor total da compra é de: ' + totalPagar);
        }
        return totalPagar;
    }    
}