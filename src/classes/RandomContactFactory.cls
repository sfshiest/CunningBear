public class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer n, String ln) {
        List<Contact> cts = new List<Contact>();
         for(Integer i=0;i<n;i++) {
            Contact c = new Contact(LastName=ln, FirstName='random' + i);
            cts.add(c);
    }
        return cts;

}
}