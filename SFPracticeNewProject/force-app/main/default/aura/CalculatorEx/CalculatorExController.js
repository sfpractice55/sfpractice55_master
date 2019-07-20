({
    add : function(component, event, helper) {
        var no1 = component.get("v.Number1");
        console.log('Entered no 1 is : ' + no1);
        var no2 = component.get("{!v.Number2}");
        console.log('Entered no 2 is : ' + no2);
        var res = Number(no1) + Number(no2);
        console.log('Result is : ' + res);
        component.set("v.result", res);
        component.set("v.isCalculated",true);

    }, 
    subtract : function(component, event, helper) {
        var no1 = component.get("v.Number1");
        console.log('Entered no 1 is : ' + no1);
        var no2 = component.get("{!v.Number2}");
        console.log('Entered no 2 is : ' + no2);
        var res = Number(no1) - Number(no2);
        console.log('Result is : ' + res);
        component.set("v.result", res);
        component.set("v.isCalculated",true);
    },
    multiply : function(component, event, helper) {
        var no1 = component.get("v.Number1");
        console.log('Entered no 1 is : ' + no1);
        var no2 = component.get("{!v.Number2}");
        console.log('Entered no 2 is : ' + no2);
        var res = Number(no1) * Number(no2);
        console.log('Result is : ' + res);
        component.set("v.result", res);
        component.set("v.isCalculated",true);
    },
    division : function(component, event, helper) {
        var no1 = component.get("v.Number1");
        console.log('Entered no 1 is : ' + no1);
        var no2 = component.get("{!v.Number2}");
        console.log('Entered no 2 is : ' + no2);
        var res = Number(no1) / Number(no2);
        console.log('Result is : ' + res);
        component.set("v.result", res);
        component.set("v.isCalculated",true); 
    }
})