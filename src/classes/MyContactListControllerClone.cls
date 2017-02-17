public class MyContactListControllerClone {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Email, Title, Phone From Contact];
    }
	@AuraEnabled 
    public static void save() {
        
        
    }
    
}