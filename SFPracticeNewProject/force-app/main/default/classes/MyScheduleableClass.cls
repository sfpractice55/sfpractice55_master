global class MyScheduleableClass implements Schedulable{
    global void execute(SchedulableContext ctx) {
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                         	FROM CronTrigger
                         	WHERE Id =: ctx.getTriggerId()];
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        WH_Merchandise__c m = new WH_Merchandise__c(Name = 'Scheduled Job Item',
                                                   	WH_Description__c ='Created by Schedular',
                                                   	WH_Price__c = 1,
                                                   	WH_Quantity__c = 1000);
        insert m;        
    }
}