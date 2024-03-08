import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_focus_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '300K',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.22',
                    time: '00.00',
                  ),
                  HourlyForecast(
                    time: '03:00',
                    icon: Icons.sunny,
                    temperature: '300.22',
                  ),
                  HourlyForecast(
                    time: '06.00',
                    icon: Icons.cloud,
                    temperature: '303.33',
                  ),
                  HourlyForecast(
                    time: '09.00',
                    icon: Icons.sunny,
                    temperature: '302',
                  ),
                  HourlyForecast(
                    time: '12.00',
                    icon: Icons.cloud,
                    temperature: '302',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdditionalInfoItem(
                  value: '98',
                  label: 'Humidity  ',
                  icon: Icons.water_drop_sharp,
                ),
                AdditionalInfoItem(
                  value: '7.67',
                  label: 'Wind Speed ',
                  icon: Icons.air,
                ),
                AdditionalInfoItem(
                  value: '1006',
                  label: 'Pressure  ',
                  icon: Icons.beach_access,
                ),
                // AdditionalInfoItem(),
                // AdditionalInfoItem(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
