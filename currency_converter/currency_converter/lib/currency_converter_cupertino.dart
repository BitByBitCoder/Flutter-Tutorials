import 'package:currency_converter/festures/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>
      _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState
    extends State<CurrencyConverterCupertino> {
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
  void dispose() {
    convertController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          automaticallyImplyMiddle: true,
          middle: Text(
            'Currency Converter',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${usdToInr.toStringAsFixed(2)}', style: Constants.size),
                CupertinoTextField(
                  placeholder: 'Please enter the amount in usd',
                  prefix: Icon(CupertinoIcons.money_dollar),
                  controller: convertController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  // style: TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                    color: CupertinoColors.black,
                    onPressed: () {
                      //debug , release , profile
                      // release mode a run duh chuan flutter  run --release
                      convert();
                    },
                    child: Text('convert'))
              ],
            ),
          ),
        ));
  }
}
