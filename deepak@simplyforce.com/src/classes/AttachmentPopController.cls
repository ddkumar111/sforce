public with sharing class AttachmentPopController {

    public Document document {get; set;}
    public String attachKey {get;set;} 
    
    //Class constructor 
    public AttachmentPopController() {
        
        //Inialize the document
        document = new Document();
    }
    
    //Generate the Unique no. for the document 
    //Long gettime = DateTime.now().getTime();
    //DateTime myDateTime = DateTime.now();
    
    //Integer secondValue = myDateTime.millisecond();
    
    Double value  = math.random();
    
    //Fetch the folder' Id 
    List<Folder> folders = [Select Id from Folder where DeveloperName ='Site_Folder' limit 1];
    
    public PageReference uplaod() {
        
        //Attach the document to the particuler folder
        document.FolderId = folders[0].Id;
        document.Description = String.valueOf(value);
        attachKey = document.Description;
        
        //Insert the document
        insert document;
        
        //Add the meassage on the Attachements 
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Uploaded'));
        
        //Reinialization of the document 
        document = new Document();
        
        return null;
        
    }   
    
}