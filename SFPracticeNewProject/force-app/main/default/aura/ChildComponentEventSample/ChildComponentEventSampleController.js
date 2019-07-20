({
    fireCompEvent : function(component, event, helper) {
        alert('Inside Javascript Code');
        var cmpEvent = component.getEvent("ComponentEventSample");
        cmpEvent.setParams({
            "message": "This value being passed on event fire and parameter got changed."
        });
        cmpEvent.fire();

    }
})