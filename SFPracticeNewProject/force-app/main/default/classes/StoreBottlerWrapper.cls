public class StoreBottlerWrapper {
    
    public List<WrapperClass> recordlist { get; set;}
    Map<String, List<String>> StrBtlr = new Map<String, List<String>>();
	
    public StoreBottlerWrapper() {
        
        System.debug('FirstFirst');
        recordlist = new List<WrapperClass>();
        
        for (getsfpractice__TestA__c ta : [SELECT getsfpractice__Customer__c, getsfpractice__Store__c, getsfpractice__Bottlers__c FROM getsfpractice__TestA__c WHERE Name like 'Gaurav%']) {
			StrBtlr.put(ta.getsfpractice__Store__c, new List<String>());
    		List<String> lstBottlers = ta.getsfpractice__Bottlers__c.split(', ');
    			for(String s : ta.getsfpractice__Bottlers__c.split(', ')) {
        			System.debug('Bottler : ' + s);
        			StrBtlr.get(ta.getsfpractice__Store__c).add(s);
    			}
    			System.debug('TestMy : ' + lstBottlers);
      
    			//StrBtlr.get(ta.getsfpractice__Store__c).add(ta.getsfpractice__Bottlers__c.split(','));

		}	
        
		System.debug('StrBtlr : ' + StrBtlr);

		for(String st : StrBtlr.keySet()){    
			System.debug('MapKey : ' + st);
    		System.debug('MapValue : ' + StrBtlr.get(st)); 
    		for(String stV1 : StrBtlr.get(st)) {
        		System.debug('Val 1 : ' + stV1);
        		recordlist.add(new WrapperClass('Kroger',st,stV1));
                System.debug('Wrapper List : ' + recordlist);
        		//recordlist.add(new StoreBottlerWrapper('Kroger', st, stV1));
        		//System.debug('recordlist : ' + recordlist);
    		}
		}
        
    	//recordlist.add(new WrapperClass('Kroger', '111', 'ABARTA'));
        //recordlist.add(new WrapperClass('Kroger', '111', 'SWIRE'));
        //recordlist.add(new WrapperClass('Kroger', '222', 'CCBC'));
        //recordlist.add(new WrapperClass('Kroger', '222', 'United'));
        
           
    }  
    
    public void getVals(String ab) {
        System.debug('Test1');
        List<getsfpractice__MembershipObj__c> memList = new List<getsfpractice__MembershipObj__c>();
        for(WrapperClass pw: recordlist){
        	System.debug('Customer Name : ' + pw.CustomerName);
            System.debug('Store Name: ' + pw.StoreName);
            System.debug('Bottler Name: ' + pw.BottlerName);
            getsfpractice__MembershipObj__c mem = new getsfpractice__MembershipObj__c();
            mem.getsfpractice__Customer__c = pw.CustomerName;
            mem.getsfpractice__Store__c = pw.StoreName;
            mem.getsfpractice__Bottler__c = pw.BottlerName;
            memList.add(mem);
        }
        insert memList;        
        
    }

    class WrapperClass {
		public String CustomerName {get;set;}
        public String StoreName {get;set;}
        public String BottlerName {get;set;}
        
        public WrapperClass(String CustomerName, String StoreName, String BottlerName) {
            this.CustomerName = CustomerName;
            this.StoreName = StoreName;
            this.BottlerName = BottlerName;
        }
    }
}