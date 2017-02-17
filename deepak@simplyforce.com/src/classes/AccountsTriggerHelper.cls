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
public with sharing class AccountsTriggerHelper {
	
	/**
     *  @description    :   This method is for validate and upadte the  values of categaery
     *  @return         :   Void
     *
     **/
     
	public static void updateAccountValues(List<Account> newRecord , Map<Id , Account>mapOfAccounts){
		
	 	//Loop through the Account record
		for(Account account : newRecord){
			
			//check the condition
			if(account.Categary__c != '' ){
            	
            	//check the Level1 is true 
            	if(account.Categary__c == 'Level1'){
            		
            		account.Level1__c = true;
                	account.Level2__c = false;
                	account.name = account.name + account.Industry;
            	}
            	else{
            		
            		account.Level2__c = true;
            		account.Level1__c = false;
            	}	
            	//account.Level1__c = true;	
            	//account.Level2__c = true;
			}    		
		}	
	}
}