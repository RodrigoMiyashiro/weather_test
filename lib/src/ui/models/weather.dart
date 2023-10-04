class WeatherData {
  final double temperature;
  final String description;
  final String cityName;
  final String countryCode;
  final String datetime;
  final String timezone;
  final String hour;
  final String max;
  final String min;

  WeatherData({
    required this.temperature,
    required this.description,
    required this.cityName,
    required this.countryCode,
    required this.datetime,
    required this.hour,
    required this.timezone,
    required this.max,
    required this.min,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['data'][0]['temp'].toDouble(),
      description: json['data'][0]['weather']['description'],
      cityName: json['data'][0]['city_name'],
      countryCode: json['data'][0]['country_code'],
      datetime: json['data'][0]['datetime'],
      timezone: json['data'][0]['timezone'],
      max: json['data'][0]['app_temp'].toString(),
      min: json['data'][0]['app_temp'].toString(),
      hour: json['data'][0]['ob_time'],
    );
  }
}
