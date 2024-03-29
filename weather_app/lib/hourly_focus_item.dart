// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class HourlyForecast extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecast({
    Key? key,
    required this.time,
    required this.temperature,
    required this.icon,
  }) : super(key: key);

  void fetch() {
    final response = http.get(Uri.parse(''));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Container(
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '$time',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Icon(
                  icon,
                  size: 32,
                ),
                Text(
                  '$temperature',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
