import 'package:appdata/src/logbook/logbookpage.dart';
import 'package:appdata/src/logbookModule/model.dart';
import 'package:appdata/src/loogbooktable/toExcel.dart';
import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/generated/i18n.dart';
import 'dart:convert';
import 'modal.dart';
import 'toExcel.dart';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class LogbookTable extends StatefulWidget {
  @override
  _LogbookTableState createState() => _LogbookTableState();
}
class _LogbookTableState extends State<LogbookTable> {
  ToExcelPage toexcel=new ToExcelPage();
 final _scaffoldKey = GlobalKey<ScaffoldState>();
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
 List<Map> shortedList=[];
@override
void initState() {
  super.initState();
  futurelogbookList = getlogbookList();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:  Text('Logbook Table'),
       
       actions: <Widget>[_action(context), ]),
         
      key:_scaffoldKey ,
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
             SizedBox(height:6),
          Row(children: [ 
            
             RaisedButton(
              color:Colors.pink[400],
              onPressed:(){
                toexcel.createfile();
                toexcel.openFile();
              },
              child:  Text('Export'),
            ),
            SizedBox(width:100),
            RaisedButton(
              color:Colors.blue,
              onPressed:(){ 
                setState(() { _rowList.clear(); });
                dateRangeCalculation();
                _addFilterRow();
              },
              child:  Text('Submit'),
            ),],),
            SizedBox(height:6),
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
                               DataColumn( label:Text(item, style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor:1.2 , ), ),
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
 
 

 
  

  onedit(var id ,String finfnavigationpage){ 
    var returnval;
    if(finfnavigationpage!=null)
    returnval= Navigator.push( context, MaterialPageRoute(builder: (context) =>RowPage(id)));
    else
    var returnval= Navigator.push( context, MaterialPageRoute(builder: (context) =>LogBookPage(id)));
 print(returnval);
   if(returnval==null){
    //  futurelogbookList = getlogbookList();
     print(_rowList.length);
   }
  }


  void _addFilterRow() {
     if(shortedList.isNotEmpty){  
        setState(() {
      for (int b=0;b<shortedList.length;b++){
      _rowList.add(
        DataRow( cells: <DataCell>[
        // DataCell(Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(shortedList[b]['id'],shortedList[b]['dtOfFlight']);}, ),
        DataCell( Row(children:[
          GestureDetector(child:Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(shortedList[b]['id'],shortedList[b]['placeOfDeparture']);}, ),
           SizedBox(width:10),
           GestureDetector(child:   Icon(Icons.delete,color: Colors.red,),
              onTap:(){  
               deleteselectedInBackend(shortedList[b]['id']);
              selectedrow(shortedList[b]['id']);
              setState(() {_rowList.clear(); });
              _addFilterRow();
              // _showAllList();
                },
           ),  ]
        ),
        placeholder: true,
          ), 
       for (int a=1;a<cellContaintnameToBeInsert.length;a++)
       DataCell(Text(shortedList[b][cellContaintnameToBeInsert[a]]==null||shortedList[b][cellContaintnameToBeInsert[a]]==""?'NA':shortedList[b][cellContaintnameToBeInsert[a]].toString())),
        ]
       ));}});}
  }

cleartable()=>  setState(() =>  _rowList.clear());
int selectedrow(var id){
   int a;
   for (var item in logbookAllList) {
            a=item['id'];
         if(a==id){
         setState(() { logbookAllList.remove(item); });
        }
      }
      int x;
   print(shortedList.length); 
   print(id);
 for ( x=0;x<shortedList.length;x++) {
   if(id==shortedList[x]['id']){
   setState(() {  shortedList.removeAt(x); });
   return x;
  }
 }
}
  /////////////////////////////////////////////////////////////////
dateRangeCalculation(){  
  var selected ;
  setState(() { shortedList.clear();});
  for (var item in logbookAllList){
   selected  = DateTime.parse(item['dtOfFlight']);
   if( selected.isAfter(startDate)&& selected.isBefore(endDate)){
   shortedList.add(item);
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
        DataCell( Row(children:[
          GestureDetector(child:Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(logbookAllList[b]['id'],logbookAllList[b]['placeOfDeparture']);}, ),
          SizedBox(width:10),
          GestureDetector(child:Icon(Icons.delete,color: Colors.red,),
        onTap:(){ 
              deleteselectedInBackend(logbookAllList[b]['id']);
              selectedRowId(logbookAllList[b]['id']);
              setState(() {_rowList.clear(); });
              _showAllList();
              // _showAllList();
               },
             )]
            ),
        placeholder: true, ), 
       for (int a=1;a<cellContaintnameToBeInsert.length;a++)
         DataCell(Text(logbookAllList[b][cellContaintnameToBeInsert[a]]==null||logbookAllList[b][cellContaintnameToBeInsert[a]]==""?'NA':logbookAllList[b][cellContaintnameToBeInsert[a]].toString())),   
        ]
       )
       ); 
       }
    });}
  }
int selectedRowId(var id){
  int x;
  for ( x=0;x<logbookAllList.length;x++) {
   if(id==logbookAllList[x]['id']){
   setState(() { logbookAllList.removeAt(x); });
   return x;
    }
  }
  return null;
}

_totalRow(){
  int totallandingday=0,landingNight=0;
  for (var item in logbookAllList){
   totallandingday  = totallandingday+item['landingDay'];
  landingNight = landingNight + item['landingNight'];
  }
}
  // exportpage()=>  Navigator.push( context, MaterialPageRoute(builder: (context) =>ToExcelPage(null)));
//////////Post////////////////////



void assign(var val){
  logbookAllList=val;
   _showAllList();
   _totalRow();
}

////////////
 Future<List<Null>> deleteselectedInBackend(int val) async {
    final response =await http.delete("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$val",headers: {"Authorization":"$token"});
    print(response.statusCode);
     if(response.statusCode==204||response.statusCode==201){
       print('delete id 2 '+response.body.toString());
          // onsucesses('Removed entry');
          // onsucesses('delete');
       }
    } 

Widget _action(BuildContext context) {
  return PopupMenuButton(
    icon: Icon(Icons.add),
    onSelected: (value)async {
       switch (value){
        case 0:{
        Navigator.push( context, MaterialPageRoute(builder: (context) =>RowPage(null)));
  }break;
           case 1:{
          Navigator.push( context, MaterialPageRoute(builder: (context) =>LogBookPage(null)));
  }
      break;
   
      }// add this property
    },
    itemBuilder: (context) => [
      PopupMenuItem(
        child: Text("Logbook Entry"),
        value: 0,
      ),
      PopupMenuItem(
        child: Text("Logbook Total"),
        value: 1,
      ), 
    ],
  );
}

////////////
///get
//////////////////

    Future<int> getlogbookList() async {
       final response =await http.get("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$uuid",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
       List<dynamic>  logbookList=jsonDecode(response.body);
      assign(logbookList);
      //  onsucesses('Save successfully');
         return 1;
       } 
     else if  (response.statusCode == 500){  return 1;}
     else{return 1;}
     }
    


onsucesses(String val){
   _scaffoldKey.currentState.showSnackBar(
        SnackBar(elevation: 6.0,
  backgroundColor: Colors.blue,
  behavior: SnackBarBehavior.floating,
        content:
        Text(val,
       textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: 
       FontWeight.bold),),
        duration: Duration(seconds: 2))
);

}
///////////////////////////
//end
//////////////////
}