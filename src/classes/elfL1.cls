public class elfL1 {
     @AuraEnabled 
     public static Account getAccount(){
        return (Account) Database.query( ' SELECT Id,SicDesc, Name,Type,Rating,ParentId FROM Account LIMIT 1 ' )[0];
    }
    @AuraEnabled 
    public static Account saveAccount(Account account){
        upsert account;
        return account;
    }
}