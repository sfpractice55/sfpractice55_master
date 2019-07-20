public with sharing class ContactMasterController {
    @AuraEnabled
    public static list<Contact> getContactList(Id accId){
        System.debug('Account Id : ' + accId);
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Name, Email, Phone FROM Contact WHERE AccountId =: accId];
        return contactList;        
    }

    @AuraEnabled
    public static Contact saveContact(){
        Contact con = new Contact(FirstName='REST Webservice',
                                    LastName='Contact 6',
                                    Email='klm@gmail.com',
                                    Phone='6781002000',
                                    AccountId='0013Z00001aP6ixQAC'
                                );
        insert con;
        System.debug('inserted');
        return con;
    }
}