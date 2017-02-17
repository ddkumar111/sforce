public class MylastWeekSchool
{

   public MylastWeekSchool()
   {
          
          List<Student__c>mylist = new List<Student__c>();
           mylist=[select id,name from Student__c];
           for(Student__c s:mylist)
           {
           System.debug(s.id);
          System.debug(s.name);
           }
           
          
          
          
   
   
   }


}