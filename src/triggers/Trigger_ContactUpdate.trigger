trigger Trigger_ContactUpdate on Account (before delete, before insert, before update) {
	
	//check for the request type
	if(trigger.isBefore){
		
		//check the event type
		if(trigger.isInsert || trigger.isUpdate || trigger.isDelete){
			
			
			
			
		}
	}
}