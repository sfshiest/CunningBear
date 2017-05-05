public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact theContact, String theState) {
        this.contact = theContact;
        this.state = theState;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [select Id from Account where BillingState=:state limit 200];
        List<AccountContactRelation> acr = new List<AccountContactRelation>();
        for (Account account : accounts) {
            acr.add(new AccountContactRelation(AccountId=account.Id, ContactId=contact.Id));
            //Contact c = contact.clone(true);
            //c.AccountId = account.Id;
            //contacts.add(c);
            //System.debug('contact account id = '+ c.AccountId);
        }
        insert acr;
        //update contacts;
    }
    
}