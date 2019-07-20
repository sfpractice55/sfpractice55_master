/**
 * Created by GG0C52159 on 1/13/2017.
 */

public class TempConvertSOAP {
    public String temperatureVal{get;set;}
    public String terperatureType{get;set;}
    public String convertedTemperature{get;set;}

    public List<SelectOption> getItem() {
        List<SelectOption> option = new List<SelectOption>();
        option.add(new SelectOption('Fahrenheit','Fahrenheit'));
        option.add(new SelectOption('Celsius','Celsius'));
        return option;
    }

    public PageReference convertTemperature() {
        System.debug('terperatureType : ' + terperatureType);
        System.debug('temperatureVal : ' + temperatureVal);
        try {
            if(terperatureType == 'Celsius') {
                TempConvertSoapWS.TempConvertSoap cTof = new TempConvertSoapWS.TempConvertSoap();
                System.debug('Celsius To Farenheit : ' + cTof.CelsiusToFahrenheit(temperatureVal));
                convertedTemperature = String.valueOf(cTof.CelsiusToFahrenheit(temperatureVal));
                System.debug('convertedTemperature : ' + convertedTemperature);
            } else {
                TempConvertSoapWS.TempConvertSoap fToc = new TempConvertSoapWS.TempConvertSoap();
                System.debug('Celsius To Farenheit : ' + fToc.FahrenheitToCelsius(temperatureVal));
                convertedTemperature = String.valueOf(fToc.FahrenheitToCelsius(temperatureVal));
                System.debug('convertedTemperature : ' + convertedTemperature);
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

}