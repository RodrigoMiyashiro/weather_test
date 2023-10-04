// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather/src/ui/components/center_text_component.dart';
// import 'package:weather/src/ui/components/climate.dart';
// import 'package:weather/src/ui/components/header_information.dart';
// import 'package:weather/src/ui/components/modal_search_city.dart';
// import 'package:weather/src/ui/presenter/weather_presenter.dart';
// import 'package:weather/src/ui/presenter/weather_presenter_provider.dart';
// import 'package:weather/src/ui/utils/widget_utils.dart';

// import 'models/weather.dart';

// class WeatherPageV2 extends StatefulWidget {
//   const WeatherPageV2({super.key});

//   @override
//   State<WeatherPageV2> createState() => _WeatherPageV2State();
// }

// class _WeatherPageV2State extends State<WeatherPageV2> {
//   late WeatherPresenterProvider _weatherPresenterProvider;
//   String baseUrl = 'https://api.weatherbit.io/v2.0';
//   String apiKey = '391fd5946ae545588bb9c074fbdf438f';
//   String cityName = 'São Paulo';

//   @override
//   void initState() {
//     _weatherPresenterProvider = WeatherPresenter();
//     _weatherPresenterProvider.obtainWeather(baseUrl, cityName, apiKey);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Clima tempo'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               WidgetUtils.showModalUtils(
//                 context,
//                 ModalSearchCity(
//                   country: cityName,
//                   onSearch: (search) {
//                     setState(() {
//                       cityName = search;
//                     });
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.search_rounded,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         height: double.maxFinite,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF2E3B42),
//               Color(0xFF448AFF),
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: StreamBuilder(
//                 stream: _weatherPresenterProvider.outController,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator();
//                   }
//                   if (snapshot.hasError) {
//                     return CenterTextComponent(
//                       text: 'Error: ${snapshot.error}',
//                     );
//                   }
//                   if (snapshot.hasData) {
//                     // final weatherData = snapshot.data;
//                     final weatherData = snapshot.data as WeatherData;

//                     if (weatherData != null) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 20,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             HeaderInformation(
//                               cityName: weatherData.cityName,
//                               countryCode: weatherData.countryCode,
//                               dateTime: weatherData.datetime.substring(
//                                   0, weatherData.datetime.length - 3),
//                               hour: weatherData.hour,
//                             ),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             Climate(
//                               temperature: weatherData.temperature,
//                               description: weatherData.description,
//                               min: weatherData.min,
//                               max: weatherData.max,
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   }
//                   return const CenterTextComponent(
//                     text: 'Sem dados disponíveis',
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
