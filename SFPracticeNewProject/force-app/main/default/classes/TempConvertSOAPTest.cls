/**
 * Created by GG0C52159 on 1/14/2017.
 */
@isTest
private class TempConvertSOAPTest {
    @isTest static void testCallout() {
        Test.StartTest();
        Test.setMock(WebServiceMock.class, new TempConvertSOAPMock());
        TempConvertSOAP tcs = new TempConvertSOAP();

        List<SelectOption> selOpts = tcs.getItem();

        tcs.terperatureType = 'Celsius';
        tcs.temperatureVal = '12';
        System.debug('Before Celsius........');
        tcs.convertTemperature();
        System.debug('Celsius convertedTemperature......' + tcs.convertedTemperature);
        System.assertEquals(null, tcs.convertedTemperature);
        System.debug('AFter Celsius.........');
//        System.debug('tcs.convertedTemperature : ' + tcs.convertedTemperature);
  //      System.assertEquals('53.6',tcs.convertedTemperature);

        tcs.terperatureType = 'Fahrenheit';
        tcs.temperatureVal = '53.6';
        System.debug('Before........');
        tcs.convertTemperature();
        System.debug('Fahrenheit convertedTemperature......' + tcs.convertedTemperature);
        System.assertEquals(null, tcs.convertedTemperature);
        System.debug('AFter.........');
        Test.StopTest();
    }
}