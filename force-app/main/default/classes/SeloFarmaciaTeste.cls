@isTest
public class SeloFarmaciaTeste {
	@isTest static void seloFarmaciaTeste() {
        Test.startTest();
        integer totalSelos = SeloFarmacia.calculoSeloFarmacia();
        Test.stopTest();
    }
}