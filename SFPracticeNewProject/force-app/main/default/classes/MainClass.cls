public class MainClass {
	
	// Wrapper class we need to display info for all three object
	public List<WrapperClass> wrapperList { get; set;}

	// main class constructer
	public MainClass() {
         wrapperList = new List<WrapperClass>();
		
		Map<String, List<String>> StrBtlr = new Map<String, List<String>>();
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
        		wrapperList.add(new wrapperclass('Kroger',st,stV1));
                System.debug('Wrapper List : ' + wrapperList);
        		//recordlist.add(new StoreBottlerWrapper('Kroger', st, stV1));
        		//System.debug('recordlist : ' + recordlist);
    		}
		}
		
	}
	
	//Wrapper class
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