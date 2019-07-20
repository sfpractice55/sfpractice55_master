trigger validateLeadOwnershipChange on Lead (after update) {
    public final String DELIMETTER = ';';
    List<GroupMember> queueMembers;
    List<String> lstProfile = new List<String>();
    Boolean isPermittedProfile = false;
    Boolean showValidationError = true;
    Id userProfileID = userinfo.getProfileId();
	Config__c permittedProfiles = Config__c.getInstance('ProfilesWithLeadReassignmentPermission');
    lstProfile = (permittedProfiles.Value__c).split(';');
    List<Profile> profileReassigned = new List<Profile>();
    profileReassigned = [SELECT Id, Name 
                         	FROM Profile
                        	WHERE name in : lstProfile];
    for(Profile p : profileReassigned) {
        if(p.id == userProfileID) {
            isPermittedProfile = true;
            break;
        }
    }
    
    if(!isPermittedProfile) {
        Id userId = userinfo.getUserId();
        queueMembers = [SELECT Id, GroupId, Group.Type 
                       		FROM GroupMember
                       		WHERE UserorGroupId=:userId 
                        	AND Group.Type = 'Queue'];
        
        for(Id id : Trigger.oldMap.keySet()) {
        	Lead oldLead = Trigger.oldMap.get(id);    
            Lead newLead = Trigger.newMap.get(id);
            String oldOwnerId = oldLead.ownerId;
            String newOwnerId = newLead.ownerId;
            if(oldOwnerId != newOwnerId) {
                if(oldOwnerId.subString(0,3).equals('005')) {
                    if(oldOwnerId != userId){
                    	Trigger.newMap.get(id).addError(Label.LeadOwnershipChangeValidationTriggerErrorMsg);
                    }       
                } else {
                    // Owner belongs to Queue/Group
                    if(queueMembers != null && queueMembers.size() > 0) {
                        for(GroupMember q : queueMembers) {
                            System.debug('Idsssss : ' + q.GroupId + ' ==== ' + oldOwnerId +' ==== ' + userId +' ==== ' + newOwnerId);
                            if(q.GroupId == oldOwnerId && userId == newOwnerId) {                                
                               	showValidationError = false; 
                                break;
                            }
                            
                            if(showValidationError) {
                            	Trigger.newMap.get(id).addError(Label.LeadOwnershipChangeValidationTriggerErrorMsg);    
                            }
                        }    
                    } 
                    // Owner does not belong to Queue/Group
                    else {
                        Trigger.newMap.get(id).addError(Label.LeadOwnershipChangeValidationTriggerErrorMsg);
                    }                        
                }                    
            }            
        }
        
        
        
        if(queueMembers.size() > 0 && queueMembers != null) {
            
        }
    }
}