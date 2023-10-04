import 'package:wearther_test/src/ui/interactor/weather_interactor_provider.dart';
import 'package:wearther_test/src/ui/interactor/weather_interactor_receiver.dart';
import 'package:wearther_test/src/ui/presenter/weather_presenter_listener.dart';

import '../repository/weather_repository.dart';

class WeatherInteractor
    implements WeatherInteractorProvider, WeatherInteractorReceiver {
  late WeatherRepository _repository;
  late WeatherPresenterListener _listener;

  WeatherInteractor(WeatherPresenterListener listener) {
    _listener = listener;
  }

  @override
  Future<void> obtainWeather(
      String baseUrl, String cityName, String apiKey) async {
    // String baseUrl = 'https://api.weatherbit.io/v2.0';
    // String apiKey = '391fd5946ae545588bb9c074fbdf438f';
    // String cityName = 'São Paulo';

    _repository.obtainWeather(baseUrl, cityName, apiKey);
  }

  @override
  void receiverWeather(String value) {
    _listener.receiverWeather(value);
  }

  @override
  void receiverWeatherError(String error) {}
}
