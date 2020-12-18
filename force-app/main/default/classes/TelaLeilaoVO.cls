public class TelaLeilaoVO {
    @AuraEnabled
    public Boolean lanceDisponivel {get;set;}

    @AuraEnabled
    public Double lanceValor {get;set;}

    @AuraEnabled
    public Double lanceIncremento {get;set;}

    @AuraEnabled
    public Integer lanceNumeros {get;set;}

    @AuraEnabled
    public String carroNome {get;set;}

    @AuraEnabled
    public Double carroKm {get;set;}

    @AuraEnabled
    public Double novoValor {get;set;}

    @AuraEnabled
    public Id idVeiculo {get;set;}

    @AuraEnabled
    public Id idLeilao {get;set;}

    @AuraEnabled
    public String teste {get;set;}

    @AuraEnabled
    public Id idContentDocument {get;set;}

}