public class ContactScreen {

     public Contact contact {get;set;}
     public string indus{get; set;}
     public string depart{get; set;}
     public string roless{get; set;}
     
     
     public list<selectoption> getindustry1(){

        list<selectoption> options= new list<selectoption>();
        
        list<Contact> indus = [select industry__c from Contact];
        
        System.debug('################ ' + indus.size() );
        
        options.add(new selectoption('—-Select Industry—-', '-Select Industry—-'));
        
        for( Contact ins: indus){
        
        options.add(new selectoption(ins.industry__c,ins.industry__c));
        }
        return options;
     }
             
     
     public list<selectoption> getdepartment1(){

        list<selectoption> options= new list<selectoption>();
        
        list<Contact> depart= [select Department__c from Contact];
        
        options.add(new selectoption('—-Select Department—-', '-Select Department—-'));
        
        for( Contact depar: depart){
        
        options.add(new selectoption(depar.Department__c ,depar.Department__c ));
        }
        return options;
     }
     
     public list<selectoption> getrole1(){

        list<selectoption> options= new list<selectoption>();
        
        list<Contact> roless = [select Role__c from Contact];
        
        options.add(new selectoption('—-Select Role —-', '-Select Role —-'));
        
        for( Contact rol: roless){
        
        options.add(new selectoption(rol.Role__c ,rol.Role__c ));
        }
        return options;
     }
     
  }