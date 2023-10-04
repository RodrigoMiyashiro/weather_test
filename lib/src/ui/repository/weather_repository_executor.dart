abstract class WeatherRepositoryExecutor {
  Future<void> obtainWeather(String baseUrl, String cityName, String apiKey);
}
