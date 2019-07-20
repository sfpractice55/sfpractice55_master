public class testATrigger {
    public testATrigger() {
        System.debug('A');
    }
    
    List<String> lstTestAName = new List<String>();
    List<String> newLstTestAName = new List<String>();
    public static void validateRecord(List<String> lstStrNewName) {    
        System.debug('lstStrNewName : ' + lstStrNewName);
        Integer i = [SELECT Count() FROM TestA__c WHERE Name = : lstStrNewName];
        if(i>0) {
            System.debug('Count of SOQL : ' + i );
        }
        
       System.debug('Currrent Limit : ' + Limits.getQueries());
        System.debug('Total Limit : ' + Limits.getLimitQueries());
         
        
         
    }
}