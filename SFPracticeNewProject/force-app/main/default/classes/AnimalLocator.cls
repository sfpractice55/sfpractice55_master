public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
    String animalnm = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String returnValue = null;
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response);
        System.debug('id : ' + id);
        if(response.getStatusCode() == 200) {
            //Animal results = (Animal) JSON.deserializeUntyped(response.getBody);
            //System.debug(results.animal.name);
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results : ' + results);
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('animals : ' + animals);
            returnValue = string.valueOf(animals.get('name'));
            System.debug('returnValue : ' + returnValue);
            
        }
        return returnValue;
    }
}