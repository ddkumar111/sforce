public class ContactResult {
        
    public List<Contact> displayData{get; set;}
    public Contact contact {get;set;}
      
    public ContactResult (){
      
        contact = new Contact();          
        displayData = [select Department  ,Description, Email, Birthdate ,Name,FirstName ,LastName from Contact ORDER BY LastModifiedDate DESC LIMIT 20];

        }
    public void save(){
        
        insert contact;
        displayData = [select Department,Description, Email,Name,FirstName ,LastName,Birthdate from Contact ORDER BY LastModifiedDate DESC LIMIT 20];
        contact = new Contact();   
    }
}