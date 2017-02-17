public class StudentShow {

    public School__c sch{ get; set; }
     public Student__c stu{ get; set;}
     
     
     
     public StudentShow(){
       
       sch = new School__c();
       stu = new Student__c();
       
      }
      
      public void saveRecord(){
        
        insert sch;
        
        }
       


















}