trigger testLoadTestA on TestA__c (before insert) {
    List<String> lstName = new List<String>();
    for(TestA__c s : Trigger.new) {
        lstName.add(s.name);	 
    }    
    System.debug('lstName : ' + lstName);
    testATrigger.validateRecord(lstName); 
}