/**
 *  Purpose         :   Helper class for keep methods of all the pre and update processing operations for Account Object Trigger
 * 
 *  Created By      :   Deepak
 * 
 *  Created Date    :   07/21/2015
 * 
 *  Revision Logs   :   V_1.0 - Created
 * 
 **/ 
public with sharing class OpportunityTriggerHelper {
	
	/**
     *  @description    :   This method is for validate and upadte the  values of Opportunity Objects
     *  @return         :   Void
     *
     **/	
	
	public static void updateOpportunity(List<Opportunity>opportunityRecord , Map<Id, Opportunity> mapOfOpportunity){
		
		set<id> accountids = new set<id>();
		
		//list the  the hld the all accountstoupdate
		List<Account> accountsToUpdate = new List<Account>();
		
		if(opportunityRecord != null ) {
			
			//Loop through the Opportunity Objects
			for(Opportunity opportunity : opportunityRecord){
				
				//check the stage for Closed won and Account not null 
				if(opportunity.stageName == 'Closed Won' && opportunity.AccountId != null 
					&& (mapOfOpportunity == null  || ( mapOfOpportunity != null && (opportunity.stageName != mapOfOpportunity.get(opportunity.id).stageName || opportunity.AccountId != mapOfOpportunity.get(opportunity.id).AccountId) ))){
					
					//Set the value in the Description of opportuntiy
					//opportunity.Description = 'stage is closed Won';
					accountids.add(opportunity.Accountid);
				}
			}	
			//check for the null
			if(accountids != null && accountids.size()>0){
				
				//Loop through the Account 	
				for(Account account : [Select id, name , Description From Account where id IN : accountids ] ){
				
					account.Description = 'Close Won is chnged';	
					accountsToUpdate.add(account);
				}
			}			
		}else {
			
			for(Opportunity oldOpp : mapOfOpportunity.values()) {
				accountids.add(oldOpp.Accountid);
			}
			
				//check for the null
			if(accountids != null && accountids.size()>0){
				
				//Loop through the Account 	
				for(Account account : [Select id, name , Description From Account where id IN : accountids ] ){
				
					account.Description = '';	
					accountsToUpdate.add(account);
				}
			}	
		}
		
		//Check the size of the list
		if(accountsToUpdate.size() > 0)
			update 	accountsToUpdate;
	}
}