public without sharing class AccountTriggerHelper {
	
    //Method to update the account field
    public static void updateData(List<Account> newAccounts, Map<Id, Account> mapOldAccount) {
        
        System.debug('@@@@@ newAccounts ' + newAccounts[0].SFAuraCMP__A_And_B__c);
        System.debug('@@@@@ mapOldAccount ' + mapOldAccount.get(newAccounts[0].Id).SFAuraCMP__A_And_B__c);
    }
}