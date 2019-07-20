public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String zipCode) {
        List<Contact> con = new List<Contact>();
        con = [SELECT Id, Name FROM Contact WHERE LastName = : lastName AND MailingPostalCode = : zipCode];
        return con;
    }
}

/*	Calling Method
    List<Contact> cons = ContactSearch.searchForContacts('Barr', '60601');
        for(Contact c : cons) {
        System.debug('Id : ' + c.Id);
        System.debug('Name : ' + c.Name);  
    } 
*/