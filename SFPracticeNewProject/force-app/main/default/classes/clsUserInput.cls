public class clsUserInput {
    public String AccountId = ApexPages.currentPage().getParameters().get('id');
    public clsUserInput(ApexPages.StandardController controller) {} 
    public String discRsn{get;set;}
    public String pageMsg{get;set;}
    public List<SelectOption> optDiscReasons{get;set;}
    
    public void initialize() {
        pageMsg = '';
        optDiscReasons = new List<SelectOption>();
    	Schema.DescribeFieldResult dfr = Schema.SObjectType.Account.Fields.Disconnect_Reason__c;
        List<Schema.PicklistEntry> pklstEntryDiscRsn = new List<Schema.PicklistEntry>();
        pklstEntryDiscRsn = dfr.getPicklistValues();
        for(PickListEntry entry : pklstEntryDiscRsn) {
            optDiscReasons.add(new SelectOption(entry.getLabel(), entry.getValue()));
        }
    }
    
    public void setDisconnectReason() {
        try {
            if(String.isNotBlank(discRsn)) {
                if(AccountId != null) {
                    Account a = [SELECT Id, Disconnect_Reason__c FROM Account WHERE Id =: AccountId];
                    a.Disconnect_Reason__c = discRsn;
                    update a;
                    pageMsg = 'Disconnect Reason has been set to : ' + discRsn;
                }
            }
        } catch (Exception ex){
            System.debug('Error occurred : ' + ex.getMessage());
            pageMsg = '' + ex.getMessage();
        }
    }
}