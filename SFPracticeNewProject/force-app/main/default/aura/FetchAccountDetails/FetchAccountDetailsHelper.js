({
    /* 
     * Call Apex Methods.
     */
    callServer:function(component,method,params,callback) {
        var action = component.get(method);
        if (params) {
            action.setParams(params);
        }
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") { 
                // pass returned value to callback function
                callback.call(this,response.getReturnValue());   
            } else {
                // generic error handler
                //var errors = response.getError();
                alert("Internal Server Error")            ;
            }
        });
        $A.enqueueAction(action);
    },
    
	getAccountDefaultValues : function(component, event) {
		var Account = component.get("v.Account");
        var params = {AccountId:component.get("v.AccountId")};
        this.callServer(component, "c.getAccountDetails", params, function(response) {
            if(!$A.util.isEmpty(response)) {
                Account.Id = response.Id;
                Account.Name = response.Name;
                Account.ShippingCity = response.ShippingCity;
                Account.getsfpractice__SLASerialNumber__c = response.getsfpractice__SLASerialNumber__c;
                component.set("v.Account", Account);
            }
            
        });
	},
    
    saveAccountHelper : function(component, event, AccountId) {
        component.set("v.spinner",true);
        var params = ({
            "aId" : component.get("v.AccountId"),
            "sla" : component.get("v.Account.getsfpractice__SLASerialNumber__c")
        });    
        console.log("Test Param : " + params);
        this.callServer(component, "c.saveAccountDetails", params, function(response) {
            //if(!($A.util.isEmpty(response))){
            if(response) {
                component.set("v.spinner",false);
            	this.handleRedirection(component, event, response, "Account");
                alert("Account saved successfully!!!")
            } else {
                alert ("Account Save Failed due to errors. Please contact admin.");
                component.set("v.spinner",false);
            }
        });
    },
 
 	handleRedirection : function(component, event, Id, SObjectAction){
        var redirectEvent = $A.get("e.c:RedirectToUrl");
        redirectEvent.setParams({"redirectRecId":Id,"SObject":SObjectAction});
        redirectEvent.fire();
    }
})