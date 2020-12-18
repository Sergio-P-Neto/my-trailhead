({
	getInfos: function(component, fieldName) {
		var action = component.get("c.getInfos");
		var valores = [];
		action.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				var valorRetorno = response.getReturnValue();
				for (var i = 0; i < valorRetorno.length; i++) {
					valores.push({
						value: valorRetorno[i].Id,
						label : valorRetorno[i].Name
					});
				}
				component.set("v.options", valores);
			}else{
				alert('Error.');
			}
		});
		$A.enqueueAction(action);
	},

	alteraNomeConta: function(component, event, helper) {
		var action = component.get("c.alteraNomeController");
		var lstSelected = JSON.stringify(component.get("v.selected"));
		action.setParams({
			"lstAccountId": lstSelected
		});
		var valores = [];
		action.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				console.log('success');
			}else{
				alert('Error.');
			}
		});
		$A.enqueueAction(action);
	},
})