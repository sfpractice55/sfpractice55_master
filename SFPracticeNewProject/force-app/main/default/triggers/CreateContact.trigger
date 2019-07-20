trigger CreateContact on Account (after insert) {
	for (Account a : Trigger.new) {
        System.debug('Test : ' + a.Id);
		insert new Contact(AccountId = a.Id, LastName = 'Test1');
	}
}