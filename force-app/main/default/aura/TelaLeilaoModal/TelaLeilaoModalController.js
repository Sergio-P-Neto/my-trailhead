({
	doInit : function(component, event, helper) {
		var lance = component.get("v.infosLance");
		console.log(lance);
		var valorLance = lance.lanceIncremento + lance.lanceValor;
		console.log(valorLance);
		component.set("v.infosLance.novoValor", valorLance);
		
		helper.showModal(component);
	},
	
	hideExampleModal : function(component, event, helper) {
		var valor = event.target.value;
		valor = parseInt(valor);

		const empApi = component.find("empApi");
        var channel = "/event/Leilao_de_Veiculos__e";
        const replayId = -1;

		if (valor == 1) {
			var lance = component.get("v.infosLance");
			console.log(lance.novoValor);
			
			var valorLance = lance.lanceIncremento + lance.lanceValor;
			component.set("v.infosLance.lanceValor", valorLance);
			var quantidadeLances = lance.lanceNumeros + 1;
			component.set("v.infosLance.lanceNumeros", quantidadeLances);

			component.set("v.infosLance.lanceDisponivel", false);

			helper.createLance(component);
		}
		helper.hideExampleModal(component);
	},
})