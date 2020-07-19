import 'package:appdata/licencepage.dart';
import 'package:flutter/material.dart';
// change `flutter_database` to whatever your project name is
import 'splashscreen.dart';
import 'model.dart';
import 'checkDBandAPIautomatic.dart';
import 'dbdispla.dart';
//import 'licencepage.dart';   
import 'package:appdata/licencePage/licencdhomepage.dart';
//imer timer;
//import 'package:http/http.dart' as http;


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  


  // @override
  // void initState() {
  //   print(urls.length);
     
  //    getCountries() {
  //     setState(() {
       
  //     });super.initState();
  

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
    print('home page');
    checkloaded();
  }
 void checkloaded() async {
  Future.delayed(const Duration(milliseconds: 3000), () {
 adddatabase();
});
  Future.delayed(const Duration(milliseconds: 1000));
 _queryall();
 Future.delayed(const Duration(milliseconds: 3000));
//   if(statedatalist.length>0){
//   Navigator.push(context,MaterialPageRoute(builder: (context) =>Licencepage()), );
//     print('\n');
// // classdatamap(allRowsclassb);
//   }
 }
  
  
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
              onPressed: () {_queryall();},
            ),
            
           
            // RaisedButton(
            //   child: Text('query', style: TextStyle(fontSize: 20),),
            //   onPressed: () {_queryclassb();},
            // ),
            // RaisedButton(
            //   child: Text('update', style: TextStyle(fontSize: 20),),
            //   onPressed: () {_update();},
            // ),
            // RaisedButton(
            //   child: Text('delete', style: TextStyle(fontSize: 20),),
            //   onPressed: () {_delete();},
            // ),
            RaisedButton(
              child: Text('new license page', style: TextStyle(fontSize: 20),),
              onPressed: () { 
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Licencepagehome()),
              );
              },
            ),
            // RaisedButton(
            //   child: Text('new license page', style: TextStyle(fontSize: 20),),
            //   onPressed: () { Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Licencepage()),
            //   );},
            // ),
            RaisedButton(
              child: Text('ipdata', style: TextStyle(fontSize: 20),),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              },
            ),
           
          ],
        ),
      ),
    );
    
  }
  
  // Button onPressed methods
  void adddatabase(){
   int count=countriesdata.length;
  print(count);
  int dat,a,b;
  String m,n,s;
  
   
    for(dat=0;dat<countriesdata.length;dat++){ 
       a= countriesdata[dat]['id'];
       m= countriesdata[dat]['countryCode'];
       n= countriesdata[dat]['countryName'];
       b= countriesdata[dat]['countryPhone'];
       print("$a $m $n $b");
  _insertcountriesdatatable(a,m,n,b);
  }print('class');
  msdela();
     for(dat=0;dat<licenseclassdata.length;dat++){ 
       a= licenseclassdata[dat]['id'];
       m= licenseclassdata[dat]['className'];
    print("$a $m ");
   _insertlicenseclassdatatable(a,m);
  }
  msdela();print('code');
   for(dat=0;dat<licensecodesdata.length;dat++){ 
       a= licensecodesdata[dat]['id'];
       m= licensecodesdata[dat]['code'];

      print("$a $m ");
  _insertlicensecodesdatatable(a,m);
  }
   msdela();
   print('title');
    for(dat=0;dat<licensetitlesdata.length;dat++){ 
       a= licensetitlesdata[dat]['id'];
       m= licensetitlesdata[dat]['title'];
       
    print("$a $m "); 
   _insertlicensetitlesdatatable(a,m);
  } 
  msdela(); print('tpe');
    for(dat=0;dat<licensetypedata.length;dat++){ 
       a= licensetypedata[dat]['id'];
       m= licensetypedata[dat]['typeName'].toString();
      
      print("$a $m $n $b");
  _insertlicensetypedatatable(a,m);
  }
  msdela(); print("state");
    for(dat=0;dat<statedata.length;dat++){ 
       a= statedata[dat]['id'];
       m= statedata[dat]['stateName'];
        b= statedata[dat]['countryId'];
        
        print("$a $m $n \n");
   _insertstatedatatable(a,m,b);
  }msdela();
   }
   void _insertcountriesdatatable(int countryids,String countryCodes ,String countryNames ,int countryPhones ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.countryid :countryids,
      DatabaseHelper.countryCode  : countryCodes,
      DatabaseHelper.countryName   : countryNames,
      DatabaseHelper.countryPhone   : countryPhones,
    };
   final countryid = await dbHelper.insertcountriesdatatable(row);
    print('inserted row id: $countryid');
  }
  void _insertlicenseclassdatatable(int countryids,String countryCodes ) async {
      
    Map<String, dynamic> row = {
      DatabaseHelper.classNameid :countryids,
      DatabaseHelper.className  : countryCodes,
     };
    final classNameida = await dbHelper.insertlicenseclassdatatable(row);
    print('inserted row id: $classNameida');
  }
  void _insertlicensecodesdatatable(int countryids,String countryCodes ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.codeid :countryids,
      DatabaseHelper.code  : countryCodes,
     };
    final codeid = await dbHelper.insertlicensecodesdatatable(row);
    print('inserted row id: $codeid');
  }
  void _insertlicensetitlesdatatable(int countryids,String countryCodes ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.titleid :countryids,
      DatabaseHelper.title  : countryCodes,
     };
    final titleid = await dbHelper.insertlicensetitlesdatatable(row);
    print('inserted row id: $titleid');
  }
  void _insertlicensetypedatatable(int countryids,String countryCodes ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.typeNameid :countryids,
      DatabaseHelper.typeName  : countryCodes,
     };
    final typeNameid = await dbHelper.insertlicensetypedatatable(row);
    print('inserted row id: $typeNameid');
  }
  void _insertstatedatatable(int countryids,String countryCodes,int countryid ) async {

    Map<String, dynamic> row = {
      DatabaseHelper.statecountryid :countryids,
      DatabaseHelper.stateName  : countryCodes,
       DatabaseHelper.countryId  : countryid,
     };
    final typeNameid = await dbHelper.insertstatedatatable(row);
    print('inserted row id: $typeNameid');
    loaded=true;
  }
  void msdela(){
   for(int dat=0;dat<1000;dat++){ }  
  }
  //  void _insertclassb(String name , int ids ) async {

  //   Map<String, dynamic> rowclassb = {
  //     DatabaseHelper.columnNameb :name,
  //     DatabaseHelper.columnAgeb  : ids,
  //     DatabaseHelper.columnIdb   : ids,
  //   };
  //   final id = await dbHelper.insertclassb(rowclassb);
  //   print('inserted row id: $id');
  // }

  void _queryall() {
                _querycountriesdatatable();msdela();
                _querylicenseclassdatatable();msdela();
                _querylicensecodesdatatable();msdela();
                _querylicensetitlesdatatable();msdela();
                _querylicensetypedatatable();msdela();
                _querystatedatatable();msdela();
  }
  void _querycountriesdatatable() async {
    final allRowsclassb = await dbHelper.querycountriesdatatable();
    countriesdatalist=allRowsclassb;
    print(countriesdatalist);
   print('\n');
    

    
  }
  
   void _querylicenseclassdatatable() async {
    final allRowsclassb = await dbHelper.querylicenseclassdatatable();
   licenseclassdatalist=allRowsclassb;
    print(licenseclassdatalist);
    print('\n');
// classdatamap(allRowsclassb);
  }
  void _querylicensecodesdatatable() async {
    final allRowsclassb = await dbHelper.querylicensecodesdatatable();
    licensecodesdatalist=allRowsclassb;
    print(licensecodesdatalist);
    print('\n');
// classdatamap(allRowsclassb);
  }
  void _querylicensetitlesdatatable() async {
    final allRowsclassb = await dbHelper.querylicensetitlesdatatable();
    licensetitlesdatalist=allRowsclassb;
    print(licensetitlesdatalist);
    print('\n');
// classdatamap(allRowsclassb);
  }
  void _querylicensetypedatatable() async {
    final allRowsclassb = await dbHelper.querylicensetypedatatable();
    licensetypedatalist=allRowsclassb;
    print(licensetypedatalist);
    print('\n');
// classdatamap(allRowsclassb);
  }
  void _querystatedatatable() async {
    final allRowsclassb = await dbHelper.querystatedatatable();
   statedatalist=allRowsclassb;
    print(statedatalist);
    print('\n');
// classdatamap(allRowsclassb);
  }
  // void _update() async {
  //   // row to update
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.columnId   : 1,
  //     DatabaseHelper.columnName : 'Mary',
  //     DatabaseHelper.columnAge  : 32
  //   };
  //   final rowsAffected = await dbHelper.update(row);
  //   print('updated $rowsAffected row(s)');
  // }

  // void _delete() async {
  //   // Assuming that the number of rows is the id for the last row.
  //   final id = await dbHelper.queryRowCount();
  //   final rowsDeleted = await dbHelper.delete(id);
  //   print('deleted $rowsDeleted row(s): row $id');
  // }


 



}


