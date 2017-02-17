/**
*
*	Purpose			:	Controller class for the NewTaskWithLightningPage.
*
*	Created By		:	Deepak
*
*	Created Date 	:	2/12/2016
*
*	Revision Log	: 	V_1.0 Created 
*
**/
public with sharing class NewTaskCreatedController {
	
	//Properties
	public static Task task{get; set;}
	public List<SelectOption> selectOptionList { get; set;}
	public  static List<Task> taskList{get; set;}
	public String selectedStatus{ get; set;}
	
	//Contact Properties for the related task
	public Contact taskWithContact{get; set;}  
	
	//Class Constructor 
	public NewTaskCreatedController() {
		
		//Inialize the task 
		task = new Task();
		selectOptionList = new List<SelectOption>();
		
		//Query through the task details  
		taskList = [select Id, Status, WhoId, Who.Name, WhatId, What.Name, ActivityDate from Task ORDER BY LastModifiedDate ASC ];
		
		system.debug('taskvalue' + taskList);
		
		//Mapping
		//for (Schema.PicklistEntry p : Schema.getGlobalDescribe().get('Task').getDescribe().fields.getMap().get('Status').getDescribe().getPickListValues()) {
			//selectOptionList.add(new SelectOption(p.getValue(), p.getLabel()));
		//}
		
	}
	
	/**
	*
	*	@description	:	This method is used save the createdTask.
	*
	*	@args			:   
	*
	*	@return			:	Void
	*
	**/
	@RemoteAction
	public static void saveTaskData() {
		
		//Creation the data for the task 
		task = new Task(Status = 'Completed', WhoId = '00Q28000001nDK4EAM', Subject = 'Task', Type = 'Task', ActivityDate = Date.Today());
		
		//DML Operation
		insert task;
		
		//Query on the task 
		taskList = [select Id, Status, WhoId, Who.Name, WhatId, What.Name, ActivityDate from Task ORDER BY LastModifiedDate DESC LIMIT 1];
		
		//Reinilaation the task
		task = new Task();
		
		
	}
	
	/**
	*
	*	@description		:	This method is used for submit the created task.
	*
	*	@args				:	
	*
	*	@return				:	Void
	*
	**/
	
	public void submitTask() {
		
		//
		
		
	}
	
	/**
     *  @description    :   These method is used to Populate Task Who Id Data on User Change by selecting Lookup value.
     *
     *  @args           :
     *
     *  @return         :   void
     *
     **/
    public void taskContactPopulate(){
        
        if(task.WhoId != null){
            
            taskWithContact = [select Id, AccountId, Name, MobilePhone, Phone, Account.Name, Email, Title, FirstName from Contact where Id = :task.WhoId];    
        }else{
            taskWithContact = new Contact();
        }
     } 
	
	//Gettter properties for the selectionOption for the task's Status field 
	public List<SelectOption> getselectOptionList() {
    
        List<SelectOption> options = new List<SelectOption>();
        
        //Add the listitem to List
        options.add(new SelectOption('-- None -- ', '-- None --'));
        options.add(new SelectOption('New' , 'New'));
        options.add(new SelectOption('In Progress', 'It')); 
        options.add(new selectOption('Completed', 'Completed'));
        options.add(new selectOption('Cancelled','Cancelled'));
        options.add(new selectOption('Correction','Correction'));
        options.add(new selectOption('Approval','Approval'));
        options.add(new selectOption('Not Required','Not Required'));
        
    
        return options;    
    } 
		
}