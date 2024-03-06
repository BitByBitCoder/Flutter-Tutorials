import 'dart:ui';

import 'package:flutter/material.dart';

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
                            '300.67°C',
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
              height: 10,
            ),
            const Text('Weather Forecast'),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                  ttt(),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: const Placeholder(),
            )
          ],
        ),
      ),
    );
  }

  Container ttt() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: 100,
        color: Colors.black,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '300.67F',
              style: TextStyle(fontSize: 10),
            ),
            Icon(
              Icons.cloud,
              size: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rain',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ));
  }
}
