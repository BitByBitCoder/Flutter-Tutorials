import 'package:currency_converter/currency_converter.dart';
import 'package:currency_converter/currency_converter_cupertino.dart';
import 'package:currency_converter/festures/buttonzir.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Cupertino());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: CurrencyConverter());
  }
}

class Cupertino extends StatefulWidget {
  const Cupertino({super.key});

  @override
  State<Cupertino> createState() => _CupertinoState();
}

class _CupertinoState extends State<Cupertino> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: CurrencyConverterCupertino());
  }
}
