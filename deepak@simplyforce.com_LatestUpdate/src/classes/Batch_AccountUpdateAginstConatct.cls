/**
 *  Purpose         :   Batch class for update the Account Name Nasa update in the Contact Record.
 * 
 *  Created By      :   Deepak
 * 
 *  Created Date    :   07/24/2015
 * 
 *  Revision Logs   :   V_1.0 - Created
 * 
 **/ 
global class Batch_AccountUpdateAginstConatct implements Database.Batchable<sObject> {
	
	// Start Method
	global Database.QueryLocator start(Database.BatchableContext BC){
       	
       	//Varibale to hold the current date time value	
       	DateTime currentDateTime = DateTime.now();
		
		//Varibale to hold the 15 minute ago date time value
		DateTime fifteenMinuteAgoDateTime = DateTime.now().addMinutes(-15);
		
		//String variable to hold the Account records those were created in last 15 minute and so.
		String sOQLQuery = 'SELECT id, name  FROM Contact  where  AccountId = null  AND  CreatedDate >: fifteenMinuteAgoDateTime AND CreatedDate <=: currentDateTime ';
  	
  	
       	// fetching records of Contact Objects
        //List<Contact> query = [SELECT id, name  FROM Contact  where AccountId != null && CreatedDate > 2015-07-09]; 
             
    	// Return the list of Contavt records thet were fetchd from querey
        return Database.getQueryLocator(sOQLQuery);
       }
        
	//Execute Logic
    global void execute(Database.BatchableContext BC, List<Contact> scope){
    	
    	System.debug('@@@@@@' + scope[0].id );
    	
		//Query to account record name is nasa 
		List<Account> account = [Select id  from  Account where name = 'Nasa' ];
	
    	//check the size
        if(account.size()>0){
        
        	//List to hold the contact record
        	//List<Contact> contactss = new List<Contact>();
        
        	//Loop through the contact record 
        	for(Contact contact : scope){
        		
        		contact.AccountId = account[0].Id;     
        	}
        	update scope; 
        }	       
    
    } 
    //Execute  logic
    global void finish(Database.BatchableContext BC){
            
    }
   
    
}