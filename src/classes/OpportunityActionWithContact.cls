/**
 *  Description     :   This is controller class for Contact custom action.
 *
 *  Created By      :   
 *
 *  Created Date    :   11/10/2016
 *
 *  Version         :   V_1.0 
 *
 *  Revision Log    :   V_1.0 - Created 
 **/
public with sharing class OpportunityActionWithContact{
    
    //Properties 
    public Contact contact;
    public Opportunity opp{get; set;}
        
    //Constructions   
    public OpportunityActionWithContact(ApexPages.StandardController stdController) {
        this.contact = (Contact)stdController.getRecord();
        opp = new Opportunity(); 
    }
       
    //Method save the Opportunity record    
    public void save(){
         
        //Insert the opportunity 
        insert opp;
        opp = new Opportunity(); 
    }
     
}