({
	createButtonDynamically : function(component, event, helper) {
		var db=component.find("newtag");
        $A.createComponent(
        	"ui:button",
            {
                "label":"New Button"+db.get("v.body").length,
                "press": component.getReference("c.showPressedButtonLabel")
            },
            function(bn)
            {
                var bdy=db.get("v.body");
                bdy.push(bn);
                db.set("v.body",bdy);
            }
        );
        
	},
    removeButtonDynamically : function(component, event, helper){
        component.find("newtag").set("v.body",[]);
    },
    showPressedButtonLabel : function(component, event, helper){
        alert('You pressed:'+event.getSource().get("v.label"));
    }
})