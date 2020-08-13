import 'package:appdata/src/pages/signinPage.dart';
import 'package:flutter/material.dart';
void  main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dlicence',
      theme: ThemeData( primarySwatch: Colors.blue, ),
      home:LogInPage(),
    );
  } 
}
