/**
 * Created by gaura on 12/25/2017.
 * Continuation object in Apex - Asynchronous Callouts for long running request.
 */

public with sharing class ISOtoCodeServiceContinuationObj {
    public String countryISO {get;set;}
    public String response {get;set;}

    public String baseURL = 'http://services.groupkt.com/country/get/iso2code/';
    private String returnedContinuationId;

    public ISOtoCodeServiceContinuationObj(){
        countryISO = 'IN';
    }

    public Object requestService() {
        Continuation con = new Continuation(120);
        con.continuationMethod = 'renderResponse';

        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(baseURL + countryISO);

        returnedContinuationId = con.addHttpRequest(req);
        System.debug('returnedContinuationId : ' + returnedContinuationId);

        return con;
    }

    public Object renderResponse() {
        HttpResponse res = Continuation.getResponse(returnedContinuationId);
        response = res.getBody();
        return null;
    }
}