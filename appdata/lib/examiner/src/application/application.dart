
import 'package:appdata/examiner/src/application/approved.dart';
import 'package:appdata/examiner/src/application/pending.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:appdata/src/models/masterdata.dart';
import 'modal.dart';
import 'package:intl/intl.dart';
class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}
class _ApplicationPageState extends State<ApplicationPage>  with SingleTickerProviderStateMixin {
  List<DataRow> _rowList = []; 
  Future <int> uplidesucess;
List<dynamic> ministryList=[];
bool uplodesucess;
  int x;
  var showformmat = DateFormat("dd-MM-yyyy");
  var saveformmat = DateFormat("yyyy-MM-dd");
   List<String> tabtitle=['Pending Approval','Approved','Rejected'];
    @override
  void initState() {
    super.initState();
    ministryList.clear();
  //  parsePropertiesJson();
  //   tztime();
  }
  int initialindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(   title: Text('Applications',textScaleFactor: 1.3,),  backgroundColor: const Color(0xFF00897b), ),
      body:DefaultTabController(
        initialIndex: initialindex,
        length: 3,
        child: Column(
          children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            semanticContainer: false,
            elevation: 6,
            child:  Container(
              constraints: BoxConstraints.expand(height: 60),
              child: TabBar(indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                 tabs: [
                  Tab( icon: Text( tabtitle[0],textScaleFactor: 1.2,) ),
                  Tab(   icon: Text( tabtitle[1],textScaleFactor: 1.2,)  ),
                  Tab(  icon: Text( tabtitle[2],textScaleFactor: 1.2,) ),
                 
                ]
              ),
            ),
          ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TabBarView(children: [
             Pending(),
              Pending(),
               MyHomePage(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  saveministr(){
//  applyEnrollClass.userId=uuid;
//  applyEnrollClass.statusType= 'APPLIED';
//   applyEnrollClass.applicationDate=saveformmat.format(DateTime.now());
//  sendRequest(jsonEncode(applyEnrollClass),'ministry').then((value) {
// setState(() =>_rowList.clear());
//  _showAllListdata();
//  });
//  Future.delayed(const Duration(milliseconds : 20));
}



Future< int> sendRequest( String data,String appliedfor) async {
//    print(data);
//  var url = 'http://$ipAddress:8080/dLicence/api/application/v1/$appliedfor/$uuid';
//   await  http.post(url, headers: {"Content-Type": "application/json","Authorization":"$tokn"}, body: data)
//         .then((response) {
//       print("Response status: ${response.statusCode}");
//       int code=response.statusCode;
//       if(code==200||code==201){
//         // sucessval=1;
//         print('code$code');
//         print(response.body);
//           Map decode=jsonDecode(response.body) as Map;
//         // assign(decode);
//         setState(() {
//             ministryList.add(decode);
//         });
//       print(ministryList);
        
//       return 1;
//       }
//     });  
}
assign(Map data){
  ministryList.add(data);
print('ministryList$ministryList');
}
bool sucessval=false;










}