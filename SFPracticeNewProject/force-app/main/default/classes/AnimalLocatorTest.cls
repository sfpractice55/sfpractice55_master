@isTest
private class AnimalLocatorTest {
    @isTest static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(2);
        String expectedValue = 'bear';
        System.assertEquals(response, expectedValue);
    }
}