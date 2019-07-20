trigger TestGaurav1 on Account (before update) {
    
    List<Account> lstAccount = new List<Account>();
    if(trigger.isBefore) {
        if(trigger.isUpdate) {
            
            for(Account la : trigger.new) {
                la.getsfpractice__Gender__c = 'Male';
                //lstAccount.add(la);
            }
        }
    }
    //update lstAccount;    
}