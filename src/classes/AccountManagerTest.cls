@IsTest
public class AccountManagerTest {
    
    
    @isTest static void getAccount() {
        Id acctId= createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://cunning-bear-303381-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + acctId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        System.debug('requestUri = '+ request.requestURI);
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
        System.assert(thisAccount.Contacts != null);
        System.assertEquals(thisAccount.Contacts.size(), 2);
        
    }
    
    // Helper method
    static Id createTestRecord() {
        Account accountTest = new Account(Name='Test Account');
        insert accountTest;
        List<Contact> contacts = new List<Contact> {
            new Contact(LastName='contact1', AccountId=accountTest.Id),
            new Contact(LastName='contact2', AccountId=accountTest.Id)
        };
        insert contacts;
        return accountTest.Id;
    }          
    
    
}