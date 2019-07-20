public with sharing class WebServiceCallout {

    public static void sendZipCode(String zipc) {

        String apiKey = '05c6b2dc4ef0a1453f4bb0f497add3ed';
        String endPoint = 'http://api.openweathermap.org/data/2.5/weather?q='+zipc+'&APPID='+apiKey;
   
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        req.setEndPoint(endPoint);
        req.setMethod('GET');

        res = http.send(req);

        if(res.getStatusCode() == 200) {
            System.debug('Web Service Response : ' + res.getBody());
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            System.debug('Results : ' + results.get('main'));

        }
    }

    public static void testMe() {
        WebServiceCallout.sendZipCode('30005');
    }
}