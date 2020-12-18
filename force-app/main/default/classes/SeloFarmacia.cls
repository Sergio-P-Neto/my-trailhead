public class SeloFarmacia {
    public integer seloFarmacia() {
        decimal valorCompra = 1500;
        boolean online = true;
        integer selos;
        if (online == true) {
            selos = (integer)valorCompra / 50;
            if (selos > 4) {
                selos = 4;
            }
        }
        System.debug('Você ganhou ' + selos + ' selos');
        return selos;
    }
}