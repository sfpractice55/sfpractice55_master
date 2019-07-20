({  
      
    fetchAccounts : function( component ) {  
          
        var action = component.get( "c.fetchAccts" );  
        action.setCallback(this, function( response ) {    
              
            var state = response.getState();    
            if (state === "SUCCESS")     
                component.set( "v.acctList", response.getReturnValue() );                
              
        });    
        $A.enqueueAction(action);   
          
    },  
      
    toastMsg : function( strType, strMessage ) {  
          
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
              
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
              
        });   
        showToast.fire();   
          
    }  
      
})