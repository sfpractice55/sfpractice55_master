public class NewCaseListController {
    List<Case> lstCases = new List<Case>();
    public List<Case> getNewCases() {
        lstCases = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
        return lstCases;
    }
}