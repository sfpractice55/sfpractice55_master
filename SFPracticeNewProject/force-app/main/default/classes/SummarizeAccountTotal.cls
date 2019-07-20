global class SummarizeAccountTotal implements Database.Batchable<sObject>  {
	global final String query;
    global Map<Id, Account> accountMap;
    
    global SummarizeAccountTotal() {
        accountMap = new Map<Id, Account>();
    } 

    global Database.QueryLocator start(Database.BatchableContext BC) {
    	return Database.getQueryLocator(query);    
    }
    
    global void execute(Database.BatchableContext BC, list<sObject> scope) {
        System.debug('execute');
        List<Opportunity> ops = (List<Opportunity>) scope;
        
        for(Opportunity o : ops) {
            System.debug('o value : ' + o);
            if(accountMap.containsKey(o.AccountId)) {
                Account a = accountMap.get(o.AccountId);
                a.Test_Amount__c += o.Amount;
                System.debug('Log 1 : ' + o.Amount);
                System.debug('Log 2 : ' + a.Test_Amount__c);
                accountMap.put(o.AccountId, a);
            } else {
                accountMap.put(o.AccountId, new Account(Id = o.AccountId, Test_Amount__c = o.Amount));
            }
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        try {
            update accountMap.values();
        } catch (Exception ex) {
            System.debug('Ex : ' + ex);
        }   
    }
}