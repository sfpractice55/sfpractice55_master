public class DeleteUnacceptedQuotes {
	@InvocableMethod
    public static void QuoteDelete(List<Id> OpportunityIds) {
        List<Quote> Quotes = [SELECT Id from Quote WHERE Opportunity.id in : OpportunityIds
                             	AND Status != 'Accepted'];
        delete Quotes;
    }
}