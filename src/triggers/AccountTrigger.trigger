trigger AccountTrigger on Account (before update) {
    
    //Event check
    if (Trigger.isBefore) {
        
        //Request check
        if(Trigger.isUpdate) {
            
            //Call the helper class method 
            AccountTriggerHelper.updateData(Trigger.new, Trigger.oldMap);
        }
    }    
}