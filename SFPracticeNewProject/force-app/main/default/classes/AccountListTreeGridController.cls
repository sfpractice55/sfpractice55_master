public class AccountListTreeGridController {
	@AuraEnabled
    public static List < Product2 > fetchAccts() {
        return [SELECT Id, Name, getsfpractice__ProductLevel__c, getsfpractice__ProductType__c, 
                (SELECT Id, Name, getsfpractice__CP_Year_1__c, getsfpractice__Product_Hierarchy_Id__c FROM getsfpractice__Price_Ceiling__r ) 
                FROM Product2 WHERE RecordType.Name = 'CCProduct' LIMIT 100 ];
    }
}