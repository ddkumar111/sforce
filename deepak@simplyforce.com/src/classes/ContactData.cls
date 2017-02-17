public class ContactData{
    
    public List<Contact> displayData{get; set;}
    public Contact contact {get;set;}
      
    public ContactData(){
      
        contact = new Contact();          
        displayData = [select Department ,MailingCity ,Description, Birthdate, Name from Contact ORDER BY LastModifiedDate DESC LIMIT 5];

        }
    public void save(){
        
        insert contact;
        displayData = [select Department ,MailingCity ,Description, Birthdate, Name from Contact ORDER BY LastModifiedDate DESC LIMIT 5];
        contact = new Contact();    
    }
        
}