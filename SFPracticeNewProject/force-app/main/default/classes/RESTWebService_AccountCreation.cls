/*
    The urlMapping acts as an accessible endpoint and adds to the full URL used to call this webservice from an external point  
    For example, something like "https://ap1.salesforce.com/services/apexrest/Account"
*/
// EXAMPLE From Website : http://blogforce9.blogspot.com/2013/09/salesforce-rest-webservices-part-i.html

/*
    Use Workbench REST Explorer Utility to call this Web Service
        /services/apexrest/getsfpractice/RestAccountCreation/
*/

@RestResource(urlMapping = '/RestAccountCreation/*')

global with sharing class RESTWebService_AccountCreation {

    /*  
        HttpPost method is used to capture a HttpPost request has been sent to our rest apex class.  
        Used to retrieve data coming in the request body and performing corressponding actions  
    */  
    @HttpPost
    global static String doPost() {
        /*  
            RestContext Class - Allows us to access the RestRequest and RestResponse objects in your Apex REST methods.   
            RestRequest class - Allows us to pass request data into our Apex RESTful Web service method.  
            RestResponse class - Allows us to pass or send back response data from our Apex RESTful web service method  
        */

        //Returns the RestRequest object for our Apex REST method.
        RestRequest req = RestContext.request;

        //Returns the RestResponse for our Apex REST method.
        RestResponse res = RestContext.response;

        //Access the request body with input data coming in the JSON format
        String JSONRequestBody = req.requestBody.toString().trim();

        //Deserializes the input JSON string into an Account object
        Account accObj = (Account) JSON.deserializeStrict(JSONRequestBody, Account.class);

        //insert the account object and return the account ID
        insert accObj;
        String accId = (String) accObj.id;
        System.debug('Account Id : ' + accId);
        createAccContact(accId);
        return accObj.id;

    }

    @future
    global static void createAccContact(String accId) {
        Contact con = new Contact(FirstName = 'REST Webservice', LastName = 'Contact 1', AccountId = accId);
        insert con;
    }

    /*  
        HttpGet method is used to capture a HttpGet request has been sent to our rest apex class.  
        Used to request data on the basis of a parameter sent in the URL  
    */ 
    @HttpGet
    global static Account doGet() {
        /*  
            RestContext Class - Allows us to access the RestRequest and RestResponse objects in your Apex REST methods.   
            RestRequest class - Allows us to pass request data into our Apex RESTful Web service method.  
            RestReponse class - Allows us to pass or send back response data from our Apex RESTful web service method  
        */  
        
        //Returns the RestRequest object for our Apex REST method.
        RestRequest req = RestContext.request;

        //Returns the RestResponse for our Apex REST method.
        RestResponse res = RestContext.response;

        //Retrieve the parameter sent in the URL
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);

        System.debug('Requested Account Id : ' + accountId);

        //query the account on the basis of id sent and return the record
        Account acc = [SELECT Id, Name, Phone, Website FROM Account WHERE Id =: accountId];
        return acc;

    }
}