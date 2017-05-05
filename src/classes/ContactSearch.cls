public class ContactSearch {
    public static List<Contact> searchForContacts (String ln, String mpc){
        Contact[] contacts = [SELECT Name FROM Contact WHERE LastName=:ln AND MailingPostalCode =:mpc];
        for (Integer i=0; i<contacts.size();i++) {
            System.debug(contacts[i].name);
        }
        return contacts;
    }
}