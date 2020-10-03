import 'package:appdata/examiner/src/dashboard/homepage.dart';
import 'package:appdata/src/pages/home_page.dart';
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
        primaryColor: Colors.blue,//Colors.deepPurple,
        accentColor:Colors.blue//.fromARGB(255, 25,178,238)
         ),
          initialRoute: '/login',
        routes: {
          '/login': (context) => LogInPage(),
           '/user': (context) => HomePage(),
          '/schooladmin': (context) => ExaminerHomeScreen(),
      },
    );
  }
}
