public class MyList {
                  
    public MyList(){
    List<School__c> schools = [SELECT ID FROM School__c WHERE CreatedDate = LAST_WEEK];
	System.debug('#####'+  schools );
     }
}