//Define the Controller for the dependented picklist 
public class ContactSelectValue {
    
    //Properties for the Selected value
    public string selectedIndustry {get;set;}
    public string selectedDepartment{get;set;}
    public string selectedRole{get;set;}
    
    //Properties for the list variable
    public List<SelectOption> departmentSelectedOption{get;set;}
    public List<SelectOption> roleSelectedOption {get; set;}
      
   
    public List<SelectOption> getindustrySelectOption() {
    
        List<SelectOption> options = new List<SelectOption>();
        
        //Add the listitem to List
        options.add(new SelectOption('-- None -- ', '-- None --'));
        options.add(new SelectOption('Bank' , 'Bank'));
        options.add(new SelectOption('It', 'It')); 
        options.add(new selectOption('Arts', 'Arts'));
        options.add(new selectOption('School','School'));
    
        return options;    
    } 
    
    //define the action method for department list and add corressponding values
    public void populateOption(){
    
        departmentSelectedOption = new  List<SelectOption>();       
        
        //check the condition for selectedIndustry
        if(selectedIndustry == 'Bank'){
              
            System.debug('@@@@@@@@@' +  selectedIndustry);
              
            departmentSelectedOption.add(new SelectOption('BOB', 'BOB'));
            departmentSelectedOption.add(new SelectOption('SBI', 'SBI'));
            departmentSelectedOption.add(new SelectOption('PNB', 'PNB'));   
        }
        
        else if(selectedIndustry == 'It'){
        
            departmentSelectedOption.add(new SelectOption('C', 'C'));
            departmentSelectedOption.add(new SelectOption('C++','C++'));
            departmentSelectedOption.add(new SelectOption('Java','Java'));
        }
        
        else{
        
            departmentSelectedOption.add(new SelectOption('Geography', 'Geography'));
            departmentSelectedOption.add(new SelectOption('Political', 'Political'));
        }            
    } 
    
    //define the action method for role list
    public void populateOptionRole(){
    
        roleSelectedOption = new List<SelectOption>();
        
        //check the condition for selectedDepartment and add corressponding values
        if((selectedDepartment == 'BOB') || ( selectedDepartment == 'SBI' ) || (selectedDepartment == 'PNB')){
        
            roleSelectedOption.add(new SelectOption('Manager' , 'Manager'));
            roleSelectedOption.add(new SelectOption('P.O.', 'P.O.'));
        }      
        
        else if((selectedDepartment == 'C') || (selectedDepartment == 'C++' ) || (selectedDepartment == 'Java')){
        
            roleSelectedOption.add(new SelectOption('Coder' , 'Coder'));
            roleSelectedOption.add(new SelectOption('Desingner', 'Desingner'));
        }
        else
            roleSelectedOption.add(new SelectOption('Leader' , 'Leader'));
            roleSelectedOption.add(new SelectOption('Teacher','Teacher'));
        }
}