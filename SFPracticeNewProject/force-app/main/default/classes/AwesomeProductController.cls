public class AwesomeProductController {
	@AuraEnabled
    public static List<getsfpractice__Lightning_Product__c> getProducts() {
        return [select id, name, getsfpractice__Photo__c, getsfpractice__Description__c, getsfpractice__Points__c from getsfpractice__Lightning_Product__c];
    }

    @AuraEnabled
    public static getsfpractice__Lightning_Product__c getProductByName(String name) {
        return [select id, name, getsfpractice__Photo__c, getsfpractice__Color__c,
                getsfpractice__points__c, getsfpractice__description__c,
                (select name from getsfpractice__ProductSize__r order by name)
                from getsfpractice__Lightning_Product__c where name = :name];
    }
}