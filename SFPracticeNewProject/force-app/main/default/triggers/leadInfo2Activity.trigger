trigger leadInfo2Activity on Lead (after insert, before update) {
    if (!Trigger.isUpdate) {
        Map<Id, Lead> leadMap = new Map<Id, Lead>([SELECT Id, Description
                                                    FROM Lead
                                                    WHERE Id IN : Trigger.newMap.keySet()]);
        List<Lead> updateTableList = new List<Lead>();
        List<Task> newTaskList = new List<Task>();
        for (Lead l : Trigger.new) {
            if ((l.LeadSource != null) && (l.LeadSource.equalsIgnoreCase('Web') || l.LeadSource.equalsIgnoreCase('Phone Inquiry'))) {
                Task newTask = new Task();
                newTask.Subject = 'Fuel Created Task';
                newTask.Description = l.Description;
                newTask.WhoId = l.Id;
                newTaskList.add(newTask);

                if (leadMap != null && leadMap.containsKey(l.Id)) {
                    leadMap.get(l.Id).Description = '';
                    updateTableList.add(leadMap.get(l.Id));
                }
            }
        }
        try {
            if (updateTableList != null) {
                update(updateTableList);
            }

            if (newTaskList != null) {
                insert newTaskList;
            }
        } catch (Exception e) {
            System.debug('## Error ' + e);
        }
    } else {
		List<Task> updatableTaskQueryList = new List<Task>([SELECT Id, WhoId, OwnerId
                                                      	FROM Task
                                                      	WHERE WhoId IN : Trigger.oldMap.keySet()
                                                      	AND Subject = 'Fuel Created Task'
                                                      	AND Status != 'Completed']);
            Map<Id, Task> updateTaskMap = new Map<Id, Task>();
        List<Task> updateNewTaskList = new List<Task>();
        
        for(Task t : updatableTaskQueryList) {
            try {
                updateTaskMap.put(t.WhoId, t);
            } catch(Exception e) {
                System.debug('Error updating task for user :: User ID = ' + task.whoid + ' ::::' + e);
            }
        }
        
        for(Lead l: Trigger.new) {
            if(Trigger.oldMap.containsKey(l.id) &&  Trigger.oldMap.get(l.id).OwnerId != null && Trigger.oldMap.get(l.id).OwnerId != l.OwnerId) {
                if(updateTaskMap != null && updateTaskMap.containsKey(l.id) != null) {
                    if(String.valueOf(Trigger.oldMap.get(l.id).OwnerId).indexOf('00G') == null) {
                        updateTaskMap.get(l.id).OwnerId = l.OwnerId;
                        updateNewTaskList.add(updateTaskMap.get(l.Id));
                    }
                }
            }
        }
        try {
        	if(updateNewTaskList.size() > 0) {
            	update updateNewTaskList;
        	}    
        } catch(Exception e) {
             System.debug('Error updating task for lead :::: ' + e);
        }
        
    }
}