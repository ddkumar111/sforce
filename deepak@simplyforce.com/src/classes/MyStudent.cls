public class MyStudent
{
     public MyStudent()
     {
        List<School__c> tlist;
       
         tlist = [Select name From School__c where name IN ('APS','SPS')];
          
           for(School__c d : tlist)
           {
             System.debug(d.name);
           }
      }
}