//Generated by wsdl2apex

public class TempConvertSoapWS {
    public class CelsiusToFahrenheit_element {
        public String Celsius;
        private String[] Celsius_type_info = new String[]{'Celsius','http://www.w3schools.com/xml/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.w3schools.com/xml/','true','false'};
        private String[] field_order_type_info = new String[]{'Celsius'};
    }
    public class FahrenheitToCelsiusResponse_element {
        public String FahrenheitToCelsiusResult;
        private String[] FahrenheitToCelsiusResult_type_info = new String[]{'FahrenheitToCelsiusResult','http://www.w3schools.com/xml/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.w3schools.com/xml/','true','false'};
        private String[] field_order_type_info = new String[]{'FahrenheitToCelsiusResult'};
    }
    public class FahrenheitToCelsius_element {
        public String Fahrenheit;
        private String[] Fahrenheit_type_info = new String[]{'Fahrenheit','http://www.w3schools.com/xml/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.w3schools.com/xml/','true','false'};
        private String[] field_order_type_info = new String[]{'Fahrenheit'};
    }
    public class CelsiusToFahrenheitResponse_element {
        public String CelsiusToFahrenheitResult;
        private String[] CelsiusToFahrenheitResult_type_info = new String[]{'CelsiusToFahrenheitResult','http://www.w3schools.com/xml/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://www.w3schools.com/xml/','true','false'};
        private String[] field_order_type_info = new String[]{'CelsiusToFahrenheitResult'};
    }
    public class TempConvertSoap {
        public String endpoint_x = 'http://www.w3schools.com/xml/tempconvert.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://www.w3schools.com/xml/', 'TempConvertSoapWS'};
        public String FahrenheitToCelsius(String Fahrenheit) {
            TempConvertSoapWS.FahrenheitToCelsius_element request_x = new TempConvertSoapWS.FahrenheitToCelsius_element();
            request_x.Fahrenheit = Fahrenheit;
            TempConvertSoapWS.FahrenheitToCelsiusResponse_element response_x;
            Map<String, TempConvertSoapWS.FahrenheitToCelsiusResponse_element> response_map_x = new Map<String, TempConvertSoapWS.FahrenheitToCelsiusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://www.w3schools.com/xml/FahrenheitToCelsius',
              'http://www.w3schools.com/xml/',
              'FahrenheitToCelsius',
              'http://www.w3schools.com/xml/',
              'FahrenheitToCelsiusResponse',
              'TempConvertSoapWS.FahrenheitToCelsiusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.FahrenheitToCelsiusResult;
        }
        public String CelsiusToFahrenheit(String Celsius) {
            TempConvertSoapWS.CelsiusToFahrenheit_element request_x = new TempConvertSoapWS.CelsiusToFahrenheit_element();
            request_x.Celsius = Celsius;
            TempConvertSoapWS.CelsiusToFahrenheitResponse_element response_x;
            Map<String, TempConvertSoapWS.CelsiusToFahrenheitResponse_element> response_map_x = new Map<String, TempConvertSoapWS.CelsiusToFahrenheitResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://www.w3schools.com/xml/CelsiusToFahrenheit',
              'http://www.w3schools.com/xml/',
              'CelsiusToFahrenheit',
              'http://www.w3schools.com/xml/',
              'CelsiusToFahrenheitResponse',
              'TempConvertSoapWS.CelsiusToFahrenheitResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.CelsiusToFahrenheitResult;
        }
    }
}