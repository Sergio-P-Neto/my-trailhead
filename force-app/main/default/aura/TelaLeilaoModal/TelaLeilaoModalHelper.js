({
	showModal : function(component) {
		var modal = component.find("exampleModal");
		$A.util.removeClass(modal, 'hideDiv');
	},
	hideExampleModal : function(component) {
        var modal = component.find("exampleModal");
		$A.util.addClass(modal, 'hideDiv');
	},
	createLance : function(component) {
		var lance = component.get("v.infosLance");

		var action = component.get("c.createLanceLeilao");
		action.setParams({"telaLeilao" : lance});
		var valores = [];
		action.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				var valorRetorno = response.getReturnValue();
			}else{
				alert('Error.');
			}
		});
		$A.enqueueAction(action);
	}
})