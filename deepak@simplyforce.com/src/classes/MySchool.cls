public class MySchool 
{
     public MySchool()
      {
        List<School__c> schools = [SELECT ID FROM School__c WHERE CreatedDate = LAST_WEEK];
        System.debug('#####'+  schools );
      }
}