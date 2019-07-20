trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
	List<Id> lstSessionSpeakerId = new List<Id>();
    for(Session_Speaker__c ss : trigger.new) {
        lstSessionSpeakerId.add(ss.id);
    }
    
    List<Session_Speaker__c> lstSessionSpeaker = new List<Session_Speaker__c>();
    lstSessionSpeaker = [SELECT Session__r.Name,
								Session__r.Session_Date__c,
                        		Speaker__r.First_Name__c,
								Speaker__r.Last_Name__c,
                        		Speaker__r.Email__c
						FROM Session_Speaker__c WHERE Id IN :lstSessionSpeakerId];
    
    if(lstSessionSpeaker.size() > 0) {
        Session_Speaker__c sessionSpeaker =  lstSessionSpeaker[0];
        if(sessionSpeaker.Speaker__r.Email__c != null) {
            String address = sessionSpeaker.Speaker__r.Email__c;
			String subject = 'Speaker Confirmation';
			String message = 'Dear ' + sessionSpeaker.Speaker__r.First_Name__c +
                ',\nYour session "' + sessionSpeaker.Session__r.Name + '" on ' +
				sessionSpeaker.Session__r.Session_Date__c + ' is confirmed.\n\n' +
				'Thanks for speaking at the conference!';
			EmailManager.sendMail(address, subject, message);
        }
    }
}