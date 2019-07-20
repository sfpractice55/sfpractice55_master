public with sharing class AccountInsertActionInvocableMethod {
    @InvocableMethod(Label ='Insert Account' Description = 'Insert Account thru Flow')
    public static List<ID> insertAccounts(List<Account> lstAccount) {
        Database.SaveResult[] results = Database.insert(lstAccount);
        List<Id> accountIds = new List<Id>();
        for(Database.SaveResult result : results) {
            if(result.isSuccess()){
                accountIds.add(result.getId());        
            }
        }
        return accountIds;
    }

}