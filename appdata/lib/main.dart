import 'package:flutter/material.dart';
// change `flutter_database` to whatever your project name is
import 'ipdata.dart';
void  main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AllData(),
    );
  }
}
