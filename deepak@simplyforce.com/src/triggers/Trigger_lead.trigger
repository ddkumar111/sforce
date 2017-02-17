/** 
*	Description		:	This trigger handle the all pre processing opertaion for the lead.
*
*	Created By		:	Deepak
*	
*	Created Date 	:	3/3/2016
*
*	Revision Log 	:	V_1.0 Created
*
**/
trigger Trigger_lead on Lead (After insert) {
	
	//Check for thee request type 
    if(Trigger.isAfter) {
    	
    	//Check for the event
    	if(Trigger.isInsert) {
    		
    		//Call the LeadTriggerhelper class method  
    		//LeadTriggerHelper.addAttachment(Trigger.new);
    		LeadTriggerHelper.createAttachment(Trigger.new);
    		
    	}
    }

}