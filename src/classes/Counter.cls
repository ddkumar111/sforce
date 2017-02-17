public class Counter
{
     public Counter()
       {
          Integer number2 ;
          number2 = [Select Count() From Student__c];
           System.debug(' total no. of students thats are presents :' + number2);
       }
}