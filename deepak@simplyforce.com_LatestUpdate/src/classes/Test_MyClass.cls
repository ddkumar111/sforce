@isTest
public class Test_MyClass
{
        static testMethod void doValidateSumValue() 
    {
        MyClass mys1 = new MyClass();
        System.assertEquals(0, mys1.sumvalue);
        mys1.dosum(3,4);
        System.assertEquals(7, mys1.sumvalue);
    }

}