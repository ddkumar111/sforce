public class MyClass
{
    @testvisible integer sumvalue {  get; set;}
        public MyClass()
    {
        sumvalue=0;
    }
            
        public void dosum(integer x,integer y)
        {
            sumvalue=x+y;
        }

}