({
	doInit : function(component, event, helper) {
        //STEP 1: Calling Apex Controller Method
		var action = component.get("c.getContactList");
        var aid = component.get('v.recordId');
        //STEP 2: Setting Parameter
        action.setParams({
            'accId' : aid
        });
        console.log(component.get("v.recordId"));
        //STEP 4: Callback Response
        action.setCallback(this, function(response) {
        	var state = response.getState();
        	if(state == "SUCCESS") { 
            	var contactVal = response.getReturnValue();
                component.set("v.contactList", contactVal);
        	} else if (state == "INCOMPLETE") {
                // do something
            } else if (state == "ERROR") {
                var errors = response.getError();
                if(errors) {
                    if(errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    } 
                } else {
                    console.log("Unknown error");
                }
            }
        });
        //STEP 3: Invoke/Enqueue action to execute component controller method/action.
        $A.enqueueAction(action);
    },
    gotoContactDetail : function(component, event, helper) {
        var eventSource = event.getSource();
        var modalBody; 
        console.log("Event Source : " + eventSource);
        var conId = eventSource.get("v.name"); 
        console.log("Contact Id : " + conId);
        
        
        // STEP 1: Get Navigation Object
        var navEvent = $A.get("e.force:editRecord"); //$A.get("e.force:navigateToSObject");
        // STEP 2: Set Attribute for Navigation
        navEvent.setParams({
            "recordId" : conId//,
            //"slideDevName" : "detail"
        });
        // STEP 3: Fire the Event
        navEvent.fire();
    },

    createContact : function(component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName" : "Contact"
        });
        createRecordEvent.fire();
    }, 

    refresh : function(component, event, helper) {
        var action = component.get('c.saveContact');
        action.setCallback(component, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS') {
                $A.get('e.force:refreshView').fire();
            } else {

            }
        });
        $A.enqueueAction(action);
    }
})