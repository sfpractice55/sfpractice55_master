public class staticRecursiveTrigger {
	private static Boolean alreadyExecuted = false;
    
    public static boolean hasAlreadyExecuted() {
        return alreadyExecuted;
    }
    
    public static void setAlreadyExecuted() {
        alreadyExecuted = true;
    }
}