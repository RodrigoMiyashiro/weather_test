abstract class WeatherPresenterProvider {
  Stream<String> get outController;
  Future<void> obtainWeather(String baseUrl, String cityName, String apiKey);
  void dispose();
}
