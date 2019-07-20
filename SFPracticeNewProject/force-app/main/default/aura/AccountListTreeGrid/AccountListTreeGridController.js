({
    fetchAccounts : function(component, event, helper) {
        var columns = [
            {
                type: 'text',
                fieldName: 'Name',
                label: 'Account Name'
            },
            {
                type: 'text',
                fieldName: 'getsfpractice__ProductLevel__c',
                label: 'Product Level'
            },
            {
                type: 'text',
                fieldName: 'getsfpractice__ProductType__c',
                label: 'Product Type'
            },
            {
                type: 'lookup',
                fieldName: 'getsfpractice__Product_Hierarchy_Id__c',
                label: 'Product Hierarchy'
            },
            {
                type: 'name',
                fieldName: 'Name',
                label: 'Name'
            }
        ];
        component.set('v.gridColumns', columns);
        var action = component.get("c.fetchAccts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if ( state === "SUCCESS" ) {
                var data = response.getReturnValue();
                for ( var i=0; i<data.length; i++ ) {
                    data[i]._children = data[i]['Contacts'];
                    delete data[i].Contacts; 

                }
                component.set('v.gridData', data);
            }
        });
        $A.enqueueAction(action);
    }

})