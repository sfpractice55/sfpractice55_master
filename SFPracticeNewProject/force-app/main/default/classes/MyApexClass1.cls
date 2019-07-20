global class MyApexClass1 {

	webservice String parameter { get; set; }

	public MyApexClass1() {
		this.parameter = 'value';
	}

	webservice static String serviceName(){
		return '';
	}
}