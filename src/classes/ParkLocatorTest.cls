@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
               List<String> parks = new List<String>{'park1','park2','park3'};
List<String> parkList = ParkLocator.country('India');
        // Verify that a fake result is returned
        System.assertEquals(parks, parklist); 
    }
}