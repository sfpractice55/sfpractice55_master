global class TestBatchApexWithCallout implements Database.Batchable<TestA__c>, Database.AllowsCallouts{
	getsfpractice__TestA__c[] lstTestA= [SELECT Name, getsfpractice__ZipCode__c, getsfpractice__temp_max__c, getsfpractice__temp_min__c FROM getsfpractice__TestA__c WHERE getsfpractice__ZipCode__c != '' limit 10];  
        
    global Iterable<TestA__c> start(Database.BatchableContext BC) {
        return (lstTestA);
    }
 
    global void execute(Database.BatchableContext BC, List<getsfpractice__TestA__c> scope) {
        List<getsfpractice__TestA__c> lstTestA1 = new List<getsfpractice__TestA__c>();
        String temp_min = '';
    	String temp_max = '';
        System.debug('Scope Size : ' + scope.size());
        
        //If enable below statement, system throws 'You have uncommitted work pending. Please commit or rollback before calling out'
        /*
            getsfpractice__TestA__c gat = new getsfpractice__TestA__c(Name = 'TestWeb11', getsfpractice__ZipCode__c = '30040');
            insert gat;
        */    
        System.debug('Scope Size 2 : ' + scope.size());

        for(getsfpractice__TestA__c ta : scope) {
            String zipc = ta.getsfpractice__ZipCode__c;
             
            System.debug('zip : ' + zipc);
            String apiKey = '05c6b2dc4ef0a1453f4bb0f497add3ed';
            String endPoint = 'http://api.openweathermap.org/data/2.5/weather?q='+zipc+'&APPID='+apiKey;
    
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endPoint);
            request.setMethod('GET');
    
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                System.debug('Response : ' + response.getBody());
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                Map<String, Object> mailResults = (Map<String, Object>) (results.get('main'));
                temp_min = String.valueOf(mailResults.get('temp_min'));
                temp_max = String.valueOf(mailResults.get('temp_max'));
                ta.getsfpractice__temp_min__c = temp_min;
                ta.getsfpractice__temp_max__c = temp_max;    
                lstTestA1.add(ta);
            } else {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'There was error reteriving the weather information.');
                ApexPages.addMessage(myMsg);
            }
        }
        update lstTestA1;
    }

    global void finish(Database.BatchableContext info){
	}//global void finish loop
}