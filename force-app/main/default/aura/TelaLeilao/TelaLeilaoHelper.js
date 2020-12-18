({
	getDados : function(component) {
		var action = component.get("c.getInfosLeilao");
		var valores = [];
		action.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				var valorRetorno = response.getReturnValue();
				component.set("v.leiloes", valorRetorno);
			}else{
				alert('Error.');
			}
		});
		$A.enqueueAction(action);
	},
})