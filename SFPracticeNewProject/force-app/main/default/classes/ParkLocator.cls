public class ParkLocator {
    public static String[] country(String countryName) {
        ParkService.ParksImplPort parksCountry = new ParkService.ParksImplPort();
        System.debug('Country Name : ' + parksCountry.byCountry(countryName));
        return parksCountry.byCountry(countryName);
    }
}