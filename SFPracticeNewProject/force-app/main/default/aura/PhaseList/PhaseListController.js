({
    methodToGetPhase : function(component, event, helper) {
        var action = component.get("c.allPhasesRelatedToAgreement");
        action.setCallback(this, function(response) {
            component.set("v.phaseList", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
     addPhaseRow :function(component,event,helper){
        var phases = component.get("v.phaseList");
        phases.push({
            'Id' : ' ',
            'Name ':'',
            'sobjectType':'Account'
        });
        component.set("v.phaseList",phases);
    },
    removeDeletedRow : function(component,event,helper){
       var index = event.getParam("indexVar"); 
       var AllPhaseList = component.get("v.phaseList");
       AllPhaseList.splice(index, 1);
       component.set("v.phaseList",AllPhaseList);
    },
})