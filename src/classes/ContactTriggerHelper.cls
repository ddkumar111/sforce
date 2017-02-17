/**
 *  Purpose         :   Helper class for keep methods of all the pre and update processing operations for Conatact  Object Trigger
 * 
 *  Created By      :   Deepak
 * 
 *  Created Date    :   07/21/2015
 * 
 *  Revision Logs   :   V_1.0 - Created
 * 
 **/ 
public with sharing class ContactTriggerHelper {
	
	/**
     *  @description    :   This method is for validate and upadte the  values of categaery
     *  @return         :   Void
     *
     **/
     
     //method  for the update the account lastcontact valiue field values
     public static void accountUpdateLast(List<Contact> contacts , map<Id , Contact > mapOfContactRecord){
     	
     	set<id> accountids = new set<id>();
		
		//list the  the hld the all accountstoupdate
		List<Account> accountsToUpdate = new List<Account>();
		
		if(contacts != null ) {
			
			//Loop through the Opportunity Objects
			for(Contact conatct : contacts){
				
				//check the stage for Closed won and Account not null 
				//if(mapOfOpportunity == null  || ( mapOfOpportunity != null && (opportunity.stageName != mapOfOpportunity.get(opportunity.id).stageName || opportunity.AccountId != mapOfOpportunity.get(opportunity.id).AccountId) ))){
					
					
					accountids.add(conatct.Accountid);
				}
				
			//check for the null
			if(accountids != null && accountids.size()>0){
				
				//Loop through the Account 	
				for(Account account : [Select id, name , Last_Contact__c From Account where id IN : accountids ORDER BY lastModifiedDate Desc ] ){
				
					//account.Last_Contact__c = ;
					accountsToUpdate.add(account);
				}
			}			
		} 
		else {
			
			for(Contact oldCon : mapOfContactRecord.values()) {
				accountids.add(oldCon.Accountid);
			}
			
				//check for the null
			if(accountids != null && accountids.size()>0){
				
				//Loop through the Account 	
				for(Account account : [Select id, name , Description From Account where id IN : accountids ] ){
				
					
					accountsToUpdate.add(account);
				}
			}	
		}
		
		//Check the size of the list
		if(accountsToUpdate.size() > 0)
			update 	accountsToUpdate;
	}


}