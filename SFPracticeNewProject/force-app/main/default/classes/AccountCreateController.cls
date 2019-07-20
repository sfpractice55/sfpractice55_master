public class AccountCreateController {
    public PageReference save() {
    	partnerSoapSforceCom.soap myconnection = new partnerSoapSforceCom.soap();
    	partnerSoapSforceCom.LoginResult mylogindetails = myconnection.login('gaurav.gulatik01@gmail.com','gaurav112snWOf8e4u0zCawnmnxWGiBng');
    	System.debug('Session Info ---> ' + mylogindetails.sessionid);
        String sessionid = mylogindetails.sessionid;
        soapSforceComSchemasClassGauravorg.SessionHeader_element headerinfo = new soapSforceComSchemasClassGauravorg.SessionHeader_element();
        headerinfo.sessionid = sessionid;
        soapSforceComSchemasClassGauravorg.AccountCreate newAcc = new soapSforceComSchemasClassGauravorg.AccountCreate();
        newAcc.SessionHeader = headerinfo;
        String response = newAcc.createAccount(acc.Name, acc.Phone, acc.Billingcity, acc.BillingPostalCode, acc.BillingCountry);
        if(response == 'SUCCESS') { 
            insert acc;
        }
        if(acc.id!=null){
            message = 'Successfully created in both applications.';
        }
    	return null;    
    }
    
    public String message{get;set;}
    public Account acc{get;set;}
    public AccountCreateController() {
        acc = new Account(); 
    }
	
}