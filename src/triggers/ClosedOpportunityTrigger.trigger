trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        List<Task> tList = New List<Task>();
        for(Opportunity o : [SELECT Id, Name FROM Opportunity
                            WHERE Id IN :Trigger.New AND
                             StageName  = 'Closed Won']){
                                 tList.add(new Task(Subject='Follow Up Test Task', WhatId=o.Id));
                                 System.debug('Adding task to oppty '+o.Name);
                             }
        try{insert tList;} catch(DmlException e) {System.debug('Exception! '+ e.getMessage());}
    }
}