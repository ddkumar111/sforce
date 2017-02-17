public class AccountControllerData {
    
    //Enable this method for access in the aura component
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [Select Name, Id From Account Order By Name Limit 6];
    }
}