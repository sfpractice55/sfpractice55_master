@isTest
public class TestMySchedulableClass {
	public static String CRON_EXP = '16 20 0 15 2 ? 2015';
    
    static testMethod void test() {
        Test.startTest();
        String jobId = System.schedule('ScheduleApexClassTest', CRON_EXP, new MyScheduleableClass());
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                         	FROM CronTrigger
                         	WHERE Id =: jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2015-02-15 16:15:00', String.valueOf(ct.NextFireTime));
        
        WH_Merchandise__c[] ml = [SELECT Id 
                                 	FROM WH_Merchandise__c
                                 	WHERE Name = 'Scheduled Job Item'];
        System.assertEquals(ml.size(), 0);
        Test.stopTest();
        ml = [SELECT Id 
               FROM WH_Merchandise__c
               WHERE Name = 'Scheduled Job Item'];
        System.assertEquals(ml.size(), 1);
        
        
    }
}