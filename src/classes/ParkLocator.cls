public class ParkLocator {
    public static List<String> country (String c) {
        ParkService.ParksImplPort parkS = new ParkService.ParksImplPort();
        return parkS.byCountry(c);
    }

}