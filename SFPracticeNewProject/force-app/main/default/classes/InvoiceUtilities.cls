global with sharing class InvoiceUtilities {
    webservice static String reNumberLineItems(String invoiceName) {
       WH_Invoice__c invoice = [SELECT i.Name, (SELECT Name 
                                                 FROM WH_Line_Items__r
                                               	 ORDER By Name)
                               	FROM WH_Invoice__c i
                                WHERE i.Name =: invoiceName
                               	LIMIT 1
                               ];
       Integer i = 1;
       for(WH_Line_Item__c item: invoice.WH_Line_Items__r) {
	       	item.Name = String.valueOf(i); 
            System.debug(item.Name);
            i++;
       }        
       
        try {
            Database.update(invoice.WH_Line_Items__r);
        } catch (DMLException dml) {
            return dml.getMessage();
        }
        return 'Line items re-numbered successfully.';
    }
}