({
	doInit : function(component, event, helper) {
        if(component.get("v.openMode")=="New") {
            helper.getAccountDefaultValues(component, event);
        }		
	},
    
    saveAccount : function(component, event, helper) {  
        var AccountId = component.get("v.AccountId");
    	helper.saveAccountHelper(component, event, AccountId);
	}
})