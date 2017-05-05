public class AccountProcessor {
    @future
    public static void countContacts (List<ID> AccountIds){
        List<Account> accounts = [Select Id, (Select Id from Contacts) from Account Where Id IN :AccountIds];
        For(Account a : accounts) {
            a.Number_of_Contacts__c = a.Contacts.size();
        }
        update accounts;
    }
   
}