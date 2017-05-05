@isTest
public class AccountProcessorTest {
    
    @isTest
    private static void testCountContacts(){
        List<Id> listId = new List<Id> {createTestRecord('acc1'), createTestRecord('acc2'), createTestRecord('acc3')};
            Test.startTest();
        AccountProcessor.countContacts(listId);
        Test.stopTest();
        List<Account> listacct = [Select name, Number_of_Contacts__c from Account Where Id IN :listId];
       For(Account a : listacct) {
            System.assertEquals(a.Number_of_Contacts__c,2);
        }
        
           
    }

    
        // Helper method
    static Id createTestRecord(String acctName) {
        Account accountTest = new Account(Name=acctName);
        insert accountTest;
        List<Contact> contacts = new List<Contact> {
            new Contact(LastName=acctName+' contact1', AccountId=accountTest.Id),
            new Contact(LastName=acctName+' contact2', AccountId=accountTest.Id)
        };
        insert contacts;
        return accountTest.Id;
    }          

}