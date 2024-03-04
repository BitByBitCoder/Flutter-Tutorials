// import 'package:flutter/material.dart';

// class CurrencyConverter extends StatelessWidget {
//   const CurrencyConverter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(children: <Widget>[
//         TextButton(
//             onPressed: () {
//               popup(context, 'fuckyoiu');
//             },
//             child: Text('click')),
//         TextButton(
//             onPressed: () {
//               modal(context);
//             },
//             child: Text('click')),
//         TextButton(
//             onPressed: () {
//               menu(context);
//             },
//             child: Text('click'))
//       ]),
//     );
//   }

//   void popup(BuildContext context, title) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("$title"),
//             content: Text("This is my popup message"),
//             actions: [
//               TextButton(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           );
//         });
//   }

//   void modal(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             height: 200,
//             child: Center(
//               child: Text("This is a bottom sheet"),
//             ),
//           );
//         });
//   }
// }

// void menu(BuildContext context) async {
//   var selected = await showMenu(
//     context: context,
//     position: RelativeRect.fromLTRB(100, 100, 100, 100),
//     items: [
//       PopupMenuItem<int>(
//         value: 1,
//         child: Text("Item 1"),
//       ),
//       PopupMenuItem<int>(
//         value: 2,
//         child: Text("Item 2"),
//       )
//     ],
//   );
// }
