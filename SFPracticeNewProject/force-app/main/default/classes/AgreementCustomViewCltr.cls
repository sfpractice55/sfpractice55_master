public class AgreementCustomViewCltr {
    @AuraEnabled
    public static List<Account> allPhasesRelatedToAgreement(String agreementId){
        return ([Select id, Name from Account]);
    }
}