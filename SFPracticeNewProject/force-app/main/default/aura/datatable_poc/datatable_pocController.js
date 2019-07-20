({

   doInit: function(component, event, helper) {
      helper.getCaseList(component);
   },
    jsLoaded : function(component, event, helper){
        alert('changed '+component.get("v.oppCompleted"));
        helper.jsLoaded(component, event, helper);
    },
    record_clicked: function(component, event, helper){

        	alert(event.target.id);
    }

})