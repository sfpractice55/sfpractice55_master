trigger TestTriggerEvents on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
           System.debug('Is Before....Is Insert');
        } else if (Trigger.isUpdate) {
            System.debug('Is Before....Is Update');
        } else if (Trigger.isDelete) {
            System.debug('Is Before....Is Delete');
        } else if (Trigger.isUndelete) {
            System.debug('Is Before....Is UnDelete');
        } else {
            System.debug('No Event');
        }
    } else if(Trigger.isAfter) {
       if(Trigger.isInsert) {
           System.debug('Is After....Is Insert');
        } else if (Trigger.isUpdate) {
            System.debug('Is After....Is Update');
        } else if (Trigger.isDelete) {
            System.debug('Is After....Is Delete');
        } else if (Trigger.isUndelete) {
            System.debug('Is After....Is UnDelete');
        } else {
            System.debug('No Event');
        }
    }
}