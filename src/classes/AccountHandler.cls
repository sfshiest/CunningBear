public class AccountHandler {
    public static Account insertNewAccount (String a) {
        try {            
            Account acct = new Account(Name=a);
            insert acct;
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
        }
    }
}