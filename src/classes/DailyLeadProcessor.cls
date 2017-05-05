global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = null];
        for (Lead l : leads){
            l.LeadSource='Dreamforce';
        }
        update leads;
    }
    
}