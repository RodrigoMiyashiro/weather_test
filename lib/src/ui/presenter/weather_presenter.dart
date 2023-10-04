import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wearther_test/src/ui/presenter/weather_presenter_listener.dart';
import 'package:wearther_test/src/ui/presenter/weather_presenter_provider.dart';

import '../interactor/weather_interactor_provider.dart';

class WeatherPresenter extends ChangeNotifier
    implements WeatherPresenterProvider, WeatherPresenterListener {
  final StreamController<String> _controller = StreamController<String>();

  @override
  Stream<String> get outController => _controller.stream;

  late WeatherInteractorProvider _interactor;

  @override
  Future<void> obtainWeather(
      String baseUrl, String cityName, String apiKey) async {
    _interactor.obtainWeather(baseUrl, cityName, apiKey);
  }

  @override
  void receiverWeather(String value) {
    _controller.sink.add(value);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
