public class WrapperClassExample {
    public List<wrapAccount> wrapAccountList{get;set;}
    public List<Account> selectedAccounts{get;set;}
    
    public WrapperClassExample() {
        if(wrapAccountList == null) {
            wrapAccountList = new List<wrapAccount>();
            for(Account a : [SELECT Id, Name, BillingState, Website, Phone FROM Account limit 10]) {
                wrapAccountList.add(new wrapAccount(a));
            }
        }
    }
    
    public void processSelected() {
        selectedAccounts = new List<Account>();
        for(wrapAccount wrapAccountObj : wrapAccountList) {
            if(wrapAccountObj.selected == true) {
                selectedAccounts.add(wrapAccountObj.acc);
            }
        }
    }
    
    public class wrapAccount {
        public Account acc {get;set;}
        public Boolean selected{get;set;}
        
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
}