({
    getCaseList: function(component, event, helper) {
    var action = component.get("c.getCases");
    var self = this;
    action.setCallback(this, function(actionResult) {
        component.set("v.accs", actionResult.getReturnValue());
        component.set("v.totalRec",actionResult.getReturnValue().length);

        setTimeout(function() {
                 $('#sampleTable').DataTable({
               "ordering": true,

            "preDrawCallback": function( settings ) {

                $('.odd').remove();
                $('.even').remove();
            }
        });
    }, 2000);
       // this.jsLoaded(component, event, helper)

    });
    $A.enqueueAction(action);
  },
     jsLoaded: function(component, event, helper) {
      //  alert();
        $('#sampleTable').DataTable({
               "ordering": true,

            "preDrawCallback": function( settings ) {
              //  $('.odd').hide();
               // $('.even').hide();
           //  alert('');
                $('.odd').remove();
                $('.even').remove();
            }
        });

    }
})