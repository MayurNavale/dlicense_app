import 'dart:ffi';

import 'package:flutter/material.dart';
import 'model.dart';
class HomePage extends StatefulWidget {
 
  
  _HomePageState createState() => _HomePageState();
}
 List<Map<String, dynamic>> planetB=[];
class _HomePageState extends State<HomePage> {
  var isLoading = false;
String classOptions='asdfg';
String instructorsOptions;
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api to sqlite'),
       

      ),
      body:_instructorsOptions(),
      
      );
}
Widget _instructorsOptions() {
    return ListTile(
      leading: Text('Instructors :'),
      title: DropdownButton<String>(
        hint: Text('Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            instructorsOptions = newValue;
          });
        },
      
          items: planetB.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
            );
          }).toList(),
        value: instructorsOptions,
        
      ),
    );
  }
}

classdatamap( List<Map<String, dynamic>> planet){
  planetB=planet;
 }