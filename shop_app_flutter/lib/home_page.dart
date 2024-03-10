import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata', 'ffff'];
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: border,
                          enabledBorder: border)),
                )
              ],
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            side: BorderSide(
                              color: Color.fromRGBO(255, 247, 249, 1),
                            ),
                            backgroundColor: Color.fromRGBO(255, 247, 249, 1),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            label: Text(filter.toString())),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
