/**
 * Created by GG0C52159 on 1/15/2017.
 */

//Apex Callouts to display External Data in Salesforce

public with sharing class RESTApexCalloutUsingWrapperClass {
    public List<RESTApexCalloutWrapperClass> RESTApexWrapperList{get;set;}

    public List<RESTApexCalloutWrapperClass> getPerformCallout() {
        RESTApexWrapperList = new List<RESTApexCalloutWrapperClass>();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        System.debug('A');
        request.setEndpoint('https://raw.githubusercontent.com/parthiban019/samplejson/master/student.json');
        request.setMethod('GET');
        response = http.send(request);
        System.debug('response : ' + response);
        if(response.getStatusCode() == 200 && response.getBody() != null) {
            RESTApexWrapperList = (List<RESTApexCalloutWrapperClass>) JSON.deserialize(response.getBody(), List<RESTApexCalloutWrapperClass>.class);
        }
        return RESTApexWrapperList;
    }
}