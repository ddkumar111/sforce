trigger Trigger_Student on Student__c (before insert, before update, after insert ,after update)
{
    
     if(trigger.isAfter) {
        
        if(trigger.isUpdate || trigger.isInsert){
            StudentTriggerHelper.updateNumberOfStudentAndMostRecentBPL(trigger.new);
            //StudentTriggerHelper.DefinedEstYear(trigger.new);
        }
    }

}