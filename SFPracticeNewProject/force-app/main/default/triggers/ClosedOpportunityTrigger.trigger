trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
	List<Task> tskList = new List<Task>();    
    for(Opportunity o : Trigger.new) {
        if(o.StageName == 'Closed Won') { 
            Task t = new Task();
            t.subject = 'Follow Up Test Task';
            t.Status = 'Not Started';
            t.Priority = 'Normal';
            t.WhatId = o.id;
            tskList.add(t);
        }        
    }
    insert tskList;    
}