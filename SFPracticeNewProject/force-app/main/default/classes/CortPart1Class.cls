public class CortPart1Class {
    private static boolean run = true;
       
    public static void updateZipCode(Map<Id, getsfpractice__TestA__c> testAMap) {
        List<getsfpractice__TestA__c> lstStr = new List<getsfpractice__TestA__c>();
        System.debug('testAMap : ' + testAMap);
        List<getsfpractice__TestA__c> lstTestA = [SELECT Id, Name, getsfpractice__ZipCode__c FROM getsfpractice__TestA__c WHERE Id IN : testAMap.keySet()];
        System.debug(lstTestA);
        for(getsfpractice__TestA__c tA : lstTestA) {
            tA.getsfpractice__ZipCode__c = '30005';
            lstStr.add(tA);
        }
        //update lstStr;
    }
    
    public static boolean runOnce() {	 
        if(run) {
            run = false;
            return true;
        } else {
            return run;
        }
    }
}