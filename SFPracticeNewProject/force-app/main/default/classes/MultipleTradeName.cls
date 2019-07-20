public class MultipleTradeName {

    public List<WrapperClass> recordlist { get; set;}
    Public getsfpractice__Stores__c[] lstStores {get;set;}
    List<String> TradeNoInUserInterface = new List<String>{'%T001%', '%T009%', '%T009%'};
    
    public MultipleTradeName() {  
        System.debug('TradeNoInUserInterface : ' + TradeNoInUserInterface);
        
        lstStores = [SELECT Id, getsfpractice__Bottler__c, getsfpractice__BottlerOwnership__c, getsfpractice__Store_Number__c, getsfpractice__Trade_No__c 
                     	FROM getsfpractice__Stores__c where getsfpractice__Trade_No__c like : TradeNoInUserInterface];
        recordlist = new List<WrapperClass>();
        System.debug('lstStores : ' + lstStores);
        if(lstStores.size() <> 0){
            for(getsfpractice__Stores__c m : lstStores){                
                System.debug('Contains : ' + m.getsfpractice__Trade_No__c);
                WrapperClass mr = new WrapperClass(m.getsfpractice__Store_Number__c, m.getsfpractice__Trade_No__c);
                recordlist.add(mr);                             
            }
            system.debug(recordlist);
            List<getsfpractice__MembershipObj__c> memList = new List<getsfpractice__MembershipObj__c>();
            for(WrapperClass pw: recordlist){
                System.debug('Customer Name : ' + pw.StoreNumber);
                System.debug('Store Name: ' + pw.TradeNo);
                getsfpractice__MembershipObj__c mem = new getsfpractice__MembershipObj__c();
                mem.getsfpractice__Store__c = pw.StoreNumber;
                mem.getsfpractice__Trade_No__c = pw.TradeNo;
                memList.add(mem);
            }
            insert memList;   
        }
        
        
    }
    
    
    
    class WrapperClass {
        public String StoreNumber {get;set;}
        public String TradeNo {get;set;}
        
        public WrapperClass(String StoreNumber, String TradeNo) {
            this.StoreNumber = StoreNumber;
            this.TradeNo = TradeNo;
        }
    }

}