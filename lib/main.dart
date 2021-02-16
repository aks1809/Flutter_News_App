import 'package:flutter/material.dart';
import 'category_page.dart';
import 'side_menu.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SideMenu(),
          CategoryPage(),
        ],
      ),
    );
  }
}
