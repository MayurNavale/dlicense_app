import 'package:appdata/src/pages/signinPage.dart';
import 'package:flutter/material.dart';
void  main() => runApp(MyApp());
class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dlicence',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primaryColor: Color.fromARGB(255, 25,178,238),//Colors.deepPurple,
        accentColor:Color.fromARGB(255, 25,178,238)
         ),
      home:LogInPage(),
    );
  } 
}
