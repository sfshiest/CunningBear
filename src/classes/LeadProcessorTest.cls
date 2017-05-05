@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 leads
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(LastName='Last Name '+i, Status='open', Company='sandrine'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}