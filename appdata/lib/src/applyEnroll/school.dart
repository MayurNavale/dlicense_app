
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'modal.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
import 'dart:convert';
// import 'modal.dart';
import 'package:intl/intl.dart';
class Schoolpage extends StatefulWidget {
  @override
  _SchoolpageState createState() => _SchoolpageState();
}

class _SchoolpageState extends State<Schoolpage> {
  List<DataRow> _rowList = []; 
   int x;
  Future <int> uplidesucess;
List<dynamic> schoolList=[];
  ApplyEnrollClass schoolObj=new ApplyEnrollClass();
  var showformmat = DateFormat("dd-MM-yyyy");
  var saveformmat = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
    child: SingleChildScrollView(
      padding:EdgeInsets.fromLTRB(12, 4, 6, 4),
      child:Column(
          children: [
             Row(children:[
               Expanded(child:_school(),flex: 7,),
               Expanded(child:  
                  RaisedButton(                  
                   color: Colors.blue,
                   child: Text('Apply'),
                   onPressed: (){ 
                     if(schoolObj.ministryName!=null){
                     saveministr();}}
                    ),flex: 3,),]),
                    // SizedBox(height:6),/
                  SizedBox(height:2,width:MediaQuery.of(context).size.width, child: Container(color: Colors.black26 ),),
                  FittedBox( fit: BoxFit.fitHeight, 
                        child: DataTable(
                            dividerThickness: 2,
                            horizontalMargin: 4,
                            columnSpacing: 29,
                            sortAscending: false,
                            sortColumnIndex: 2,
                            columns: <DataColumn>[
                              DataColumn( label:Text('Airline Name',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                               DataColumn( label:Text('Applide Date',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                               DataColumn( label:Text('Action',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                            ],
                            rows: _rowList,
                     )  
               ),
          ]
        )
      )
    );
}


    Widget _school(){
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(   labelText: 'School ', prefixIcon: Icon(Icons.school)),
      //  value:schoolObj.schoolName!=null? schoolObj.schoolName:null,
      // value: findval( schoolObj.placeOfDeparture,1), //
       onChanged: (String newValue){schoolObj.schoolName=newValue;   },
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => schoolObj.ministryName = val,
        items: schooldatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['schoolName']),
              value: item['schoolName'].toString(),
               onTap: () {
            schoolObj.schoolId =item['id'];
            }, );
          }).toList(),
    );
  }
  //////
  
  //////
   void _showAllListdata() {
    print('is ermpt $schoolList');
   if(schoolList.isNotEmpty){  
        setState(() {
      for (int b=0;b<schoolList.length;b++){
      _rowList.add(
        
        DataRow(cells: <DataCell>[
        //  DataCell( Text(b.toString())),
         DataCell( Text(schoolList[b]['schoolName'])),
         DataCell( Text(showformmat.format( DateTime.parse( schoolList[b]['applicationDate'])),),),
         DataCell( CircleAvatar( radius: 14.0,  backgroundColor: Colors.red, child: Icon(Icons.close, color: Colors.white),),
        onTap:(){
        int _rowlisttobeRemove= selectedRowId(schoolList[b]['id']);
              print('$_rowlisttobeRemove _rowlisttobeRemove');
              if(_rowlisttobeRemove!=null)
              print(schoolList.length);



              
              // setState(() {
              //    _rowList.removeAt(_rowlisttobeRemove);
              // // });
             setState(() {_rowList.clear(); });
             _showAllListdata();
              
       
              },placeholder: true,), 
        
       ]));   }}); }
  }
 int selectedRowId(var id){
  for ( x=0;x<schoolList.length;x++) {
   if(id==schoolList[x]['id']){
   setState(() { schoolList.removeAt(x); });
   return x;
   }
 }
  return null;
}


  saveministr(){
 schoolObj.userId=uuid;
 schoolObj.statusType= 'APPLIED';
  schoolObj.applicationDate=saveformmat.format(DateTime.now());
 sendRequest(jsonEncode(schoolObj),'school').then((value) {
setState(() =>_rowList.clear());
 _showAllListdata();
 });
 Future.delayed(const Duration(milliseconds : 20));
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
            schoolList.add(decode);
        });
      print(schoolList);
        
      return 1;
      }
    });  
}
assign(Map data){
  schoolList.add(data);
print('schoolList$schoolList');
}
bool sucessval=false;








}