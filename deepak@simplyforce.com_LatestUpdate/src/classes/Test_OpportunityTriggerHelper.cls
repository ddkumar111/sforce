/**    Description    :    This class is Testing OpportunityTriggerHelper. 
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
public with sharing class Test_OpportunityTriggerHelper {
	
	/**
      * @Description    :   Method to check functionality of OpportunityTriggerHelper 
      *
      * @args           :   Deepak
      *
      * @return         :   void
      *
      **/
	
	static testMethod void unitTest(){
    
	   	
		//Account
		Account account = new Account(name = 'deepak', Active__c = 'test' , SLAExpirationDate__c = Date.today(), SLA__c = 'test' , Description = 'this is '  );
		insert account;
		
		//List to hold the opportunity Record 
		List <Opportunity> opportunity = new List<Opportunity>();
		
		//Opportunity 
		opportunity.add(new Opportunity(AccountID = account.id , Name = 'test' , CloseDate = Date.today() ,  StageName ='Closed Won')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test1' , CloseDate = Date.today() ,  StageName ='tetsre2')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test2' , CloseDate = Date.today() ,  StageName ='tetsre3')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test3' , CloseDate = Date.today() ,  StageName ='tetsre4')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test4' , CloseDate = Date.today() ,  StageName ='tetsre5')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test5' , CloseDate = Date.today() ,  StageName ='tetsre6')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test6' , CloseDate = Date.today() ,  StageName ='tetsre7')) ;
	    opportunity.add(new Opportunity(AccountID = account.id , Name = 'test7' , CloseDate = Date.today() ,  StageName ='tetsre8')) ;
	    
	    
	    //Test start from here
    	Test.startTest();
	    
	    //insert bthe opportunty
	    insert opportunity;
	    
	    //Query get the record 
	    List<Account> acc = [Select id , name , Description  from Account where id =: opportunity[0].AccountId];
	    
	    //Assert for results
	    System.assertEquals('Close Won is chnged' , acc[0].Description);
	   
		//delete the opportunity
	    delete opportunity;
	    
	    //query get the Account
	    List<Account>  accs = [Select id , name , Description From Account ];
	    
	    System.debug('#############' + accs);
	    System.debug('@@@@@@@@@@@@@@@' + accs[0].Description);
	    //Assert for results
	    System.assertEquals(null , accs[0].Description);
	   
	    //Test stop here
    	Test.stopTest();
	    
      }
}