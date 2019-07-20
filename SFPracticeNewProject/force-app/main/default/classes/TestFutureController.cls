public class TestFutureController {
    public TestFutureController() {
        System.debug('Entered TestFutureController');
    }
    
    public static void callingFutureMethod() {        
        System.debug('Entering callingFutureMethod');
        thisFutureMethod();
        System.debug('Exiting callingFutureMethod');
    }
    
    @future(callout=true)
    private static void thisFutureMethod() {
        System.debug('Printing Future Method');
    }
}