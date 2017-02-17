//Batch CLass 
global class Batch_Update  implements Database.batchable<sObject>  {
  

    
    //Start Method
    global database.queryLocator start(database.batchableContext bc ) {
                                
        //Passing the query List to execute method
        return database.getQueryLocator([SELECT id, ownerId, Shared__c FROM candidate__c where shared__c = false]);
    }
    
    //Execute method
    global void execute(Database.batchableContext bc, List<candidate__c> candidates ) {
        
        //Delaring a map of candidate with respect of owner
        Map<id,List<Candidate__c>> mapOwnerWtihRecord = new Map<id,List<Candidate__c>>();
        
        //Iterating over candidate
        for(candidate__c candidate : candidates) {
            
            //Checking map has Contains ownerId of candidate Record
            if(mapOwnerWtihRecord.containsKey(candidate.ownerId)) {
                
                //Adding Candidate with the respect of Owner id
                mapOwnerWtihRecord.get(candidate.ownerId).add(candidate);
            } else {
                
                //Adding Candidate with respect of Owner id
                mapOwnerWtihRecord.put(candidate.ownerId, new List<Candidate__c>{candidate} );
            }         
        }   
        
        //Creationg new Map of owner's manager with respaect of owner 
        Map<Id, Set<Id>> mapOfUSerWithOwner = new Map<id, Set<id>>();       
        
        //Iterating Over Manager id from user sObject
        for(User usr : [SELECT id, ManagerId, Manager.ManagerId, Manager.Manager.ManagerId, Manager.Manager.Manager.ManagerId FROM user
                            WHERE id IN : mapOwnerWtihRecord.keySet()]) {
                    
            //Checking if manager id is null            
            if(usr.Managerid != null) {
                
                //putting manager records with the correspoand of the Owner
                mapOfUserWithOwner.put(usr.Id, new Set<id>{usr.ManagerId});
            }    
                
            if(usr.Manager.Managerid!=null) {
                
                //putting manager records with respect of the Owner
                mapOfUserWithOwner.get(usr.Id).add(usr.Manager.ManagerId);
            }
                           
            //Checking if manager.manager.manager id is null
            if( usr.Manager.Manager.ManagerId != null) {
                
                //putting manager records with respect of the Owner
                 mapOFUserWithOwner.get(Usr.Id).add(usr.Manager.Manager.ManagerId);
            } 
            
            //Checking if manager.manager.manager.manager id is null  
            if( usr.Manager.Manager.Manager.ManagerId != null){
                
                 //Putting manager records with the correspoand of the Owner
                 mapOFUserWithOwner.get(Usr.id).add(usr.Manager.Manager.Manager.ManagerId); 
            }
        }

        //List of candidate share object
        List<Candidate__Share> shareRecordsWithManagers = new List<candidate__share>();
        
        //List of candidate to be update
        List<Candidate__C> candidateToUpdate = new List<candidate__C>();
        
        //Checking if map is filled
        if(mapOwnerWtihRecord.size() > 0) {
            
            //Iterating over id of owner
            for(Id usrId : mapOwnerWtihRecord.keySet()) {
                
                //Checking  map of manager id with Owner is filled
                if(mapOfUSerWithOwner.size() > 0) {
                    
                    //Checking if map contains usr id
                    if(mapOfUSerWithOwner.containsKey(usrId )) {
                        
                        //Getting all Manager record for owner
                        Set<Id> managerIds = mapOfUSerWithOwner.get(usrId);
                        
                        //Iterating over manager Ids
                        for(Id ownermanagerId : managerIds ){
                            
                            //Getting all candidate record for Owner and sharing each record with his manager
                            for(Candidate__c candidateToShare : mapOwnerWtihRecord.get(usrId)) {
                                
                                //Shared chekbox on that particular record is set to true
                                candidateToShare.shared__c = true;
                                
                                //Adding shareing record access to maneeger in list
                                candidateToUpdate.add(candidateToShare);                                
                                
                                //Maintainng List of Shared users Manager
                                shareRecordsWithManagers.add(new candidate__share(userORGroupId = ownermanagerId, accessLevel = 'Read', 
                                                            parentId = candidateToShare.id));                           
                            }
                        }
                    }
                }
            }
        }
        
        //Checking If List Of Sharing Records is Fiiled
        if(shareRecordsWithManagers.size() > 0)
            
            //Upsert List of shared Records
            upsert shareRecordsWithManagers;
        
        //Cheking if Record of Candidate is exist that to be shared
        if(candidateToUpdate.size() > 0)
            
            //Upsert Candidate Record
            upsert candidateToUpdate;
        
    }   
    
    //Finish Method      
    global void finish(database.batchablecontext bc ){
        
    
}

}