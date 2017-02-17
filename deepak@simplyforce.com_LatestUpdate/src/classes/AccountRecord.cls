public class AccountRecord {
	@AuraEnabled
	public static void saveExpense(Account acc) {
    // Perform isUpdateable() check here 
    insert acc;
    
	}

}