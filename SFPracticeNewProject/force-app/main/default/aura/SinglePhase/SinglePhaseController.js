({
	removePhaseRow : function(component, event, helper){
   		$A.get("e.c:DeletePhaseEvt").
   		setParams({ "indexVar" : component.get("v.rowIndex")}).fire();
       
	},
})