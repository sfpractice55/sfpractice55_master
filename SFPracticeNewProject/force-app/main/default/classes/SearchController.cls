public with sharing class SearchController {
	public list <account >acc {
		get;
		set ;
	}
	public string searchstring {
		get;
		set ;
	}
	public SearchController(ApexPages.StandardController controller) {
	}
	public void search() {
		string searchquery = 'select name,id from account where name like \'%'+ searchstring + '%\' Limit 20';
		acc = Database.query(searchquery);
	}
	public void clear() {
		acc.clear();
	}
}