/**
 * Created by gaura on 10/2/2017.
 */
public class Datatablecontroller {
	@AuraEnabled
	public static List<Account> getCases() {

		return [SELECT Id ,Name FROM Account limit 100];
	}
}