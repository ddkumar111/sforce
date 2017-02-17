/**
 *  Purpose         :   controller  for the display and update the contact record in the table 
 * 
 *  Created By      :   Deepak
 * 
 *  Created Date    :   08/17/2015
 * 
 *  Revision Logs   :   V_1.0 - Created
 * 
 **/ 
public with sharing class ContactPageController {
    
    //List type varible inilization
    public List<Contact> displayData{get; set;}
    
    //Constructor 
    public ContactPageController(){
        
        //Query get the Conatct record latest 5 
        displayData = [select Department ,Description, Birthdate, Name from Contact ORDER BY CreatedDate DESC LIMIT 5];
    }
    

}