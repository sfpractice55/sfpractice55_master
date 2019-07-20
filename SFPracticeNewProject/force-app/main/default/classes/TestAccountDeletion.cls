@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        
        Account a = new Account(Name='Test Account1'); 
        insert a;
        Opportunity o = new Opportunity(Name=a.Name + ' Opportunity1',StageName='Prospecting',CloseDate=System.today().addMonths(1),AccountId=a.Id);
        insert o;
         
        Test.startTest();        
        Database.DeleteResult result = Database.delete(a, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.debug('aaa : ' +!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.debug('bbb : ' + result.getErrors().size());
        System.assertEquals('Cannot delete account with related opportunities.', result.getErrors()[0].getMessage());
        System.debug('Cannot delete account with related opportunities. : ' + result.getErrors()[0].getMessage());
    } 
}