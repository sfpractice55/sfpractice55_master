trigger DeleteRestrictInvoice on WH_Invoice__c (before delete) {
    List<WH_Invoice__c> invoices = [SELECT i.Name, (SELECT Name
                                                    FROM WH_Line_Items__r)
                                    FROM WH_Invoice__c i
                                    WHERE i.Id IN : Trigger.oldMap.keyset()        
                                  ];
    for(WH_Invoice__c invoice : invoices) {
        if(!invoice.WH_Line_Items__r.isEmpty()) { 
            Trigger.oldMap.get(invoice.id).addError('Cannot delete Invoice with Line Items.');
        }
    }
}