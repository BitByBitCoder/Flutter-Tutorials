import 'dart:ui';
import 'package:intl/intl.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_focus_item.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool loading = true;
  double temp = 0.0;
  bool isLoading = false;

  //////////////////////////////////////////////////////////////////////////////////////
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      const String url =
          'https://api.openweathermap.org/data/2.5/forecast?lat=23.727106&lon=92.717636&appid=47ad85def6b51db2ee95e609c5bbe0b0';
      final response = await http.get(Uri.parse(url));
      final data = convert.jsonDecode(response.body);
      if (data['cod'] != '200') {
        throw 'Erro occured';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    getCurrentWeather();
    print(DateTime.now().toString());
    DateTime a = DateTime.now();
    print(DateFormat.jm().format(a));
    // TODO: implement initState
    super.initState();
  }

  ///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              getCurrentWeather();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              // Display the error message
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    Text('Error: ${snapshot.error}')
                  ],
                ),
              );
            }
            final data = snapshot.data!;
            final currentWeatherData = data['list'][0];
            final currentWeatherTemp = currentWeatherData['main']['temp'];

            final currentSky = currentWeatherData['weather'][0]['main'];
            final currentPressure = currentWeatherData['main']['pressure'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];
            final currentHumidity = currentWeatherData['main']['humidity'];

            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      color: Color.fromARGB(255, 45, 38, 38),
                      elevation: 10,
                      child: SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 9),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$currentWeatherTemp K',
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Icon(
                                    currentSky == 'Clouds' ||
                                            currentSky == 'Rain' ||
                                            currentSky == 'Drizzle' ||
                                            currentSky == 'Snow' ||
                                            currentSky == 'Thunderstorm' ||
                                            currentSky == 'Mist' ||
                                            currentSky == 'Smoke' ||
                                            currentSky == 'Haze' ||
                                            currentSky == 'Dust' ||
                                            currentSky == 'Fog'
                                        ? Icons.cloud
                                        : Icons.sunny,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    '$currentSky',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Weather Forecast',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            final currentTime = DateFormat.jm().format(
                                DateTime.parse(data['list'][i + 1]['dt_txt']));
                            return HourlyForecast(
                                icon: data['list'][i + 2]['weather'][0]['main'] ==
                                            'Clouds' ||
                                        data['list'][i + 2]['weather'][0]['main'] ==
                                            'Rain' ||
                                        data['list'][i + 2]['weather'][0]['main'] ==
                                            'Drizzle' ||
                                        data['list'][i + 2]['weather'][0]['main'] ==
                                            'Snow' ||
                                        data['list'][i + 2]['weather'][0]['main'] ==
                                            'Thunderstorm' ||
                                        data['list'][i + 2]['weather'][0]['main'] ==
                                            'Mist' ||
                                        data['list'][i + 2]['weather'][0]
                                                ['main'] ==
                                            'Smoke' ||
                                        data['list'][i + 2]['weather'][0]
                                                ['main'] ==
                                            'Haze' ||
                                        data['list'][i + 2]['weather'][0]
                                                ['main'] ==
                                            'Dust' ||
                                        data['list'][i + 2]['weather'][0]['main'] == 'Fog'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                temperature: '${data['list'][i + 1]['main']['temp']}',
                                time: '$currentTime');
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Additional Information',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AdditionalInfoItem(
                          value: '$currentHumidity',
                          label: 'Humidity  ',
                          icon: Icons.water_drop_sharp,
                        ),
                        AdditionalInfoItem(
                          value: '$currentWindSpeed',
                          label: 'Wind Speed ',
                          icon: Icons.air,
                        ),
                        AdditionalInfoItem(
                          value: '$currentPressure',
                          label: 'Pressure  ',
                          icon: Icons.beach_access,
                        ),
                        // AdditionalInfoItem(),
                        // AdditionalInfoItem(),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
  // SingleChildScrollView(
  //   scrollDirection: Axis.horizontal,
  //   child: Row(
  //     children: [
  //       for (int i = 0; i < 10; i++)
  //         HourlyForecast(
  //           icon: data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Clouds' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Rain' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Drizzle' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Snow' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Thunderstorm' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Mist' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Smoke' ||
  //                   data['list'][i + 2]['weather'][0]['main'] ==
  //                       'Haze' ||
  //                   data['list'][i + 2]['weather'][0]
  //                           ['main'] ==
  //                       'Dust' ||
  //                   data['list'][i + 2]['weather'][0]
  //                           ['main'] ==
  //                       'Fog'
  //               ? Icons.cloud
  //               : Icons.sunny,
  //           temperature:
  //               '${data['list'][i + 1]['main']['temp']}',
  //           time: '${data['list'][i + 1]['dt']}',
  //         ),
  //     ],
  //   ),
  // ),
}
