import 'package:appdata/src/pages/signinPage.dart';
import 'package:flutter/material.dart';
import 'navDraver.dart';
class ExaminerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897b),
        title: Text('Examiner Home screen'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('Log In again'),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('/login');
          },// => AuthenticationProvider.of(context).logout(),
        ),
      ),
    );
  }
}
