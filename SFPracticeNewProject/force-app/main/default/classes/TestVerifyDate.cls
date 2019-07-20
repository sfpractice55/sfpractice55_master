@isTest
private class TestVerifyDate {
    @isTest static void testDateLessThan() {
        Date d1 = date.parse('09/01/2016'); 
        Date d2 = date.parse('08/01/2016'); 
        Date d = VerifyDate.CheckDates(d1, d2);
        System.assertNotEquals(d2, d);
        
        Date d11 = date.parse('09/01/2016'); 
        Date d22 = date.parse('10/03/2016'); 
        Date dd = VerifyDate.CheckDates(d11, d22);
        System.assertNotEquals(d2, dd);
        
        Date d111 = date.parse('09/01/2016'); 
        Date d222 = date.parse('09/15/2016'); 
        Date ddd = VerifyDate.CheckDates(d111, d222);
        System.assertNotEquals(d222, ddd);
    }
}