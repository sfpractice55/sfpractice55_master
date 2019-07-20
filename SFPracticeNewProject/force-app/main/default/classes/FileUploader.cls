public class FileUploader {
    public String nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[] {};
        
    List<Account> accstoupload;

    public PageReference ReadFile(){
        nameFile = contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<Account>();
        
        for(Integer i = 0;i<filelines.size();i++) {
            String[] inputValues = new String[]{};
            inputValues = filelines[i].split(',');
            
            Account a = new Account();
            a.Name = inputValues[0];
            a.ShippingStreet = inputValues[1];
            a.ShippingCity = inputValues[2];
            a.ShippingState = inputValues[3];
            a.ShippingPostalCode = inputValues[4];
            a.ShippingCountry = inputValues[5];
            
            accstoupload.add(a);            
        }
        
        try {
            insert accstoupload;
        } catch(Exception e) {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }
        return null;
    }  
    
    public List<Account> getuploadedAccounts() {
        if(accstoupload != NULL){
            if(accstoupload.size() > 0) {
                return accstoupload;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}