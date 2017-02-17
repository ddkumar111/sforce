//Class on the SchoolTrigger
public class SchoolTriggerHelper 
{
    
    public static void validateEstYear(List<School__c> schools) 
        
    {
            //Loop through records
           for(School__c sch : schools) {
            
            if(String.isnotBlank(sch.Board__c) && sch.Board__c == 'CBSE'
              && sch.Est_year__c < 2000) {
                
                sch.addError('Please re-new yours aggrement');
            } else {
               sch.Is_Secondary__c = true;   
            }
        }
    }
     
  
    
    
    //update to est. year and  cbsc
    
     public static void populateChildrenStudentsWithDesiredName(List<School__c> schools, Map<Id, School__c> mapOldSchools) {
        
        //List of schools
        List<Student__c> students = new List<Student__c>();
        
        //Set to hold the schools IDs
        Set<Id> setSchoolsIds = new Set<Id>();
        
        for(School__c s : schools) {
            if(mapOldSchools != null && mapOldSchools.get(s.Id) != null 
               && s.Est_year__c != mapOldSchools.get(s.Id).Est_year__c) {
                setSchoolsIds.add(s.Id);
            }    
        }    
        
        if(setSchoolsIds.size() > 0) {
            
          //  for(Student__c std : [SELECT ID, Est_Year__c FROM Student__c 
                               //     WHERE School___c IN : setSchoolsIds]) {
                                        
              //  students.add(std);                        
           // }
        
            if(students.size() > 0)
                update students;
        }     
    }
    
    
  public static void updateBPLStudents(List<School__c> schools) {
        
        //Set to hold the school Ids
        Set<Id> schoolIds =new Set<Id>();
        
        for(School__c sch : schools)
            schoolIds.add(sch.Id);
        
        if(schoolIds != null && schoolIds.size() > 0) {
        
            Map<Id, Integer> mapSchoolIdWithCount = new Map<Id, Integer>();
            mapSchoolIdWithCount = doAggregateForCount(schoolIds);
                    
            for(School__c s : schools) {
                if(mapSchoolIdWithCount.containsKey(s.Id) && mapSchoolIdWithCount.get(s.Id) != null)
                    s.NoofBplstudents__c = mapSchoolIdWithCount.get(s.Id);   
                else
                    s.NoofBplstudents__c = 0;
            }
        }
    }
    
    public static Map<Id, Integer> doAggregateForCount(Set<Id> setSchoolIds) {
        
        Map<Id, Integer> mapSchoolIdWithCountValue = new Map<Id, Integer>();
        
        if(setSchoolIds != null && setSchoolIds.size() > 0) {
            
            Set<Id> tempSchoolIdsSet = new Set<Id>();
            tempSchoolIdsSet.addAll(setSchoolIds);
        
            for(AggregateResult st: [Select count(name) countNum, School__c sid 
                                                    From Student__c 
                                                    Where School__c IN : setSchoolIds 
                                                    And IsBpl__c=true 
                                                    group by School__c]) {
                if(st.get('sid') != null && st.get('countNum') != null) {                                    
                    mapSchoolIdWithCountValue.put(Id.valueOf(String.valueOf(st.get('sid'))), (Integer)st.get('countNum'));
                    tempSchoolIdsSet.remove(Id.valueOf(String.valueOf(st.get('sid'))));
                }    
            } 
            
            for(Id idValue : tempSchoolIdsSet) {
                mapSchoolIdWithCountValue.put(idValue , 0);
            }
        }   
        
        return mapSchoolIdWithCountValue;
    }    
}