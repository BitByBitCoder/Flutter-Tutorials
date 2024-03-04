import 'package:currency_converter/festures/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  List<String> Alist = ['hruiaia', 'kapatea', 'ffffff'];

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
          actions: [
            IconButton(
                onPressed: () {
                  Alist.add('hellloo');
                  setState(() {});
                },
                icon: Icon(Icons.plus_one))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('0', style: Constants.size),
                TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    // style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        focusedBorder: Oborder,
                        enabledBorder: Oborder,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.money),
                        hintText: 'Please enter the amount in SD')),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber)),
                    onPressed: () {
                      //debug , release , profile
                      // release mode a run duh chuan flutter  run --release

                      if (kDebugMode) {
                        print('hello debug');
                      }
                    },
                    child: Text('click'))
              ],
            ),
          ),
        ));
  }
}
