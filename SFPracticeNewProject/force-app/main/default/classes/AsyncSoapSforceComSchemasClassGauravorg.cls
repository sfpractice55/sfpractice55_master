//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassGauravorg {
    public class createAccountResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            soapSforceComSchemasClassGauravorg.createAccountResponse_element response = (soapSforceComSchemasClassGauravorg.createAccountResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncAccountCreate {
        public String endpoint_x = 'https://na15.salesforce.com/services/Soap/class/GauravOrg/AccountCreate';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassGauravorg.DebuggingHeader_element DebuggingHeader;
        public soapSforceComSchemasClassGauravorg.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassGauravorg.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassGauravorg.CallOptions_element CallOptions;
        public soapSforceComSchemasClassGauravorg.DebuggingInfo_element DebuggingInfo;
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate', 'soapSforceComSchemasClassGauravorg'};
        public AsyncSoapSforceComSchemasClassGauravorg.createAccountResponse_elementFuture beginCreateAccount(System.Continuation continuation,String name,String phone,String city,String postalcode,String country) {
            soapSforceComSchemasClassGauravorg.createAccount_element request_x = new soapSforceComSchemasClassGauravorg.createAccount_element();
            request_x.name = name;
            request_x.phone = phone;
            request_x.city = city;
            request_x.postalcode = postalcode;
            request_x.country = country;
            return (AsyncSoapSforceComSchemasClassGauravorg.createAccountResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassGauravorg.createAccountResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate',
              'createAccount',
              'http://soap.sforce.com/schemas/class/GauravOrg/AccountCreate',
              'createAccountResponse',
              'soapSforceComSchemasClassGauravorg.createAccountResponse_element'}
            );
        }
    }
}