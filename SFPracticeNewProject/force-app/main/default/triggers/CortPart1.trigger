trigger CortPart1 on getsfpractice__TestA__c (after delete, after insert, after undelete, after update, before delete, before insert, before update)  {
    //if(CortPart1Class.runOnce()) {
    	if (trigger.isBefore && trigger.isInsert)
	{
        
	}
    if (trigger.isBefore && trigger.isUpdate)
	{
        System.debug('Before Update');
        CortPart1Class.updateZipCode(trigger.newMap);
   	}		
   	if (trigger.isAfter && trigger.isInsert)
   	{
        
	}		
  	if (trigger.isAfter && trigger.isUpdate)
  	{
        //System.debug('Is After Is Update');
        //CortPart1Class.updateZipCode(trigger.newMap);
  		
   	}		 
   	if (trigger.isBefore && trigger.isDelete)
   	{
        
	}    
    //}    
}