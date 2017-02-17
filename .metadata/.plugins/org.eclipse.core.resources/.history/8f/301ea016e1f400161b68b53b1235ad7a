public class Account_Contact {


         

        public Account  acc{get; set;}
        public Contact  conts{get; set;}
          
          

       public Account_Contact(){
     
        acc = new Account();
        conts = new Contact();
      } 
        
       public void doSaveAccount(){
         
       }
       
      public PageReference next(){
         
        // PageReference contsPage = new ApexPages.StandardController(conts).view();
         //contsPage.setRedirect(false);
        //return contsPage;
       // PageReference pageRef = Page.Contact_Page;
        //pageRef.setRedirect(true);
          // return pageRef; 
       return Page.Contact_Page.setRedirect(false);   
       
        }
        
      //public PageReference Contact_pagebyGet(){
        
        //  PageReference pageRef = Page.Contact_Page;
          //pageRef.setRedirect(true);
          //return pageRef; 
    //}
 
        
        
        
        public PageReference Previous_Account(){
        
         return Page.AccountsPage;
        
        }
        
       
       public void doSaveContact(){
          
          insert conts;
       
       }
       public PageReference saveNext(){
       
          return Page.Account_Contact_Page.setRedirect(false);
       
       }
       
       
       
        



}