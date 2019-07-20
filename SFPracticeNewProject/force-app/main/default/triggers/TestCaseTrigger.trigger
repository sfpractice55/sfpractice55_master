trigger TestCaseTrigger on Case (before insert) {
    List<Case> childCases = new List<Case>();
    for ( Case parent : Trigger.new ){
        Case child = new Case (ParentId = parent.Id, Subject = parent.Subject);
        childCases.add(child);
    }
    insert childCases; 
}