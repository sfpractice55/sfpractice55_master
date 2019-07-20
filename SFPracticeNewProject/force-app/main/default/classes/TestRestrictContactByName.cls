@isTest
private class TestRestrictContactByName {
    @isTest static void TestRestrictContactByNameMethod() {
       
        List<Contact> lstCon = new List<Contact>();
        
        Contact c1 = new Contact(LastName = 'TestContact');
        lstCon.add(c1);
        
        Contact c2 = new Contact(LastName = 'INVALIDNAME'); 
        lstCon.add(c2);
        
        Test.startTest();
        Database.SaveResult [] result = Database.insert(lstCon, false);
        Test.stopTest();
       
    }
}