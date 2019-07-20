@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String countryName = 'India';
        String[] cName = ParkLocator.country('India');
        System.assertEquals(new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'}, cName);
    }
}