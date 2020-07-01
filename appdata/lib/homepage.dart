import 'package:flutter/material.dart';
// change `flutter_database` to whatever your project name is
import 'database_helper.dart';
import 'model.dart';
import 'ipdata.dart';
import 'dbdispla.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';


class AllDataa extends StatefulWidget {
  @override
  _AllDataa createState() => _AllDataa();
}

class _AllDataa extends State<AllDataa> {


  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
 
  
  String classOptions;
   List classdata = [];

  List<Map<String, dynamic>> planet ;
 
  //List planetList = ["planet", "Venus", "Earth"];
  bool isSearching = false;
  




  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('insert', style: TextStyle(fontSize: 20),),
              onPressed: () {adddatabase();},
            ),
            
            RaisedButton(
              child: Text('query', style: TextStyle(fontSize: 20),),
              onPressed: () {_query();},
            ),
             
            RaisedButton(
              child: Text('query', style: TextStyle(fontSize: 20),),
              onPressed: () {_queryclassb();},
            ),
            RaisedButton(
              child: Text('update', style: TextStyle(fontSize: 20),),
              onPressed: () {_update();},
            ),
            RaisedButton(
              child: Text('delete', style: TextStyle(fontSize: 20),),
              onPressed: () {_delete();},
            ),
            RaisedButton(
              child: Text('ipdata', style: TextStyle(fontSize: 20),),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllData()),
              );},
            ),
            RaisedButton(
              child: Text('ipdata', style: TextStyle(fontSize: 20),),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );},
            ),
           
          ],
        ),
      ),
    );
    
  }
  
  // Button onPressed methods
  void adddatabase(){
   int count=countriesdata.length;
   if(count>0){
  print(count);
  int dat,c,e;
    String a;
    
    for(dat=0;dat<count;dat++){ 
     a= countriesdata[dat]['countryName'];
    c= countriesdata[dat]['id'];
   _insertclassb(a ,c);
  }
    for(dat=0;dat<licenseclassdata.length;dat++){ 
     a= licenseclassdata[dat]['className'];
    e= licenseclassdata[dat]['id'];
    _insert(a ,e); 
    }}}
  void _insert(String name , int ids ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.columnName :name,
      DatabaseHelper.columnAge  : ids,
      DatabaseHelper.columnId   : ids,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
   void _insertclassb(String name , int ids ) async {

    Map<String, dynamic> rowclassb = {
      DatabaseHelper.columnNameb :name,
      DatabaseHelper.columnAgeb  : ids,
      DatabaseHelper.columnIdb   : ids,
    };
    final id = await dbHelper.insertclassb(rowclassb);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
  void _queryclassb() async {
    final allRowsclassb = await dbHelper.queryAllRowsclassb();
    print('query all rows:');
   
    classdatamap(allRowsclassb);
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge  : 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }


 



}


