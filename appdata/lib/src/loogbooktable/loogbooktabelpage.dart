import 'package:appdata/src/logbookModule/model.dart';
import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class LogbookTable extends StatefulWidget {
  @override
  _LogbookTableState createState() => _LogbookTableState();
}
class _LogbookTableState extends State<LogbookTable> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
List<DataRow> _rowList = []; 
List<dynamic> logbookAllList=[];
List<DataCell>cellitem = [];
Future<int>futurelogbookList;
 var saveFormat = DateFormat('yyyy-MM-dd'); 
 var showformmat = DateFormat('dd-MM-yyyy');
 final dateFormat = DateFormat("dd-MM-yyyy");
 DateTime startDate,endDate;
 List<Map> resultListMap=[];
@override
void initState() {
  super.initState();
  futurelogbookList = getlogbookList();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:  Text('Logbook Table'),
        actions: <Widget>[
          FloatingActionButton(
            tooltip: 'Add LogBook',
            child: Icon(Icons.add),
                  onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RowPage(null),
                  ));} , backgroundColor: Colors.red,
          ),
        ]
      ),
        body: Center(
          child: FutureBuilder<int>(
            future: futurelogbookList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:  EdgeInsets.all(15.0),
                  child:  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child:formUI(),
                  ),
                );
         
      } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
        return CircularProgressIndicator();
        },
      ),
    ),
  );
 }


 /////////////////
   Widget formUI() {
       return  ListView(
      children: <Widget>[
             _fromDate(),
             _toDate(),
            RaisedButton(
              color:Colors.blue,
              onPressed:(){ 
                setState(() { _rowList.clear(); });
                dateRangeCalculation();
                _addFilterRow();
              },
              child:  Text('Submit'),
            ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FittedBox( fit: BoxFit.fitHeight,
                        child: DataTable(
                            dividerThickness: 2,
                            horizontalMargin: 4,
                            columnSpacing: 29,
                            sortAscending: false,
                            sortColumnIndex: 2,
                            columns: <DataColumn>[
                              for (var item in tableHeader)
                               DataColumn( label:Text(item,style:TextStyle( color: Colors.black, fontSize: 16) ), ),
                            ],
                            rows: _rowList,
                        ),
                 )
              )
         ],
   );
 }
    
    Widget _fromDate  () {
    return DateTimeField(
            decoration: InputDecoration( labelText: 'From Date',
            suffixIcon : Icon(Icons.calendar_today),),
            format: dateFormat,
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                           fieldLabelText: 'Form Date',
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) {
               setState((){ startDate = dt;_rowList.clear();});
           },
             );
  }
Widget _toDate  () {
  return DateTimeField(
            decoration: InputDecoration( labelText: 'To Date',
            suffixIcon : Icon(Icons.calendar_today),),
            format: dateFormat,
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            fieldHintText: 'To Date',
                            fieldLabelText: 'To Date',
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) {
               setState(() { endDate = dt; _rowList.clear();});
              },
       );
  }
  var dtvalidity,dtvaliditytoDate;
 
 

 
  

  onedit(var id){  Navigator.push( context,
                MaterialPageRoute(builder: (context) =>RowPage(id)));
  }


  void _addFilterRow() {
     if(resultListMap.isNotEmpty){  
        setState(() {
      for (int b=0;b<resultListMap.length;b++){
      _rowList.add(
        DataRow( cells: <DataCell>[
        DataCell(Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(resultListMap[b]['id']);},showEditIcon: true ),
        DataCell( 
              Icon(Icons.delete,color: Colors.red,),
              onTap:(){  
                // cleartable();
                // selectedrow(resultListMap[b]['id']);
               
                int _rowlisttobeRemove= selectedrow(logbookAllList[b]['id']);
              print('$_rowlisttobeRemove _rowlisttobeRemove');
              if(_rowlisttobeRemove!=null)
              print(_rowList.length);
              setState(() {
              _rowList.removeAt(_rowlisttobeRemove); 
              _rowList.clear();
               });
              _addFilterRow();
              // _showAllList();
                },
                placeholder: true,
                showEditIcon: true
                ), 
       for (int a=2;a<27;a++)
         DataCell(Text(resultListMap[b][cellContaintnameToBeInsert[a]])),
         DataCell(
            Icon(Icons.delete,color: Colors.red,),
            onTap:(){// cleartable();
                // selectedrow(resultListMap[b]['id']);
               
                int _rowlisttobeRemove= selectedrow(logbookAllList[b]['id']);
              print('$_rowlisttobeRemove _rowlisttobeRemove');
              if(_rowlisttobeRemove!=null)
              print(_rowList.length);
              setState(() {
              _rowList.removeAt(_rowlisttobeRemove); 
              _rowList.clear();
               });
              _addFilterRow();
              // _showAllList();
               },
            placeholder: true,
            showEditIcon: true
         ),
       ]
       ));}});}
  }

cleartable()=>  setState(() =>  _rowList.clear());
int selectedrow(var id){
  //  int a;
  //  for (var item in resultListMap) { print(item['id']);
  //        a=item['id'];
  //        if(a==val){
  //        setState(() { 
  //         resultListMap.remove(item);
  //          logbookAllList.remove(item);
  //          });
  //       }
  //     }
      int x;
  print ('row to be del $id');
  print(resultListMap.length); 
   print(_rowList.length);
 for ( x=0;x<resultListMap.length;x++) {
   if(id==resultListMap[x]['id']){
   setState(() {
     resultListMap.removeAt(x); });
   return x;
  }
 }
}
  /////////////////////////////////////////////////////////////////
dateRangeCalculation(){  
  var selected ;
  setState(() { resultListMap.clear();});
  for (var item in logbookAllList){
   selected  = DateTime.parse(item['dtOfFlight']);
   if( selected.isAfter(startDate)&& selected.isBefore(endDate)){
   resultListMap.add(item);
  }
 }
}
  var textStyle = TextStyle( color: Colors.indigo[900], fontSize: 16);



 void _showAllList() {
   if(logbookAllList.isNotEmpty){  
        setState(() {
      for (int b=0;b<logbookAllList.length;b++){
      _rowList.add(
        DataRow( cells: <DataCell>[
        DataCell(Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(logbookAllList[b]['id']);},showEditIcon: true ),
        DataCell( Icon(Icons.delete,color: Colors.red,),
        onTap:(){
         int _rowlisttobeRemove= selectedRowId(logbookAllList[b]['id']);
              print('$_rowlisttobeRemove _rowlisttobeRemove');
              if(_rowlisttobeRemove!=null)
              print(_rowList.length);
              setState(() {
                 _rowList.removeAt(_rowlisttobeRemove);
              });
             setState(() {_rowList.clear(); });
             _showAllList();
              // _showAllList();
               },placeholder: true, showEditIcon: true), 
       for (int a=2;a<27;a++)
         DataCell(Text(logbookAllList[b][cellContaintnameToBeInsert[a]])),
         DataCell( Icon(Icons.delete,color: Colors.red,),
         onTap:(){
              // cleartable();
              // selectedrow(logbookAllList[b]['id']);
              // _showAllList();
               },
        placeholder: true, showEditIcon: true),         
       ])); }
    });}
  }
int selectedRowId(var id){
  int x;
  print ('row to be del $id');
  print(logbookAllList.length); 
   print(_rowList.length);
 for ( x=0;x<logbookAllList.length;x++) {
   if(id==logbookAllList[x]['id']){
   setState(() {
      logbookAllList.removeAt(x);
   });

   return x;
   }
 }
  return null;
    // print(item['id']);
    //     int a=item['id'];
    //      if(a==id){
           
    //        return item.
//          setState(() { 
//           resultListMap.remove(item);
//            logbookAllList.remove(item);
//           //  print(logbookAllList);
//             //  _rowList
//              });
//         }
//       }
  // return 2;
}


//////////Post////////////////////



void assign(var val){
  logbookAllList=val;
   _showAllList();
}

////////////
 Future<List<Null>> deleteloogbooklist() async {
    final response =await http.delete("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/4",headers: {"Authorization":"$token"});
    print(response.statusCode);
     if(response.statusCode==200){
      //  List<dynamic>  logbookList=jsonDecode(response.body);
       print('delete id 2 '+response.body.toString());
        //  assign(logbookList);
       }
    } 

////////////
///get
//////////////////

    Future<int> getlogbookList() async {
       final response =await http.get("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$uuid",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
       List<dynamic>  logbookList=jsonDecode(response.body);
      assign(logbookList);
         return 1;
       } 
     else if  (response.statusCode == 500){  return 1;}
     else{throw Exception('check network connecion');
     }
    }


List<String>tableHeader=[
'Action',
'Delete\nRow',
'Date of Flight',
'Place of Departure',
'Place of Arrival',
'Make/Model',
'Name ofPIC',
'Certificate No',
'SE/ME',
'Departure Out',
'Departure Out UTC',
'Departure Off',
'Departure Off UTC',
'Arrival On',
'Arrival On UTC',
'Arrival In',
'Arrival In UTC',
'SOLO ','Co-Pilot ','FE','MP','PIC','DUAL','NIGHT','PICUS','FL','IFR','Delete\nRow'];
   List<String>cellContaintnameToBeInsert=[
'Action',
'Delete\nRow',
'dtOfFlight',
'placeOfDeparture',
'placeOfArrival',
'makemodel',
'nameOfPic',
'remarks',
'seMe',
'timeOfDepartureOut',
'timeOfDepartureOutUTC',
'timeOfDepartureOff',
'timeOfDepartureOffUTC',
'timeOfArrivalOn',
'timeOfArrivalOnUTC',
'timeOfArrivalIn',
'timeOfArrivalInUTC',
'solo','copilot','fe','mp','pic','dual','night','picus','fl','ifr','Delete\nRow'];
 


///////////////////////////
//end
//////////////////
}