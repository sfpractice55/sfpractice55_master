trigger RestrictInvoiceDeletion on WH_Invoice__c (before delete) {
	for(WH_Invoice__c invoice : [SELECT Id
                                	FROM WH_Invoice__c
                                	WHERE Id IN (SELECT WH_Invoice__c
                                                	FROM WH_Line_Item__c)
                                	AND Id IN : Trigger.old
                                ]) {
    	Trigger.oldMap.get(invoice.id).addError('Cannot delete invoice statement with line items.');
    }
}