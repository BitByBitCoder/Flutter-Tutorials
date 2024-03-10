import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                prefixIconColor: Color.fromRGBO(225, 225, 225, 1),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 209, 192, 81)),
            useMaterial3: true),
        home: HomePage());
  }
}
