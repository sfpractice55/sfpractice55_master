trigger testTrigger on Lead (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
   if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            System.debug('***Before Insert***');
            System.debug('Trigger.new : ' + Trigger.new.size());
     
            for(Lead l : Trigger.new) {                
                l.Test_Trigger__c = 'Trigger: Before Insert';
                System.debug('Test Trigger = ' + l.Test_Trigger__c);                
            }      
           
            //System.debug('Trigger.newMap : ' + Trigger.newMap.size());    NullPointerException
            //System.debug('Trigger.old : ' + Trigger.old.size());      NullPointerException
            //System.debug('Trigger.oldMap : ' + Trigger.oldMap.size());        NullPointerException
            System.debug('***End Before Insert***');
        } 
        
        if(Trigger.isUpdate) {
            System.debug('***Before Update***');
            
            System.debug('---------Trigger.new : ' + Trigger.new.size());
            if(!staticRecursiveTrigger.hasAlreadyExecuted()) {
            List<Lead> newLeadList5 = new List<Lead>();
                Map<Id, Lead> newMapLead5 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                               FROM Lead
                                                               WHERE Id IN : Trigger.new]);
            for(Lead l : Trigger.new) {
                l.Test_Trigger__c = 'Trigger: Before Update';
                newMapLead5.get(l.id).Test_Trigger_Before_Delete__c = 'Trigger: Before Update - Trigger.new New DML.....';
                newLeadList5.add(newMapLead5.get(l.id));
                System.debug('Trigger.New New = ' + l.Test_Trigger__c);
                System.debug('Trigger.New New Map = ' + Trigger.newMap.get(l.id).Test_Trigger__c);
                System.debug('Trigger.New Old Map = ' + Trigger.oldMap.get(l.id).Test_Trigger__c);                                
            }
                staticRecursiveTrigger.setAlreadyExecuted();
            update newLeadList5;
            }
            System.debug('---------Trigger.newMap : ' + Trigger.newMap.size()); 
            
            for(Id id : Trigger.newMap.keySet()) {
                //l.Test_Trigger__c = 'Trigger: Before Update - Trigger.newMap New Map';        Compile Time Error
                System.debug('Before Assign - Trigger.NewMap New Map = ' + Trigger.newMap.get(id).Test_Trigger__c);
                Trigger.newMap.get(id).Test_Trigger__c = 'Trigger: Before Update - Trigger.newMap New Map';                
                //System.debug('Trigger.newMap New Map = ' + l.Test_Trigger__c);    Compile Time Error
                System.debug('After Assign - Trigger.NewMap New Map = ' + Trigger.newMap.get(id).Test_Trigger__c);
            }                      
            System.debug('---------Trigger.old : ' + Trigger.old.size());
            if(!staticRecursiveTrigger.hasAlreadyExecuted()) {
            List<Lead> newLeadList4 = new List<Lead>();
                Map<Id, Lead> newMapLead4 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                               FROM Lead
                                                               WHERE Id IN : Trigger.old]);
            for(Lead l : Trigger.old) {                
                //l.Test_Trigger__c = 'Trigger: Before Update - Old';                           Run Time Error
                //Trigger.oldMap.get(l.id).Test_Trigger__c = 'Trigger: Before Update - Trigger.old Using Old Map';  Run Time Error
                newMapLead4.get(l.id).Test_Trigger_Before_Delete__c = 'Trigger: Before Update - Trigger.old Old DML.....';
                newLeadList4.add(newMapLead4.get(l.id));
                System.debug('Trigger.old Old = ' + l.Test_Trigger__c);
            }
                staticRecursiveTrigger.setAlreadyExecuted();
            delete newLeadList4;
            }
            System.debug('---------Trigger.oldMap : ' + Trigger.oldMap.size()); 
            for(Id id : Trigger.oldMap.keySet()) {                
                //l.Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';        Compile Time Error
                //Trigger.oldMap.get(id).Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';   Run Time Error
                System.debug('Trigger.oldMap Old Map = ' + Trigger.oldMap.get(id).Test_Trigger__c);
            }       
            
            System.debug('***End Before Update***');
        }
        
        if(Trigger.isDelete) {
            System.debug('***Before Delete***');
            //if(!staticRecursiveTrigger.hasAlreadyExecuted()) {
                List<Lead> newLeadList3 = new List<Lead>();
                Map<Id, Lead> newMapLead3 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                               FROM Lead
                                                               WHERE Id IN : Trigger.old]);
                
            for(Id id : Trigger.oldMap.keySet()) {                
                //l.Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';        
                //Trigger.oldMap.get(id).Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';   
                newMapLead3.get(id).Test_Trigger_Before_Delete__c = 'Trigger: Before Delete - Trigger.oldMap Old Map DML.....';
                newLeadList3.add(newMapLead3.get(id));
            }   
            // staticRecursiveTrigger.setAlreadyExecuted();
                insert newLeadList3; 
           // }   
            //System.debug('Trigger.new : ' + Trigger.new.size());      NullPointerException
            //System.debug('Trigger.newMap : ' + Trigger.newMap.size());    NullPointerException    
            System.debug('Trigger.old : ' + Trigger.old.size());        
            System.debug('Trigger.oldMap : ' + Trigger.oldMap.size());
            System.debug('***End Before Delete***');
        }
    } 
    
    if(Trigger.isAfter) {
        if(Trigger.isInsert){
            System.debug('***After Insert***');
            System.debug('---------Trigger.new : ' + Trigger.new.size());
            List<Lead> newLeadList = new List<Lead>();
            Map<Id, Lead> newMapLead0 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                            FROM Lead
                                                            WHERE Id IN : Trigger.new]);
            for(Lead l : Trigger.new) {
                //l.Test_Trigger__c = 'Trigger: After Update';
                newMapLead0.get(l.id).Test_Trigger_DML__c = 'Trigger: After Insert - Trigger.new New DML.....';
                newLeadList.add(newMapLead0.get(l.id));
                System.debug('Trigger.New New = ' + l.Test_Trigger__c);
                System.debug('Trigger.New New = ' + l.Test_Trigger_DML__c);
                System.debug('Trigger.New New Map = ' + Trigger.newMap.get(l.id).Test_Trigger__c);
                System.debug('Trigger.New New Map = ' + Trigger.newMap.get(l.id).Test_Trigger_DML__c);
                //System.debug('Trigger.New Old Map = ' + Trigger.oldMap.get(l.id).Test_Trigger__c);                                
                //System.debug('Trigger.New Old Map = ' + Trigger.oldMap.get(l.id).Test_Trigger_DML__c);
            }
            //update newLeadList;
            System.debug('---------Trigger.newMap : ' + Trigger.newMap.size());
            List<Lead> newMapLeadList = new List<Lead>();
            Map<Id, Lead> newMapLead = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                            FROM Lead
                                                            WHERE Id IN : Trigger.newMap.keySet()]);
            for(Id id : Trigger.newMap.keySet()) {
                //Trigger.newMap.get(id).Test_Trigger__c = 'Trigger: After Insert - Trigger.newMap New Map';
                newMapLead.get(id).Test_Trigger_DML__c = 'Trigger: After Insert - Trigger.newMap New Map DML.....'; 
                newMapLeadList.add(newMapLead.get(id));
                System.debug('Trigger.New New Map = ' + Trigger.newMap.get(id).Test_Trigger__c);
                System.debug('Trigger.New New Map = ' + Trigger.newMap.get(id).Test_Trigger_DML__c);                
            }
            //update newMapLeadList;
            //System.debug('Trigger.old : ' + Trigger.old.size());      NullPointerException            
            //System.debug('Trigger.oldMap : ' + Trigger.oldMap.size());    NullPointerException
            System.debug('***End After Insert***');
        }
        
        if(Trigger.isUpdate) {
            System.debug('***After Update***');
            System.debug('---------Trigger.new : ' + Trigger.new.size());
            
            if(!staticRecursiveTrigger.hasAlreadyExecuted()) {
                List<Lead> newLeadList2 = new List<Lead>();
                Map<Id, Lead> newMapLead2 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                               FROM Lead
                                                               WHERE Id IN : Trigger.new]);
                
                for(Lead l : Trigger.new) {
                    //insert l; "No Runtime - DML cannot operate on Trigger.new/old"
                    newMapLead2.get(l.id).Test_Trigger_DML__c = 'Trigger: After Update - Trigger.new New DML.....';
                    newLeadList2.add(newMapLead2.get(l.id));
                    //l.Test_Trigger__c = 'Trigger: After Update'; Record is read only
                    System.debug('Trigger.New New = ' + l.Test_Trigger__c);
                    System.debug('Trigger.New New Map = ' + Trigger.newMap.get(l.id).Test_Trigger__c);
                    System.debug('Trigger.New Old Map = ' + Trigger.oldMap.get(l.id).Test_Trigger__c);                                
                }   
                
                staticRecursiveTrigger.setAlreadyExecuted();
                update newLeadList2; 
            }
            System.debug('---------Trigger.newMap : ' + Trigger.newMap.size()); 
            
            

            if(!staticRecursiveTrigger.hasAlreadyExecuted()) {
                List<Lead> newLeadList1 = new List<Lead>();
                Map<Id, Lead> newMapLead1 = new Map<Id, Lead>([SELECT Id, Test_Trigger__c, Test_Trigger_DML__c
                                                            FROM Lead
                                                            WHERE Id IN : Trigger.newMap.keySet()]);
                for(Id id : Trigger.newMap.keySet()) {                
                    //l.Test_Trigger__c = 'Trigger: Before Update - Trigger.newMap New Map';        Compile Time Error
                    System.debug('Before Assign - Trigger.NewMap New Map = ' + Trigger.newMap.get(id).Test_Trigger__c);
                    //Trigger.newMap.get(id).Test_Trigger__c = 'Trigger: After Update - Trigger.newMap New Map';                
                    newMapLead1.get(id).Test_Trigger_DML__c = 'Trigger: After Update - Trigger.newMap New Map DML.....';
                    newLeadList1.add(newMapLead1.get(id));
                    //System.debug('Trigger.newMap New Map = ' + l.Test_Trigger__c);    Compile Time Error
                    System.debug('After Assign - Trigger.NewMap New Map = ' + Trigger.newMap.get(id).Test_Trigger__c);
                }                
                staticRecursiveTrigger.setAlreadyExecuted();
                update newLeadList1;                                
            }
            System.debug('---------Trigger.old : ' + Trigger.old.size());
            for(Lead l : Trigger.old) {                
                //l.Test_Trigger__c = 'Trigger: After Update - Old';
                //Trigger.oldMap.get(l.id).Test_Trigger__c = 'Trigger: After Update - Trigger.old'; 
                System.debug('Trigger.old Old = ' + l.Test_Trigger__c);
            }
            
            System.debug('---------Trigger.oldMap : ' + Trigger.oldMap.size()); 
            for(Id id : Trigger.oldMap.keySet()) {                
                //l.Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';        Compile Time Error
                //Trigger.oldMap.get(id).Test_Trigger__c = 'Trigger: Before Update - Trigger.oldMap Old Map';   Run Time Error
                System.debug('Trigger.oldMap Old Map = ' + Trigger.oldMap.get(id).Test_Trigger__c);
            }         
            System.debug('***End After Update***');
        }
        
        if(Trigger.isDelete) {
            System.debug('***After Delete***');
            //System.debug('Trigger.new : ' + Trigger.new.size());          NullPointerException
            //System.debug('Trigger.newMap : ' + Trigger.newMap.size());    NullPointerException    
            System.debug('Trigger.old : ' + Trigger.old.size());        
            System.debug('Trigger.oldMap : ' + Trigger.oldMap.size());
            System.debug('***End After Delete***');
        }
        
        if(Trigger.isUnDelete) {
            System.debug('***After UnDelete***');
            System.debug('Trigger.new : ' + Trigger.new.size());
            System.debug('Trigger.newMap : ' + Trigger.newMap.size());  
            //System.debug('Trigger.old : ' + Trigger.old.size());          NullPointerException
            //System.debug('Trigger.oldMap : ' + Trigger.oldMap.size());    NullPointerException
            System.debug('***End After UnDelete***');
        }
    }
}