public class MerchandiseOperations {
    public static Id invoice(String pName, Integer pSold, String pDesc) {
        WH_Merchandise__c m = [SELECT WH_Price__c, WH_Quantity__c
                              	FROM WH_Merchandise__c
                              	WHERE Name =: pName LIMIT 1];
        
        System.assertNotEquals(null, m);
        
        WH_Invoice__c i = new WH_Invoice__c(WH_Description__c = pDesc);
        insert i;
        
        WH_Line_Item__c li = new WH_Line_Item__c(Name = '1',
                                                	WH_Invoice__c = i.Id,
                                                	WH_Merchandise__c = m.Id,
                                                	WH_Unit_Price__c = m.WH_Price__c,
                                                	WH_Quantity__c = pSold);
        insert li;
        
        m.WH_Quantity__c -= pSold;
        update m;
        return i.Id;
    }
}