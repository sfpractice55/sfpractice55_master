public class TestDataFactoryUtility {
    public static WH_Invoice__c createOneInvoiceStatement(Boolean withLineItem) {
        WH_Invoice__c testInvoice = createInvoiceStatement();
        if(withLineItem == true) {
            WH_Merchandise__c m = createMerchandiseItem('Orange Juice');
            AddLineItem(testInvoice, m);
        }
        return testInvoice;
    }
    
    private static WH_Merchandise__c createMerchandiseItem(String merchName) {
        WH_Merchandise__c m = new WH_Merchandise__c(Name = merchName,                                                   	
                                                   	WH_Price__c = 2,
                                                   	WH_Quantity__c = 1000);
        insert m;
        return m;
    }
    
    private static WH_Invoice__c createInvoiceStatement() {
        WH_Invoice__c inv = new WH_Invoice__c(WH_Description__c = 'Test Invoice');
        insert inv;
        return inv;
    }
    
    private static WH_Line_Item__c AddLineItem(WH_Invoice__c inv, WH_Merchandise__c m) {
        WH_Line_Item__c lineItem = new WH_Line_Item__c(WH_Invoice__c	= inv.Id,
                                                      	WH_Merchandise__c = m.Id,
                                                      	WH_Unit_Price__c = m.WH_Price__c,
                                                      	WH_Quantity__c = (Double)(10*Math.random()+1)
                                                     );
        insert lineItem;
        return lineItem;
    }
}