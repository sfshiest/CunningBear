@isTest
public class AddPrimaryContactTest {


    static Contact createTestRecords() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState ='NY'
            ));
        }
        for (Integer i = 51; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i, BillingState ='CA'
            ));
        }
        insert accounts;
        
        Contact theContact = new Contact (LastName='theContact', AccountId='0016F00001raKbz');
        insert theContact;
        return theContact;
    }
    
    static testmethod void testQueueable() {
        
        Contact c = createTestRecords();

        AddPrimaryContact apc = new AddPrimaryContact(c, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(apc);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        List<Account> accounts = [select Id, (select Name from Contacts) from Account where BillingState='CA'];
        for (Account a : accounts) {
            System.assertEquals(1, [select count() from AccountContactRelation where AccountId=:a.Id]);
        }
    }
    
}