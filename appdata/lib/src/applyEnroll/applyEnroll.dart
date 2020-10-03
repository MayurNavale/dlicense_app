import 'package:appdata/src/applyEnroll/airline.dart';
import 'package:appdata/src/applyEnroll/doctor.dart';
import 'package:appdata/src/applyEnroll/institution.dart';
import 'package:appdata/src/applyEnroll/school.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'modal.dart';
import 'package:intl/intl.dart';
class ApplyEnrollPage extends StatefulWidget {
  @override
  _ApplyEnrollPageState createState() => _ApplyEnrollPageState();
}
class _ApplyEnrollPageState extends State<ApplyEnrollPage>  with SingleTickerProviderStateMixin {
  ApplyEnrollClass applyEnrollClass=new ApplyEnrollClass();
  List<DataRow> _rowList = []; 
  Future <int> uplidesucess;
List<dynamic> ministryList=[];
bool uplodesucess;
  int x;
  var showformmat = DateFormat("dd-MM-yyyy");
  var saveformmat = DateFormat("yyyy-MM-dd");
    @override
  void initState() {
    super.initState();
    sucessval=false;
    ministryList.clear();
  //  parsePropertiesJson();
  //   tztime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply & Enroll'),
      ),
      body:DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
            semanticContainer: false,
            elevation: 6,
            child:  Container(
              constraints: BoxConstraints.expand(height: 60),
              child: TabBar(indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                 tabs: [
                  Tab(   text:  "Ministry", ),
                  Tab(   text:  "Airline", ),
                  Tab(   text:  "School", ),
                  Tab(   text:  "Institution",  ),
                  Tab(   text:  "Doctor", ),
                ]
              ),
            ),
          ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
              _ministrewidget(),
              Airlinepage(),
              Schoolpage(),
              Institutionpage(),
              DoctorPage()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
  // List <Widge> widger=[asd,asd];
  Widget _ministrewidget(){return SafeArea(
    child: SingleChildScrollView(
      padding:EdgeInsets.fromLTRB(12, 4, 6, 4),
      child:Column(
          children: [
            Container( child :
             Row(children:[
               Expanded(child: minister(),flex: 7,),
               Expanded(child:  
                  RaisedButton(
                      
                    disabledColor: Colors.black,                
                   color: Colors.blue,
                   child: Text('Apply'),
                   onPressed: (){
                     if(applyEnrollClass.ministryName!=null){
                     saveministr();
                    
                       } 

                       },
                    ),flex: 3,
                    ),
                 ])
                ),
                  // SizedBox(height:10,)
            SizedBox(height:2,width:MediaQuery.of(context).size.width, child: Container(color: Colors.black26 ),),
            FittedBox( fit: BoxFit.fitHeight, 
                        child: DataTable(
                            dividerThickness: 2,
                            horizontalMargin: 4,
                            columnSpacing: 29,
                            sortAscending: false,
                            sortColumnIndex: 2,
                            columns: <DataColumn>[
                              DataColumn( label:Text('Ministry Name',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                               DataColumn( label:Text('Applide Date',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                               DataColumn( label:Text('Action',style:TextStyle( color: Colors.black, fontSize: 16) ), ), ],
                            rows: _rowList,
                        ),
                  //  )
                 )
          ]
      )
    )
  );
}
 
Widget minister(){
    return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: 'Ministry ', prefixIcon: Icon(Icons.shop) ),
       value:applyEnrollClass.ministryName!=''? applyEnrollClass.ministryName:null,
      // value: findval( applyEnrollClass.placeOfDeparture,1), //
       onChanged: (String newValue){applyEnrollClass.ministryName=newValue;   },
       validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) => applyEnrollClass.ministryName = val,
        items: ministrydatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['ministryName']),
              value: item['ministryName'].toString(),
               onTap: () {
            applyEnrollClass.ministryId =item['id'];
            }, );
          }).toList(),
    );
  }
  
bool enablerow;
//  void _showAllList(ApplyEnrollClass val) {
//    setState(() {
//       _rowList.add(
//        DataRow(cells: <DataCell>[
//            DataCell( Text(val.ministryName)),
//          DataCell( Text(val.applicationDate),),
//         DataCell( CircleAvatar( radius: 14.0,
//                     backgroundColor: Colors.red,
//                     child: Icon(Icons.close, color: Colors.white),
//                     ),
//         onTap:(){ 
//          })]));}); }
 
    
  void _showAllListdata() {
    print('is ermpt $ministryList');
   if(ministryList.isNotEmpty){  
        setState(() {
      for (int b=0;b<ministryList.length;b++){
      _rowList.add(
        
        DataRow(cells: <DataCell>[
        //  DataCell( Text(b.toString())),
         DataCell( Text(ministryList[b]['ministryName'])),
         DataCell( Text(showformmat.format( DateTime.parse( ministryList[b]['applicationDate'])),),),
         DataCell( CircleAvatar( radius: 14.0,  backgroundColor: Colors.red, child: Icon(Icons.close, color: Colors.white),),
        onTap:(){
        int _rowlisttobeRemove= selectedRowId(ministryList[b]['id']);
              print('$_rowlisttobeRemove _rowlisttobeRemove');
              if(_rowlisttobeRemove!=null)
              print(ministryList.length);
              // setState(() {
              //    _rowList.removeAt(_rowlisttobeRemove);
              // // });
             setState(() {_rowList.clear(); });
             _showAllListdata();
              
       
              },placeholder: true,), 
        
       ]));   }}); }
  }
 int selectedRowId(var id){
  for ( x=0;x<ministryList.length;x++) {
   if(id==ministryList[x]['id']){
   setState(() { ministryList.removeAt(x); });
   return x;
   }
 }
  return null;
}


  saveministr(){
 applyEnrollClass.userId=uuid;
 applyEnrollClass.statusType= 'APPLIED';
  applyEnrollClass.applicationDate=saveformmat.format(DateTime.now());
 sendRequest(jsonEncode(applyEnrollClass),'ministry').then((value) {
setState(() =>_rowList.clear());
 _showAllListdata();
 });

}



Future< int> sendRequest( String data,String appliedfor) async {
   print(data);
 var url = 'http://$ipAddress:8080/dLicence/api/application/v1/$appliedfor/$uuid';
  await  http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      int code=response.statusCode;
      if(code==200||code==201){
        // sucessval=1;
        print('code$code');
        print(response.body);
          Map decode=jsonDecode(response.body) as Map;
        // assign(decode);
        setState(() {
            ministryList.add(decode);
        });
      print(ministryList);
        
      return 1;
      }
    });  
}
assign(Map data){
  ministryList.add(data);
print('ministryList$ministryList');
}
bool sucessval=false;










}