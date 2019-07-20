/**
 * Created by GG0C52159 on 1/14/2017.
 */
@isTest
global class TempConvertSOAPMock implements WebServiceMock {
    global void doInvoke (
            Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType) {

        if(request instanceof TempConvertSoapWS.CelsiusToFahrenheitResponse_element) {
            TempConvertSoapWS.CelsiusToFahrenheitResponse_element response_x = new TempConvertSoapWS.CelsiusToFahrenheitResponse_element();
            response_x.CelsiusToFahrenheitResult = String.valueOf(53.6);
            response.put('response_x', response_x);
        } else if (request instanceof TempConvertSoapWS.FahrenheitToCelsiusResponse_element) {
            TempConvertSoapWS.FahrenheitToCelsiusResponse_element response_x = new TempConvertSoapWS.FahrenheitToCelsiusResponse_element();
            response_x.FahrenheitToCelsiusResult = String.valueOf(12);
            response.put('response_x', response_x);
        }
    }
}