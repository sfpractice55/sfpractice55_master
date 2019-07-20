global class CleanUpRecords implements Database.Batchable<sObject>{
	global final String query;
    
    global CleanUpRecords(String q) {
        query = q;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        delete scope;
        Database.emptyRecycleBin(scope);
    }
    
    global void finish(Database.BatchableContext BC){
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems,
                       		CreatedBy.Email
                       	FROM AsyncApexJob
                       	WHERE Id =: BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddressess = new String[] {
            a.CreatedBy.Email
        };
        mail.setToAddresses(toAddressess);
        mail.setSubject('Record Clean Up Status: ' + a.Status);
        mail.setPlainTextBody('The batch apex job processed ' + a.TotalJobItems + 
                             	' batches with ' + a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}


// Create 250 Merchandise Records
/* 
WH_Merchandise__c[] ml = new List<WH_Merchandise__c>();
for(Integer i=0;i<250;i++){
	WH_Merchandise__c m = new WH_Merchandise__c(Name = 'Merchandise ' + i,
												WH_Description__c = 'Some description',
												WH_Price__c = 2,
												WH_Quantity__c = 100);
	ml.add(m);
}
insert ml;
*/
 
// Call Batch
/*
	String query = 'SELECT Id, CreatedDate ' +
    			' FROM WH_Merchandise__c ' +
    			' WHERE Name LIKE \'Merchandise%%%\''+ 
    			' AND Id Not In (SELECT WH_Merchandise__c ' +
    			' FROM WH_Line_Item__c)';
	System.debug('Query : ' + query);
	CleanUpRecords c = new CleanUpRecords(query);
	Database.executeBatch(c,100);
*/