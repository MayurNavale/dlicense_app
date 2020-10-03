import 'package:appdata/src/applyEnroll/airline.dart';
import 'package:appdata/src/applyEnroll/doctor.dart';
import 'package:appdata/src/applyEnroll/institution.dart';
import 'package:appdata/src/applyEnroll/school.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/trainingList/startsessionpage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/logbookModule/logbookModulePage.dart';
import 'modal.dart';
import 'package:intl/intl.dart';
class TrainingListPage extends StatefulWidget {
  @override
  _TrainingListPageState createState() => _TrainingListPageState();
}
class _TrainingListPageState extends State<TrainingListPage>  {
LoogBookModuleClass trainingList=new LoogBookModuleClass();
 final _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
List<DataRow> _rowList = []; 
var text=AllTexttoShow();
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
// _showAllList();


  futurelogbookList = getlogbookList();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:  AppBar(title:  Text('Logbook Table'),
       
       actions: <Widget>[GestureDetector(child:Icon(Icons.add) ,onTap:_showAllList,)
       ]
      ),
         
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
            
            SizedBox(height:6),
             SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FittedBox( fit: BoxFit.fitHeight,
                        child:Card(
                          elevation: 2.1,
                          child: DataTable(
                            dividerThickness: 2,
                            horizontalMargin: 4,
                            columnSpacing: 29,
                            sortAscending: false,
                            sortColumnIndex: 2,
                            columns: <DataColumn>[
                              for (var item in text.tableHeader)
                               DataColumn( label:Text(item, style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor:1.2 , ), ),
                            ],
                            rows: _rowList,
                        ),
                        ),
                 )
              )
         ],
   );
 }
   
 


  onedit(var id ,String finfnavigationpage){ 
    var returnval;
//     if(finfnavigationpage!=null)
//     // returnval= Navigator.push( context, MaterialPageRoute(builder: (context) =>RowPage(id)));
//     // else
//     var returnval=
 Navigator.push( context, MaterialPageRoute(builder: (context) =>StartSession()));
//  print(returnval);
//    if(returnval==null){
//     //  futurelogbookList = getlogbookList();
//      print(_rowList.length);
//    }
  }



 void _showAllList() {
    for (var item in text.tableHeader) 
       DataCell(Text(item),   );

  //  if(logbookAllList.isNotEmpty){  
  //       setState(() {
  //     for (int b=0;b<logbookAllList.length;b++){
  //     _rowList.add(
  //       DataRow( cells: <DataCell>[
  //       DataCell( Row(children:[
  //         GestureDetector(child:Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(logbookAllList[b]['id'],logbookAllList[b]['placeOfDeparture']);}, ),
  //         SizedBox(width:10),
  //         GestureDetector(child:Icon(Icons.delete,color: Colors.red,),
  //       onTap:(){ deleteselectedInBackend(logbookAllList[b]['id']);
  //         selectedRowId(logbookAllList[b]['id']);
  //             setState(() {_rowList.clear(); });
  //            _showAllList();
  //             // _showAllList();
  //              },
  //            )]
  //           ),
  //       placeholder: true, ), 
      //  for (int a=1;a<cellContaintnameToBeInsert.length;a++)
      //    DataCell(Text(logbookAllList[b][cellContaintnameToBeInsert[a]]==null||logbookAllList[b][cellContaintnameToBeInsert[a]]==""?'NA':logbookAllList[b][cellContaintnameToBeInsert[a]].toString())),
                  
    //    ])); }
    // });}
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


  // exportpage()=>  Navigator.push( context, MaterialPageRoute(builder: (context) =>ToExcelPage(null)));
//////////Post////////////////////



void assign(var val){
  logbookAllList=val;
   _showAllList();
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
  // return PopupMenuButton(
  //   icon: Icon(Icons.add),
  //   onSelected: (value)async {
  //      switch (value){
  //       case 0:{
  //       Navigator.push( context, MaterialPageRoute(builder: (context) =>RowPage(null)));
  // }break;
  //          case 1:{
  //         Navigator.push( context, MaterialPageRoute(builder: (context) =>LogBookPage(null)));
  // }
  //     break;
   
  //     // }// add this property
  //   },
  //   itemBuilder: (context) => [
  //     PopupMenuItem(
  //       child: Text("Logbook Entry"),
  //       value: 0,
  //     ),
  //     PopupMenuItem(
  //       child: Text("Logbook Total"),
  //       value: 1,
  //     ), 
  //   ],
  // );
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