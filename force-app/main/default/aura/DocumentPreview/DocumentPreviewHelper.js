({
	getAttachments : function(component) {
		var action = component.get("c.registerAttachments");
		action.setParams({"registerId" : component.get("v.recordId")});
		action.setCallback(this, function(response) {
			if (response.getState() == "SUCCESS") {
				var valorRetorno = response.getReturnValue();
				component.set("v.imagesIds", valorRetorno);
			}else{
				console.log('Error.');
			}
		});
		$A.enqueueAction(action);
	}
})