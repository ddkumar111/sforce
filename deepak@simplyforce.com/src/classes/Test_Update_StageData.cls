/**    Description    :    This class is Testing Update_StageData. 
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
public with sharing class Test_Update_StageData {
	
	/**
      * @Description    :   Method to check functionality of Update_StageData 
      *
      * @args           :   Deepak
      *
      * @return         :   void
      *
      **/
	
	static testMethod void unitTest(){
		
		//List to hold the opportunity Record 
		List <Opportunity> opportunity = new List<Opportunity>();
		
		opportunity.add(new Opportunity(Name = 'tester' , CloseDate = Date.today() ,  StageName ='Closed Won')) ;
		opportunity.add(new Opportunity(Name = 'testerr' , CloseDate = Date.today() ,  StageName ='Closed Won')) ;
		opportunity.add(new Opportunity(Name = 'testder' , CloseDate = Date.today() ,  StageName ='Closed Won')) ;
		opportunity.add(new Opportunity(Name = 'testsert' , CloseDate = Date.today() ,  StageName ='Closed Won')) ;
		
		
		//Test start from here
	    Test.startTest();
	    
	    insert opportunity;
	    
	    //Constructor Calling
	    Update_StageData updateStage = new Update_StageData();
	    
	    //Setter Properties 
	    updateStage.opportunityId = opportunity[0].Id;
	    updateStage.opportunityStageName = opportunity[0].StageName;  
	    updateStage.isUpdate = false ;
	   
	    //Method Calling
	    updateStage.updateOpportunity();
	   
	   	//assert result
	   	//System.assertEquals(true ,opportunity.isUpdate); 
	    
	    //Test stop here 
		Test.stopTest();
		
		
	}
}