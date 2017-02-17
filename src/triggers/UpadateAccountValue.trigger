trigger UpadateAccountValue on Account (before insert, before update , before delete, after delete) {
    
    //Check for request type
    if(Trigger.isBefore) {
        
        //Check for event type
        if(Trigger.isInsert || Trigger.isUpdate  ) {
            
            //This method format phone numbers
            AccountsTriggerHelper.updateAccountValues(Trigger.new , Trigger.oldmap);
        
        
        
        }
    }else {
    
        //Check for event type
        if( Trigger.isDelete ) {
            
            //This method format phone numbers
            AccountsTriggerHelper.updateAccountValues(Trigger.new , Trigger.oldmap);
        
        
        
        }
        
    }
}