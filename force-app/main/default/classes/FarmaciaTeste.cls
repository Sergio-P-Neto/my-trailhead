@isTest
public class FarmaciaTeste {
    @isTest static void compraFarmaciaTeste() {
        Test.startTest();
        integer dataNasc = 1950;
        string clubeDesc = 's';
        decimal valorCompra = 2500;
        decimal totalPagar = Farmacia.compraFarmacia(dataNasc, clubeDesc, valorCompra);
        Test.stopTest();
    }
    @isTest static void compraFarmaciaTeste2() {
        Test.startTest();
        integer dataNasc = 1950;
        string clubeDesc = 's';
        decimal valorCompra = 1500;
        decimal totalPagar = Farmacia.compraFarmacia(dataNasc, clubeDesc, valorCompra);
        Test.stopTest();
    }
    @isTest static void compraFarmaciaTeste3() {
        Test.startTest();
        integer dataNasc = 1950;
        string clubeDesc = 's';
        decimal valorCompra = 50;
        decimal totalPagar = Farmacia.compraFarmacia(dataNasc, clubeDesc, valorCompra);
        Test.stopTest();
    }
    @isTest static void compraFarmaciaTeste4() {
        Test.startTest();
        integer dataNasc = 1990;
        string clubeDesc = 'n';
        decimal valorCompra = 1500;
        decimal totalPagar = Farmacia.compraFarmacia(dataNasc, clubeDesc, valorCompra);
        Test.stopTest();
    }
    @isTest static void compraFarmaciaOnlineTeste() {
        Test.startTest();
        integer dataNasc = 2000;
        string clubeDesc = 's';
        decimal valorCompra = 250;
        string online = 's';
        decimal totalPagar = Farmacia.compraFarmaciaOnline(dataNasc, clubeDesc, valorCompra, online);
        Test.stopTest();
    }
}