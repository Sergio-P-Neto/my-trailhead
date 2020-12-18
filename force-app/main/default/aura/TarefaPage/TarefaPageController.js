({
	doInit : function(component, event, helper) {
		helper.getInfos(component, 'ParentId');
	},

	alteraNome : function(component, event, helper) {
        helper.alteraNomeConta(component, event, helper);
	},

	handleChange:function(component, event, helper) {
		var selectedOptionsList = event.getParam("value");
		component.set("v.selected", selectedOptionsList);
	}
})