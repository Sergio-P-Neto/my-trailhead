public class TelaLeilaoController {
    @AuraEnabled
    public static List<TelaLeilaoVO> getInfosLeilao() {
        List<TelaLeilaoVO> lstTelaLeilao = new List<TelaLeilaoVO>();
        Set<Id> setIdVeiculo = new Set<Id>();

        List<Veiculo__c> lstVeiculo = [SELECT Id, Marca__c, Modelo__c, Ano_Modelo__c, Cor__c, KM__c, Valor_Base_Leilao__c,
                                    Leilao__r.Data_Inicio__c, Leilao__r.Data_Fim__c, Leilao__r.Incremento_Minimo__c 
                                    FROM Veiculo__c WHERE Leilao__r.Data_Inicio__c <= today AND Leilao__r.Data_Fim__c >= today];

        for (Veiculo__c veiculo : lstVeiculo) {
            TelaLeilaoVO telaLeilao = new TelaLeilaoVO();
            telaLeilao.lanceIncremento = veiculo.Leilao__r.Incremento_Minimo__c;
            telaLeilao.lanceValor = veiculo.Valor_Base_Leilao__c;
            telaLeilao.carroNome = veiculo.Marca__c + ' ' + veiculo.Modelo__c + ' - ' + veiculo.Ano_Modelo__c;
            telaLeilao.carroKm = veiculo.KM__c;
            telaLeilao.lanceDisponivel = true;
            telaLeilao.lanceNumeros = 0;
            telaLeilao.idVeiculo = veiculo.Id;
            telaLeilao.idLeilao = veiculo.Leilao__r.Id;
            
            List<ContentDocumentLink> contentDocument = [SELECT Id, LinkedEntityId, ContentDocumentId FROM ContentDocumentLink 
                                                        WHERE LinkedEntityId =: veiculo.Id];
            if (!contentDocument.isEmpty()) {
                telaLeilao.idContentDocument = contentDocument[0].ContentDocumentId;
            }

            lstTelaLeilao.add(telaLeilao);
            setIdVeiculo.add(veiculo.Id);
        }

        return lstTelaLeilao;
    }
    @AuraEnabled
    public static void createLanceLeilao(TelaLeilaoVO telaLeilao) {
        System.debug('telaLeilao' + telaLeilao);
        Lances_do_Leilao__c lance = new Lances_do_Leilao__c();
        lance.Name = 'Lance ' + telaLeilao.lanceNumeros + ' ' + telaLeilao.carroNome;
        lance.Data_Hora__c = System.now();
        lance.Veiculo__c = telaLeilao.idVeiculo;
        lance.Valor__c = telaLeilao.novoValor;
        lance.Leilao__c = telaLeilao.idLeilao;
        insert lance;
        System.debug(lance);
    }

}