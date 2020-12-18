({
	doInit : function(component, event, helper) {
		helper.getDados(component);
	},
	abrirModal : function(component, event, helper) {
		var index = event.target.value;
		index = parseInt(index);
		var valorCarro = component.get("v.leiloes[" + index + "]");
		component.set("v.infosCarro", valorCarro);
		component.set("v.showModal", false);
		component.set("v.showModal", true);

		const empApi = component.find("empApi");
        var channel = '/event/Leilao_de_Veiculos__e';
		const replayId = -1;

        const callback = function (message) {
            var msg = JSON.stringify(message.data.payload.Message__c);
			console.log("Event Received : " + msg);
			console.log("index " + index);
			var lance = component.get("v.leiloes");
			component.set("v.leiloes[" + index + "].teste", "teste");
        };

        empApi.subscribe(channel, replayId, callback).then(function(newSubscription) {
			console.log("Número de lances " + valorCarro.lanceNumeros);
		});
	}
})