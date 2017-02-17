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
public with sharing class Test_AccountTriggerHelper {
    
    /**
      * @Description    :   Method to check functionality of OpportunityTriggerHelper 
      *
      * @args           :   Deepak
      *
      * @return         :   void
      *
      **/
        
    static testMethod void unitTest() {
        
        //List  to hold the Account recrd 
        List<Account> accounts = new List<Account>();
        
        //Account
        accounts.add(new Account(name = 'deepak1', Active__c = 'testdd' , SLAExpirationDate__c = Date.today(), SLA__c = 'testwe' , Description = 'this is stage' ,  Categary__c = 'Level1' ));
        accounts.add(new Account(name = 'deepak2', Active__c = 'testda' , SLAExpirationDate__c = Date.today(), SLA__c = 'testwq' , Description = 'this is stage2' ,  Categary__c = 'Level2'  ));
        accounts.add(new Account(name = 'deepak3', Active__c = 'testsdd' , SLAExpirationDate__c = Date.today(), SLA__c = 'testdw' , Description = 'this is gghs' ,  Categary__c = 'Level1' ));
        accounts.add(new Account(name = 'deepak4', Active__c = 'testsds' , SLAExpirationDate__c = Date.today(), SLA__c = 'testgg' , Description = 'this is nsncsj' , Categary__c = 'Level2'  ));
        
        //Test start from here
        Test.startTest();
        
        //insert Account
        insert accounts; 
        
        
        //Query to get Account records
        List<Account> accs = [Select id ,Level1__c , Level2__c from Account where Id IN : accounts];
        
        //Assert for results
        System.debug('#################');
        System.assertEquals(true, accs[0].Level1__c);
        System.assertEquals(false, accs[0].Level2__c);
        
        //Query to get Account Record
        //Account acc1 = [Select id ,Level1__c , Level2__c from Account where Id =: account[1].Id];
        
        //Assert for results
        System.assertEquals(true, accs[1].Level2__c);
        System.assertEquals(false , accs[1].Level1__c);
        
        //Test stop here
        Test.stopTest();
    }   
}