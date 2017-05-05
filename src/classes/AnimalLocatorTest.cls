@isTest
public class AnimalLocatorTest {

       @isTest static  void testGetAnimalNameByIdwithValidId() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String name = AnimalLocator.getAnimalNamebyId(1);           
        System.assertEquals(name, 'chicken', 'wrong!');    
    }   
   
    
    
}