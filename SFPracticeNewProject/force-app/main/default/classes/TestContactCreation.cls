@isTest
private class TestContactCreation {
    @isTest static void TestContact1() {
        Contact[] cc = RandomContactFactory.generateRandomContacts(1, 'Test Last Name'); 
        System.debug(cc); 
        Test.startTest();
        Database.DeleteResult result = Database.delete(cc[0], false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete contact', result.getErrors()[0].getMessage());
    }
}