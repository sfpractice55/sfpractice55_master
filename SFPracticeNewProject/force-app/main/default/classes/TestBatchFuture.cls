global class TestBatchFuture implements Database.batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name FROM Account Limit 10';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        System.debug('Batch execute method');
        Integer i = 0;
        for(Account acc : scope ) {
            i = i + 1;
            System.debug('Account Number : ' + i);
            System.debug('Account : ' + String.valueOf(i) + ' ' + acc.Name);
            TestFutureController.callingFutureMethod();
        }
    }
    
    global void finish(Database.BatchableContext BC) {
    	
    }
}