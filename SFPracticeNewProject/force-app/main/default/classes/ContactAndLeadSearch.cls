public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String strToSearch) {
        System.debug('Entering in constructor');
		Account acc1 = new Account(Name = 'Harmine Smith Account', Phone = '(100)000-0000',BillingCity='New York');
		insert acc1;        
        Contact con1 = new Contact(FirstName = 'Harmine', LastName = 'Smith', Phone = '(100)000-0000', Department = 'Information Technology', AccountId = acc1.Id);
        insert con1;
        Lead lead1 = new Lead(LastName = 'Smith', Company = 'ABC Company', Status ='Open - Not Contacted');
        insert lead1;   
        System.debug('Exiting from constructor'); 
        
        List<List<sObject>> searchList = [FIND :strToSearch IN ALL FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
        System.debug('searchList : ' + searchList);
        return searchList;
    }
}