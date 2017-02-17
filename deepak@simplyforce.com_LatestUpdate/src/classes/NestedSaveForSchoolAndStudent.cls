public class NestedSaveForSchoolAndStudent {

    public School__c school {get; set;}
    public Student__c student {get; set;}
    
    
    public NestedSaveForSchoolAndStudent() {
        school = new School__c();
        student = new Student__c();
    }
    
    public void doSave() {
        
        insert student;
        
        insert school;
        
        System.debug(student.School__c = school.Id);
        //update student;
    }
}