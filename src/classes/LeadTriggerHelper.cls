/** 
*	Description			:	This Helper is used for the LeadTrigger.
*		
*	Created By			:	Deepak
*
*	Created Date 		:	3/3/2016  
*
*	Revision Log		:	V_1.0 Created
*
**/
public without sharing class LeadTriggerHelper {
	
	/**
	*	@description		:	This method is used for the add the atttachement under the lead record.
	*
	*	@args				:	Trigger.new 
	*
	*	@return				:	void 
	*
	**/
	public static void addAttachment(List<Lead> newLeads) {
		
		//List to hold the Attachments
		List<Attachment> attachements =  new List<Attachment>();
		
		System.debug('NewLeads' + newLeads);
		//System.debug('NewLeads' + lead.Description);
			
		//Lopp through the new leeads
		for(Lead lead : [Select Id, Description From Lead where id in : newLeads]) {
			
			//Check the description field
			if(String.isNotBlank(lead.Description)) { 
				
				//Fetch the type of the Content
				String contentType = lead.Description.substringBetween('data:',';');
				
				//Fetch the actualContet from the String 
				String ActualValue = lead.Description.substringAfter('base64,');
				
				//Decode the encoded Base64 
				Blob afterblob = EncodingUtil.base64Decode(ActualValue);
				
				//To convert Description field to Blob Datatype 
				//Blob bBody = Blob.valueOf(ActualValue);
		
				//Add Attachmentss to the list	
				attachements.add(new Attachment(Name = 'Test', ParentId = lead.Id, body = afterblob, ContentType = contentType));
					
			}
		}
		
		//Inseert the list of the Attachment
		if(attachements.size() > 0)
			insert attachements;
		
	}
	
	/**
	*	@description			:	This class is used for the save the record in the salesforce
	*
	*	@args					:	
	*
	*	@return					:	void
	*
	**/
	public static void createAttachment(List<Lead> newLeads) {
    
    	//map to hold the LeadId with Attach key
        Map<String, Id> mapLeadIdWithKey = new Map<String, Id>();
        
        //Loop through the leead
        for(Lead lead : newLeads) {
        	
        	//Add to map
        	mapLeadIdWithKey.put(lead.SFAuraCMP__Attach_Key__c, lead.Id);
        }
        
        //Check the size
        //if(mapLeadIdWithKey.size() == 0)
        	//return;
        
        //Fetch the document related to attachKey
        List<Document> documents = [Select Id, Name, Body, ContentType, Description from Document Where Description != null AND Folder.DeveloperName = 'Site_Folder'
        							AND Description =:  mapLeadIdWithKey.keySet()];
        
        //List to hold the Attachemnts 
        List<Attachment> attachemnts = new List<Attachment>(); 
        
        //Check the size 
        if(documents.size() > 0) {
        	
        	//Loop through the documents
        	for(Document doc : documents) {
            
	        	//Add Attachmentss to the list  
	        	attachemnts.add(new Attachment(Name = doc.Name, ParentId = mapLeadIdWithKey.get(doc.Description), body = doc.Body, ContentType = doc.ContentType));
       		}
        }
        
        //check the size
        if(attachemnts.size() > 0) {
            
            //insert the Attachement
            insert attachemnts;
            
            //Delete the documents
            delete documents;
        }
    }
}