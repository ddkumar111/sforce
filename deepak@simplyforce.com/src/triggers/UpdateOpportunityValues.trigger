trigger UpdateOpportunityValues on Opportunity (before delete, before insert, before update) {
	
	//check the request type	
    if(trigger.isBefore){
    	
    	//check the event type
    	if(trigger.isInsert || trigger.isUpdate || trigger.isDelete){
        
        	OpportunityTriggerHelper.updateOpportunity(trigger.new , trigger.oldmap);
    	}    	
    }


}