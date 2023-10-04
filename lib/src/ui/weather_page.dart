import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wearther_test/src/ui/components/center_text_component.dart';
import 'package:wearther_test/src/ui/components/climate.dart';
import 'package:wearther_test/src/ui/components/header_information.dart';
import 'package:wearther_test/src/ui/components/modal_search_city.dart';
import 'package:wearther_test/src/ui/utils/widget_utils.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String baseUrl = 'https://api.weatherbit.io/v2.0';
  String apiKey = '391fd5946ae545588bb9c074fbdf438f';
  String cityName = 'São Paulo';

  Future<WeatherData> fetchWeatherData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/current?city=$cityName&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      return WeatherData.fromJson(responseData);
    } else {
      throw Exception('Não foi possivel carregar o clima dessa região');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima tempo'),
        actions: [
          IconButton(
            onPressed: () {
              WidgetUtils.showModalUtils(
                context,
                ModalSearchCity(
                  country: cityName,
                  onSearch: (search) {
                    setState(() {
                      cityName = search;
                    });
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E3B42),
              Color(0xFF448AFF),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: FutureBuilder(
                future: fetchWeatherData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return CenterTextComponent(
                      text: 'Error: ${snapshot.error}',
                    );
                  }
                  if (snapshot.hasData) {
                    final weatherData = snapshot.data;

                    if (weatherData != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeaderInformation(
                              cityName: weatherData.cityName,
                              countryCode: weatherData.countryCode,
                              dateTime: weatherData.datetime.substring(
                                  0, weatherData.datetime.length - 3),
                              hour: weatherData.hour,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Climate(
                              temperature: weatherData.temperature,
                              description: weatherData.description,
                              min: weatherData.min,
                              max: weatherData.max,
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return const CenterTextComponent(
                    text: 'Sem dados disponíveis',
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
// DateTime.parse(currentWeather['ob_time']).toLocal()
                    
