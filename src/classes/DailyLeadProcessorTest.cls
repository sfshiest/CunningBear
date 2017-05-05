@isTest
private class DailyLeadProcessorTest {

    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {

        List<Lead> leads = new List<Lead>();
        // insert 200 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Last Name '+i, Status='open', Company='sandrine'));
        }
        insert leads;

        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leads);
        List<Id> leadsId = new List<Id>(leadMap.keySet());

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        
        // Verify the scheduled job has not run yet.
        List<Lead> lds = [SELECT LeadSource 
            FROM Lead 
            WHERE Id IN :leadsId];
        for(Lead ld : lds){
        System.assertEquals(null, ld.LeadSource, 'Lead source is not empty');
        // Stopping the test will run the job synchronously
        }
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        lds = [SELECT LeadSource 
            FROM Lead 
            WHERE Id IN :leadsId];
        for(Lead ld : lds){
        System.assertEquals('Dreamforce',ld.LeadSource, 
            'Lead Source was not updated');
        }
    }
}