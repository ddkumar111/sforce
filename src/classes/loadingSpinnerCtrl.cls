public class loadingSpinnerCtrl {
    public List<String> dropdown1{get; set;}
    public List<SelectOption> options;
    public void spin() {
        options = new List<SelectOption>();
        for(String s: dropdown1){
            if(s == '1'){
                options.add(new SelectOption('1','Value 1'));
                options.add(new SelectOption('2','Value 2'));
            }else if(s == '2'){
                options.add(new SelectOption('3','Value 3'));
                options.add(new SelectOption('4','Value 4'));
            }else if(s == '3'){
                options.add(new SelectOption('5','Value 5'));
                options.add(new SelectOption('6','Value 6'));
            }else if(s == '4'){
                options.add(new SelectOption('7','Value 7'));
                options.add(new SelectOption('8','Value 8'));
            }else if(s == '5'){
                options.add(new SelectOption('7','Value 9'));
                options.add(new SelectOption('8','Value 10'));
            }            
        }    
        long now = datetime.now().gettime();
        while(datetime.now().gettime()-now<2000); // Busy loop for 2000 ms to simulate delay
    }
    public List<SelectOption> getItems() {
        return options;
    }    
}