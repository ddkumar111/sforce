/**
*	Description			:	This is class is used forr the add atttachemnts underr thee leadd record.
*
*	Created By			:	deepak
*
*	Created Date 		:	3/3/2016
*
*	Revision Log 		:	V_1.0 Created 
**/
public with sharing class AttachmentHtmlController {
	
	//Lead instanse
	public Lead lead {get; set;}
	
	
	//Constructor
	public AttachmentHtmlController() {
		
		lead = new Lead();
	}
	
	/**
	*	@description			:	This class is used for the save the record in the salesforce
	*
	*	@args					:	
	*
	*	@return					:	void
	*
	**/	
	
	//Method to save the record
	public void submit() {
		
		//insert the record
		insert lead;
		
		//Add the meassage on the Attachements 
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Attachment Successfully Uploaded'));
		
		//reinialiationn the lead
		lead = new Lead();
	}	
}