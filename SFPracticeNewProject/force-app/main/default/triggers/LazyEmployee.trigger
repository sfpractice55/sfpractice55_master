trigger LazyEmployee on Case (before insert) {
	List<Case> newCase = new List<Case>();
    List<User> User = [SELECT Id, name From User Where name = 'SF Practice SF2'];
    for(Case a : Trigger.new) { 
        a.Status = 'Closed';
        a.OwnerId = User[0].Id; 
        newCase.add(a);
    }
}