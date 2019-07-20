trigger testUpdTrigger on Speaker__c (before insert, before update) {

	for(Speaker__c ss : trigger.new) {
		System.debug('ss : ' + ss);
		ss.Last_Name__c = 'GG_NEW';
		System.debug('ss.Last_Name__c : ' + ss.Last_Name__c);	
		//update ss;

	}
	
}