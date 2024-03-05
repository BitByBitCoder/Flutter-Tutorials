import 'package:currency_converter/festures/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  List<String> Alist = ['hruiaia', 'kapatea', 'ffffff'];
  double usdToInr = 0.0;
  final convertController = TextEditingController();
  void convert() {
    if (convertController.text.isNotEmpty) {
      double price = double.parse(convertController.text.toString());
      double converting = 82.92 * price;
      print(price.runtimeType);
      setState(() {
        usdToInr = converting;
      });
    } else {
      print('enter something');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Oborder = OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        borderRadius: BorderRadius.all(Radius.circular(40)));
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: Text('kj'),
          centerTitle: true,
          title: Text('Currency converter'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${usdToInr.toStringAsFixed(2)}', style: Constants.size),
                TextField(
                  controller: convertController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  // style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      focusedBorder: Oborder,
                      enabledBorder: Oborder,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.money),
                      hintText: 'Please enter the amount in SD'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        //minSize means you need to take atleast this size
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        elevation: 10.0,
                        shadowColor: Colors.black),
                    onPressed: () {
                      //debug , release , profile
                      // release mode a run duh chuan flutter  run --release
                      convert();
                    },
                    child: const Icon(
                      Icons.money,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ));
  }
}
