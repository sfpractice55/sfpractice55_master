@isTest
public class TestInvoiceStatementDeletion {
    static testMethod void TestDeletionInvoiceWithLineItem() {
        WH_Invoice__c inv = TestDataFactoryUtility.createOneInvoiceStatement(true);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
    }
    
    static testMethod void TestDeletionInvoiceWithoutLineItem() {
        WH_Invoice__c inv = TestDataFactoryUtility.createOneInvoiceStatement(false);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv, false);
        Test.stopTest();
        System.assert(result.isSuccess());
    }
    
    static testMethod void TestBulkDeleteInvoices() {
        List<WH_Invoice__c> invList = new List<WH_Invoice__c>();
        invList.add(TestDataFactoryUtility.createOneInvoiceStatement(true));
        invList.add(TestDataFactoryUtility.createOneInvoiceStatement(false));
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(invList, false);
        Test.stopTest();
        
        System.assert(!results[0].isSuccess());
        System.assert(results[1].isSuccess());       
    }
}