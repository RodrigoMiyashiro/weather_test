import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wearther_test/src/ui/repository/weather_repository_executor.dart';

import '../interactor/weather_interactor_receiver.dart';

class WeatherRepository implements WeatherRepositoryExecutor {
  // final WeatherInteractorReceiver _receiver = WeatherInteractorReceiver();

  final WeatherInteractorReceiver _receiver;

  WeatherRepository(this._receiver);

  @override
  Future<void> obtainWeather(
      String baseUrl, String cityName, String apiKey) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/current?city=$cityName&key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        return _receiver.receiverWeather(responseData);
      }
    } on Exception catch (exception) {
      _receiver.receiverWeatherError('Error: $exception');
    }
  }
}
