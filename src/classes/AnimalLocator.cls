public class AnimalLocator {
    
    public static String getAnimalNameById (Integer i) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + i);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
         // If the request is successful, parse the JSON response.
       
      
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

        Map<String, Object> animal = (Map<String, Object>) results.get('animal');    
        return (String)animal.get('name');

                
        
    }
}