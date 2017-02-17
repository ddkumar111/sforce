trigger Trigger_School on School__c (before insert, before update, after insert, after update) 
{

     //Checking for the request type
    if(trigger.isBefore)
    {
        
        //Cheecking for the event type
        if(trigger.isInsert)
       {
   	    	//Calling helper class method to perform the logic
            SchoolTriggerHelper.validateEstYear(trigger.new);
        }
        if(trigger.isUpdate){
            SchoolTriggerHelper.validateEstYear(trigger.new);
            SchoolTriggerHelper.updateBPLStudents(trigger.new);
        }
    }
    
    if(trigger.isAfter) {
        
         if(trigger.isUpdate)
         
      //populate the children of School with Name        
      SchoolTriggerHelper.populateChildrenStudentsWithDesiredName(trigger.new, trigger.oldMap);
      
       }
    
}