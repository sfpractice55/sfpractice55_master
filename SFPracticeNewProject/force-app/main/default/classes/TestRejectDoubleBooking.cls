@isTest
private class TestRejectDoubleBooking {
    static testMethod void TestSingleBooking() {
        DateTime now = System.now();
        
        Speaker__c speaker = new Speaker__c(First_Name__c = 'John', Last_Name__c = 'Smith111');
        insert speaker;
        
        Session__c session = new Session__c(Name = 'Some Session', Session_Date__c = now);
        insert session;
        
        Session_Speaker__c assignment = new Session_Speaker__c(Session__c = session.id, Speaker__c = speaker.id);
        
        Database.SaveResult result = Database.insert(assignment, false);
        
        System.assert(result.isSuccess());
    }
    
    static testMethod void TestDoubleBooking() {
        DateTime now = System.now();
        
        Speaker__c speaker = new Speaker__c(First_Name__c = 'John', Last_Name__c = 'Smith111');
        insert speaker;
        
        Session__c session1 = new Session__c(Name = 'Some Session 1', Session_Date__c = now);
        insert session1;
        
        Session__c session2 = new Session__c(Name = 'Some Session 2', Session_Date__c = now);
        insert session2;
        
        Session_Speaker__c assignment1 = new Session_Speaker__c(Session__c = session1.id, Speaker__c = speaker.id);
        insert assignment1;
        
        Session_Speaker__c assignment2 = new Session_Speaker__c(Session__c = session2.id, Speaker__c = speaker.id);
        
        Database.SaveResult result = Database.insert(assignment2, false);
        
        System.assert(!result.isSuccess());
    }
}