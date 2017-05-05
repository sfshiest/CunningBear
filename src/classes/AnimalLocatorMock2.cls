@isTest
global class AnimalLocatorMock2 implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(Null);
        response.setStatusCode(500);
        return response; 
    }
}