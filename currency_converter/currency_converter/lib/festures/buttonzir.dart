import 'package:flutter/material.dart';

class ButtonZir extends StatefulWidget {
  const ButtonZir({super.key});

  @override
  State<ButtonZir> createState() => _ButtonZirState();
}

class _ButtonZirState extends State<ButtonZir> {
  var buttonColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('hlelo'),
            ////////////
            Expanded(
              child: TextButton(
                // clipBehavior: Clip.antiAlias,
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50)),
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  foregroundColor: MaterialStatePropertyAll(Colors.green),
                  overlayColor: MaterialStatePropertyAll(Colors.blue),
                  shadowColor: MaterialStatePropertyAll(Colors.brown),
                ),
                child: Text('click'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
