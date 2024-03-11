import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static bool ontheme = true;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void gettoggles() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyApp.ontheme ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> navButtons = [
    'Home',
    'Photos',
    'Videos',
    'Favorates',
    'Interested',
    'View All'
  ];
  late String selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = navButtons[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('helloi'),
            TextButton(
                onPressed: () {
                  Theme.of(context).scaffoldBackgroundColor.blue;
                  setState(() {});
                },
                child: Text('onoff')),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: navButtons.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: GestureDetector(
                          onTap: () {
                            selectedItem = navButtons[index];
                            setState(() {});
                          },
                          child: Chip(
                              backgroundColor: selectedItem == navButtons[index]
                                  ? Colors.amber
                                  : Colors.white,
                              label: Text(navButtons[index].toString()))),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
