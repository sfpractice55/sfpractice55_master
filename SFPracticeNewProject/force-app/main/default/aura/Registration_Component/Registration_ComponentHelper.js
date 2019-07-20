/**
 * Created by gaura on 11/25/2017.
 */
({
    onClickCheckBoxHelper : function(component, event) {
        // BODY of helper
        // define your logic in this function;
        console.log("This text is from helper function.");
        var checkBoxValue = component.find("checkBox").get("v.checked");
        component.set("v.CheckBoxValue", checkBoxValue);
    }
})