trigger AccountDeletion on Account (before delete) {
    for(Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.id).addError('Cannot delete account with related opportunities.');
    }
}