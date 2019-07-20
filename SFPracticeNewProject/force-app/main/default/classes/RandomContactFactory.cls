public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numCon, String LastName1) {
        List<Contact> cons = new List<Contact>();
        for(Integer i =0; i<numCon;i++){
            Contact c = new Contact(FirstName = 'Test ' + i, LastName = LastName1); 
            cons.add(c);
        }
        insert cons; 
        
        return cons;
    }
}