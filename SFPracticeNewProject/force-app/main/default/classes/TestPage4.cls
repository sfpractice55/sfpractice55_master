public class TestPage4 {
    public static boolean showSection1{get;set;}
    public static boolean showSection2{get;set;}
    public static boolean showSection3{get;set;}
    public String fieldToEdit;
    public TestPage4() {
        showSection1 = false;
        showSection2 = true;
        showSection3 = true;
    }
    
    public PageReference method1() {
        showSection1 = false;
        showSection2 = true;
        showSection3 = false;
        return null;
    }
    
    public String getFieldToEdit() {
        return fieldToEdit;
    }
    
    public void renderField() {
        fieldToEdit = ApexPages.currentPage().getParameters().get('fieldToShow');
    }
    
    public PageReference method2() {
        showSection1 = true;
        showSection2 = false;
        showSection3 = true;
        return null;
    }
}