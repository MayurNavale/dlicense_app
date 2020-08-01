import 'package:appdata/src/pages/signinPage.dart';
import 'package:flutter/material.dart';
//import 'package:appdata/src/pages/home_page.dart';
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
     //home:HomePage(),
    home:LogInPage(),
    );
  } 
}
