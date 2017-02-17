public class StudentTriggerHelper {
	
	public static void updateNumberOfStudentAndMostRecentBPL(List<Student__c> stuentlist){
	//To check the IsBpl chechbox
	 
	if(stuentlist[0].IsBpl__c==true){
		
		//SetId of School
		Set<ID> schoolID=new Set<ID>();
		
		//List of School object to maintain the Record
	    List<School__c> school=new List<School__c>();
        
        //Loop through Studentlist
        for(Student__c std:stuentlist)
        	{
        	schoolID.add(std.School__c);
           // System.debug();
        	}
        
        //Loop through the School record and update the no. of Students	& name
        for(School__c sch : [select name,NoofBplstudents__c,MostRecentBplStudents__c from School__c where id=:schoolID ]){
        	if(sch.NoofBplstudents__c==null){
            	sch.NoofBplstudents__c=1;
            }
            else{
            	sch.NoofBplstudents__c=sch.NoofBplstudents__c+1;
            }
        sch.MostRecentBplStudents__c=stuentlist[0].name;
        school.add(sch);
        }
        
        //Update the school Objects 
        update school;
          }
	   }
  }