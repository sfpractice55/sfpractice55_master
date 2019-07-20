@isTest
private class BenchmarkingTest {
	@isTest
    public static void testNewAllocate() {
        for(Integer x = 0;x<10000;x++) {
            returnNewMap();
        }
    }
    
    private static Map<Integer, String> returnNewMap() {
        Map<Integer, String> result = new Map<Integer, String>();
        return result;
    }
}