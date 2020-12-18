trigger TelaLeilaoTrigger on Lances_do_Leilao__c (after insert) {
    List<Leilao_de_Veiculos__e> lstLeilao = new List<Leilao_de_Veiculos__e>();
    for (Lances_do_Leilao__c lanceLeilao : Trigger.new) {
        Leilao_de_Veiculos__e leilao = new Leilao_de_Veiculos__e();
        leilao.Id_do_Veiculo__c = lanceLeilao.Veiculo__c;
        leilao.Valor_do_Veiculo__c = lanceLeilao.Valor__c;
        lstLeilao.add(leilao);
        System.debug(leilao);
    }
    EventBus.publish(lstLeilao);

}