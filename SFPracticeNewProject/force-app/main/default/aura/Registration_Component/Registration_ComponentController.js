/**
 * Created by gaura on 11/21/2017.
 */
({
    doSubmit : function(component, event, helper) {
        // accessing the value in attribute abc
        var initialABCValue = component.get("v.abc");
        if(initialABCValue == "true") {
            alert("Value is TRUE");
            // setting value of abc to false
            component.set("v.abc","false");
        } else {
            alert("Value is FALSE");
            // setting value of abc to true
            component.set("v.abc","true");
        }
    },

    onClickCheckBox: function(component, event, helper) {

        // Body of the function
        // Call function defined in helper;
        console.log("This text is from Controller Resource.");
        helper.onClickCheckBoxHelper(component, event);
    }
})