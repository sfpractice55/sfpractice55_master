@isTest
public class TestDeleteRestrictInvoice {
    static WH_Invoice__c createNewInvoice(Boolean withLineItem) {
        //Create Merchandise
        WH_Merchandise__c merchandise = new WH_Merchandise__c(Name = 'Testing Invoice',
                                               WH_Quantity__c = 1000,
                                               WH_Price__c = 500
                                              );
        insert merchandise;
        
        //Create Invoice
        WH_Invoice__c invoice = new WH_Invoice__c(WH_Status__c = 'Open');
        insert invoice;
        
        //Create Line Item
        if(withLineItem == true) {
            WH_Line_Item__c item = new WH_Line_Item__c(Name = '21',
                                                         WH_Quantity__c = 1,
                                                         WH_Merchandise__c = merchandise.id,
                                                         WH_Invoice__c = invoice.Id
                                                        );
			insert item;            
        }
        return invoice;
    }
    
    static testMethod void verifyInvoiceNoLineItemsDelete() {
        WH_Invoice__c invoice = createNewInvoice(false);
        Database.DeleteResult result = Database.delete(invoice, false);
        System.assert(result.isSuccess());            
    }
    
    static testMethod void verifyInvoiceLineItemsRestrict() {
        WH_Invoice__c invoice = createNewInvoice(true);
        Database.DeleteResult result = Database.delete(invoice, false);
        System.assert(!result.isSuccess());     
    }
    
    static testMethod void verifyBulkInvoiceDeleteRestrict() {
        WH_Invoice__c[] invoices = new List<WH_Invoice__c>();
        invoices.add(createNewInvoice(false));
        invoices.add(createNewInvoice(true));
        
        Database.DeleteResult[] result = Database.delete(invoices, false);
        
        System.assert(result[0].isSuccess());
        System.assert(!result[1].isSuccess());
    }
}