global class batchOpportunityUpdate implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name FROM School__c';
        return Database.getQueryLocator(query);
        
    }
   
    global void execute(Database.BatchableContext BC, List<School__c> scope)
    {
         for(School__c a : scope)
         {
             a.Name = a.Name + 'DeepakKUmawat';            
         }
         update scope;
         System.debug('#####'+ scope);
    }   
    global void finish(Database.BatchableContext BC)
    {
    }
}