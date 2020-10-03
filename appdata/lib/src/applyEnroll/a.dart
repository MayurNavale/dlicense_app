// import 'package:appdata/src/applyEnroll/airline.dart';
// import 'package:appdata/src/applyEnroll/doctor.dart';
// import 'package:appdata/src/applyEnroll/institution.dart';
// import 'package:appdata/src/applyEnroll/school.dart';
// import 'package:appdata/src/models/masterdata.dart';
// import 'package:json_table/json_table.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'modal.dart';
// import 'package:intl/intl.dart';
// class CustomDataTable extends StatefulWidget {
//   @override
//   _CustomDataTableState createState() => _CustomDataTableState();
// }
// class _CustomDataTableState extends State<CustomDataTable>  with SingleTickerProviderStateMixin {
//   ApplyEnrollClass applyEnrollClass=new ApplyEnrollClass();
//   List<DataRow> _rowList = []; 
//     @override
//   void initState() {
//     super.initState();
//   //  parsePropertiesJson();
//   //   tztime();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Apply & Enroll'),
//       ),
//       body:DefaultTabController(
//         length: 5,
//         child: Column(
//           children: <Widget>[
//           Card(
//             margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
//             semanticContainer: false,
//             elevation: 6,
//             child:  Container(
//               constraints: BoxConstraints.expand(height: 60),
//               child: TabBar(indicatorColor: Colors.teal,
//           labelColor: Colors.teal,
//           unselectedLabelColor: Colors.black54,
//           isScrollable: true,
//                  tabs: [
//                   Tab(   text:  "Ministry", ),
//                   Tab(   text:  "Airline", ),
//                   Tab(   text:  "School", ),
//                   Tab(   text:  "Institution",  ),
//                   Tab(   text:  "Doctor", ),
//                 ]
//               ),
//             ),
//           ),
//             Expanded(
//               child: Container(
//                 child: TabBarView(children: [
//               _ministrewidget(),
//               Airlinepage(),
//               Schoolpage(),
//               Institutionpage(),
//               DoctorPage()
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   // List <Widge> widger=[asd,asd];
//   Widget _ministrewidget(){return SafeArea(
//     child: SingleChildScrollView(
//       padding:EdgeInsets.fromLTRB(12, 4, 6, 4),
//       child:Column(
//           children: [
//             Container( child :
//              Row(children:[
//                Expanded(child: minister(),flex: 7,),
//                Expanded(child:  
//                   RaisedButton(
                      
//                     disabledColor: Colors.black,                
//                    color: Colors.blue,
//                    child: Text('Apply'),
//                    onPressed: (){
//                      if(applyEnrollClass.ministryName!=null){
//                      int a=saveministr();
//                      if (a==1)
//                        _showAllList(applyEnrollClass.ministryName);
//                        } 

//                        },
//                     ),flex: 3,
//                     ),
//                  ])
//                 ),
//                   // SizedBox(height:10,)
//             SizedBox(height:2,width:MediaQuery.of(context).size.width, child: Container(color: Colors.black26 ),),
//             FittedBox( fit: BoxFit.fitHeight, 
//                         child: DataTable(
//                             dividerThickness: 2,
//                             horizontalMargin: 4,
//                             columnSpacing: 29,
//                             sortAscending: false,
//                             sortColumnIndex: 2,
//                             columns: <DataColumn>[
//                               DataColumn( label:Text('Ministry Name',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
//                                DataColumn( label:Text('Applide Date',style:TextStyle( color: Colors.black, fontSize: 16) ), ),
//                                DataColumn( label:Text('Action',style:TextStyle( color: Colors.black, fontSize: 16) ), ), ],
//                             rows: _rowList,
//                         ),
//                   //  )
//                  )
//           ]
//       )
//     )
//   );
// }
 
// Widget minister(){
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration( labelText: 'Ministry ', prefixIcon: Icon(Icons.shop) ),
//        value:applyEnrollClass.ministryName!=null? applyEnrollClass.ministryName:null,
//       // value: findval( applyEnrollClass.placeOfDeparture,1), //
//        onChanged: (String newValue){applyEnrollClass.ministryName=newValue;   },
//        validator: (value) => value == null ? 'field required' : null,
//        onSaved: (val) => applyEnrollClass.ministryName = val,
//         items: ministrydatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['ministryName']),
//               value: item['ministryName'].toString(),
//                onTap: () {
//             applyEnrollClass.ministryId =item['id'];
//             }, );
//           }).toList(),
//     );
//   }
  

//  void _showAllList(String val) {
//   //  if(logbookAllList.isNotEmpty){  
//         setState(() {
//   //     for (int b=0;b<logbookAllList.length;b++){
//       _rowList.add(
//         DataRow( cells: <DataCell>[
//         // DataCell(Icon(Icons.edit,color: Colors.deepPurple,),onTap:(){onedit(logbookAllList[b]['id']);},showEditIcon: true ),
//         DataCell( Text(val)),
//          DataCell( Text('${showformmat.format(DateTime.now())}'),),
//         DataCell( CircleAvatar( radius: 14.0,
//                     backgroundColor: Colors.red,
//                     child: Icon(Icons.close, color: Colors.white),
//                     ),
//         onTap:(){
//         //  int _rowlisttobeRemove= selectedRowId(logbookAllList[b]['id']);
//         //       print('$_rowlisttobeRemove _rowlisttobeRemove');
//         //       if(_rowlisttobeRemove!=null)
//         //       print(_rowList.length);
//         //       setState(() {
//         //          _rowList.removeAt(_rowlisttobeRemove);
//         //       });
//         //      setState(() {_rowList.clear(); });
//         //      _showAllList();
//         //       // _showAllList();
//                },placeholder: true,), 
//       //  for (int a=2;a<27;a++)
//       //    DataCell(Text(logbookAllList[b][cellContaintnameToBeInsert[a]])),
//       //    DataCell( Icon(Icons.delete,color: Colors.red,),
//       //    onTap:(){},
//       //   placeholder: true, showEditIcon: true),         
//        ]));   }); }
 
    
  
// // int selectedRowId(var id){
// //   int x;
// //   for ( x=0;x<logbookAllList.length;x++) {
// //    if(id==logbookAllList[x]['id']){
// //    setState(() { logbookAllList.removeAt(x); });
// //    return x;
// //    }
// //  }
// //   return null;
// // }
// int saveministr(){
//  applyEnrollClass.userId=uuid;
//   applyEnrollClass.applicationDate=DateTime.now();
//   sendRequest(jsonEncode(applyEnrollClass),'ministry');
//   return 1;
  
// }


















// }