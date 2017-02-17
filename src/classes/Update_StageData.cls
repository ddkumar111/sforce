/**
 *  Purpose         :   Class Controller for Update the Opportunity Respect to Updation in stage picklist Fields Values
 * 
 *  Created By      :   Deepak
 * 
 *  Created Date    :   07/20/2015
 * 
 *  Revision Logs   :   V_1.0 - Created
 * 
 **/ 
public with sharing class Update_StageData {
	
	 //Opportunity instance
     public Opportunity opportunity {get;  set; }
     
     //public Opportunity opportunity {get; set;}
     //String to hold Opportunity id
     public String opportunityId;
     
     //String to hold the Opportunity stagename
     public String opportunityStageName;
     
     //Boolean Property
     public Boolean isUpdate{get ; set;}
     
     
 	 //Construcotr Initialization   
     public Update_StageData(){
     	
     	//set the default value of the flag
     	isUpdate = false;
     	
     	//get the opportunity id
     	opportunityId = ApexPages.currentPage().getParameters().get('id');
     	
     	//set the opportunity id for updation 
     	opportunity = new Opportunity(id = opportunityId);
     	
     	//get the opportunity stagename 
     	opportunityStageName = ApexPages.currentPage().getParameters().get('stageName');
     	opportunity.stagename = opportunityStageName; 	
     }
     
     //update the opportunity 
     public void  updateOpportunity(){
     	
     	try {	
     		update opportunity;
     		isUpdate = true ;     	
     	}
     
     catch(Exception e) {
   
   		//Add error on page
  		 ApexPages.addMessages(e);
  		 } 
     }  
}