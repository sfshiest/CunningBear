@isTest
private class TestRestrictContactByName {
    
        @isTest static void TestRestrictContactByNameWithProperName() {
        
            Contact c = new Contact(LastName='lapin');            
        // Perform test
        Test.startTest();
        Database.saveResult result = Database.insert(c, false);
        Test.stopTest();

        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    }

       @isTest static void TestRestrictContactByNameWithBadName() {
            Contact c = new Contact(LastName='INVALIDNAME');            
        // Perform test
        Test.startTest();
        Database.saveResult result = Database.insert(c, false);
        Test.stopTest();

        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
    
    
}