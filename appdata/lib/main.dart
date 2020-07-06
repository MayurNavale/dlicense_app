import 'package:flutter/material.dart';
import 'apidata.dart';
import 'homepage.dart';
void  main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: AllDataa(),
     home:Homepage(),
    );
  }
}
