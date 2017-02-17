global class scheduledAccountUpdate1 implements Schedulable {
    global void execute(SchedulableContext SC) {
        
        Account acc = new Account();
        acc.Name = 'testdeeee';
        
        insert acc ;
        
        Datetime dT = System.now();
         dT = dT.addSeconds(10);
         Integer month = dT.month();
         Integer year = dT.year();
         Integer day = dT.day();
         Integer hour = dT.hour();
         Integer minute = dT.minute();
         Integer second = dt.second();
         
         
         //Cron experession
         String cron = second + ' ' +  minute + ' ' +  hour  + ' ' + day + ' '+ month  + ' ? ' + year;
        
         System.schedule('Inserting Hosting Record11'+ dT.time(), cron, new scheduledAccountUpdate1());
    }
}