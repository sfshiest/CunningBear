global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for (Lead lead : scope) {
            lead.LeadSource='Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        update scope;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug('Job ='+ job.Status + ' - job.JobItemsProcessed =' + job.JobItemsProcessed + ' - job.CreatedById =' +  job.CreatedById);

    }    

}