trigger CustomerAfterInsert on APEX_Customer__c (after update,after insert) 
{
    if(trigger.isAfter && trigger.isUpdate)
    {
        CustomerTriggerHelper.isAfterUpdateCall(trigger.new,trigger.newMap,trigger.oldMap);
        
    }
}