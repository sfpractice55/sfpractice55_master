({    
      
    onInit : function( component, event, helper ) {    
          
        component.set( 'v.mycolumns', [    
            {label: 'Account Id', fieldName: 'Id', type: 'text', editable:'true'}, 
            {label: 'Account Name', fieldName: 'Name', type: 'text', editable:'true'},    
            {label: 'Industry', fieldName: 'Industry', type: 'text'},    
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', typeAttributes: {  
                day: 'numeric',  
                month: 'short',  
                year: 'numeric',  
                hour: '2-digit',  
                minute: '2-digit',  
                second: '2-digit',  
                hour12: true}},    
            {label: 'Type', fieldName: 'Type', type: 'Text'}    
        ]);    
        helper.fetchAccounts(component);  
          
    },  
      
    onSave : function( component, event, helper ) {   
          
        var updatedRecords = component.find( "acctTable" ).get( "v.draftValues" );  
        var action = component.get( "c.updateAccts" );  
        action.setParams({  
              
            'updatedAccountList' : updatedRecords  
              
        });  
        action.setCallback( this, function( response ) {  
              
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
  
                if ( response.getReturnValue() === true ) {  
                      
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    component.find( "acctTable" ).set( "v.draftValues", null );  
                      
                } else {   
                      
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                      
                }  
                  
            } else {  
                  
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                  
            }  
              
        });  
        $A.enqueueAction( action );  
          
    }  
      
})