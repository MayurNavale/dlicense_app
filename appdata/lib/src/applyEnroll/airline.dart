import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'modal.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
import 'dart:convert';
// import 'modal.dart';
import 'package:intl/intl.dart';
class Airlinepage extends StatefulWidget {
  @override
  _AirlinepageState createState() => _AirlinepageState();
}

class _AirlinepageState extends State<Airlinepage> {
  List<DataRow> _rowList = []; 
  int x;
  Future <int> uplodesucess;
  List<dynamic> airlineList=[];
  ApplyEnrollClass airlineObj=new ApplyEnrollClass();
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
               Expanded(child:_airline(),flex: 7,),
               Expanded(child:  
                  RaisedButton(                  
                   color: Colors.blue,
                   child: Text('Apply'),
                   onPressed: (){ 
                     if(airlineObj.ministryName!=null){
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

   Widget _airline(){
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Airline ',
         prefixIcon: Icon(Icons.airplanemode_active)
      ),
      //  value:airlineObj.airlineName!=null? airlineObj.airlineName:null,
      // value: findval( airlineObj.placeOfDeparture,1), //
       onChanged: (String newValue){airlineObj.airlineName=newValue;   },
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => airlineObj.airlineName = val,
        items: airlinedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['airlineName']),
              value: item['airlineName'].toString(),
               onTap: () {
            airlineObj.airlineId =item['id'];
            }, );
          }).toList(),
    );
  }
  //////
   void _showAllListdata() {
    print('is ermpt $airlineList');
   if(airlineList.isNotEmpty){  
        setState(() {
      for (int b=0;b<airlineList.length;b++){
      _rowList.add( DataRow(cells: <DataCell>[
          DataCell( Text(airlineList[b]['airlineName'])),
         DataCell( Text(showformmat.format( DateTime.parse( airlineList[b]['applicationDate'])),),),
         DataCell( CircleAvatar( radius: 14.0,  backgroundColor: Colors.red, child: Icon(Icons.close, color: Colors.white),),
        onTap:(){
        int _rowlisttobeRemove= selectedRowId(airlineList[b]['id']);
              // print('$_rowlisttobeRemove _rowlisttobeRemove');
              // if(_rowlisttobeRemove!=null)
              // print(airlineList.length);
              setState(() {_rowList.clear(); });
             _showAllListdata();
              
       
              },placeholder: true,), 
        
       ]));   }}); }
  }
 int selectedRowId(var id){
  for ( x=0;x<airlineList.length;x++) {
   if(id==airlineList[x]['id']){
   setState(() { airlineList.removeAt(x); });
   return x;
   }
 }
  return null;
}


saveministr(){
  airlineObj.userId=uuid;
  airlineObj.statusType= 'APPLIED';
  airlineObj.applicationDate=saveformmat.format(DateTime.now());
  sendRequest(jsonEncode(airlineObj),'airline').then((value) {
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
            airlineList.add(decode);
        });
      print(airlineList);
        
      return 1;
      }
    });  
}
assign(Map data){
  airlineList.add(data);
print('airlineList$airlineList');
}
bool sucessval=false;








}