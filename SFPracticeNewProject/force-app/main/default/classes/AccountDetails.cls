public with sharing class AccountDetails {
    @AuraEnabled
    public static Account getAccountDetails(string AccountId) {
        Account acc = new Account();
        try {
            acc = [SELECT Id, Name, ShippingCity, getsfpractice__SLASerialNumber__c FROM Account WHERE Id=: AccountId LIMIT 1];
        } catch(Exception ex) {
            System.debug('Error');
        }
        return acc;
    }
    
    @AuraEnabled
    public static boolean saveAccountDetails(string aId, string sla) {
		Id AccountId;
        System.debug('Print Aid : ' + aId + sla);
        Account ac = new Account();
        ac = [SELECT Id, Name, ShippingCity, getsfpractice__SLASerialNumber__c FROM Account WHERE Id=: aId LIMIT 1];
        ac.getsfpractice__SLASerialNumber__c = sla;
        System.debug('Print AC : ' + ac);
        Database.SaveResult updRes = Database.update(ac);
                if(updRes.isSuccess()){
                    updRes.getID();
                }
                else{
                    for(DataBase.Error err : updRes.getErrors()){
                        err.getMessage();
                    }
                }
        AccountId = ac.id;        
        //return AccountId;
        return true;
    }
}