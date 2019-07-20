@isTest
public class TestSearchController {

   public static testMethod void search() {
       Id [] fixedSearchResults= new Id[1];
       fixedSearchResults[0] = '001j000000E1Za0';
       Test.setFixedSearchResults(fixedSearchResults);
       List<List<SObject>> searchList = [FIND 'test' 
                                         IN ALL FIELDS RETURNING 
                                            Account(id, name WHERE name = 'test' LIMIT 1)];
    }
}