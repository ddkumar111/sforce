@isTest
public class Test_SchoolTrigger
{
    
    // 1 of tocheck the bplstudents
    static testMethod void doValidate()
    {
        
        School__c schh = new School__c(name='Jaipur' , Principal_Name__c = 'Deeepak');
        insert schh;
        
        Student__c st1  = new Student__c(name='abss' , IsBpl__c=true , School__c=schh.id);
         insert st1;
        
                  //integer n =  (integer)schh.get(count().sti);
             integer num = [select count() from Student__c ];
        System.assertEquals(2 , num);
        
    }

}