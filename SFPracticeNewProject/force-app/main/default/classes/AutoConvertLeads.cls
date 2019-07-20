public class AutoConvertLeads {
	@InvocableMethod
    public static void LeadAssign(List<Id> LeadIds) {
        LeadStatus cLeadStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
        
        List<Database.LeadConvert> MassLeadConvert = new List<Database.LeadConvert>();
        for(Id currentLead : LeadIds) {
            Database.LeadConvert LeadConvert = new Database.LeadConvert();
            LeadConvert.setLeadId(currentLead);
            LeadConvert.setConvertedStatus(cLeadStatus.MasterLabel);
            LeadConvert.setDoNotCreateOpportunity(TRUE);
            MassLeadConvert.add(LeadConvert);
        }
        if(!MassLeadConvert.isEmpty()) {
            List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadConvert);
        }
    }
}