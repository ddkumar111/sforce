/**    Description    :    This class is Testing the Batch_AccountUpdateAginstConatct . 
  *                          
  *    Created By      :    Deepak
  * 
  *    Created Date    :    07/23/2015
  *
  *    Revisison Log   :    V_1.0 - Created
  *
  *    Coverage        :     
**/
@isTest
public with sharing class Test_Batch_AccountUpdateAginstConatct {
	
	/**
      * @Description    :   Method to check functionality of Batch_AccountUpdateAginstConatct 
      *
      * @args           :   Deepak
      *
      * @return         :   void
      *
      **/
	static testMethod void unitTest(){
	
		//Account
		Account account = new Account(name = 'Nasa', Active__c = 'testdd' , SLAExpirationDate__c = Date.today(), SLA__c = 'testwe' , Description = 'this is stage' , SLASerialNumber__c = 'testerr'  );
		insert account;		
		
		Account accout = new Account(name = 'Neha' , Active__c = 'tste' ,SLAExpirationDate__c = Date.today() , SLA__c = 'testwe' ) ;
		insert accout;
			
		//List to hold the Contact revcord 
		List <Contact> contacts = new List<Contact>();
		
		
		contacts.add(new Contact(AssistantName = 'test' , 	LastName = 'tester' , AccountId = null , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = accout.id  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));
		contacts.add(new Contact(AssistantName = 'tester' , LastName = 'tester' , AccountId = null  , Description = 'test'));			
		
		insert contacts;
		
		//Test start from here
	    Test.startTest();
	    
		database.executebatch(new Batch_AccountUpdateAginstConatct() , 10);
	    
		//Test stop here
		Test.stopTest();
			   
	    //List to hold the Contavct record 
		List<Contact> contactss = [Select id , Account.Name, name from Contact ];
	    
	    
	    //Assert for results
	   	System.assertEquals('Nasa', contactss[0].Account.Name);
	   	System.assertEquals('Nasa', contactss[1].Account.Name);
	   	System.assertEquals('Nasa', contactss[2].Account.Name);
	   	System.assertEquals('Neha', contactss[5].Account.Name);
	    System.debug('@@@@@@@@@@' + contactss[5].Account.Name);		
	}
}