


// import 'package:appdata/src/licencePage/endorsementDetailsPage.dart';
// import 'package:appdata/src/licencePage/examinardetailpage.dart';
// import 'package:appdata/src/licencePage/instructorpage.dart';
// import 'package:intl/intl.dart';
// import 'package:appdata/src/models/masterdata.dart';
// import 'package:flutter/material.dart';
// import 'model.dart';
// import 'package:dio/dio.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// class Licencepagehome extends StatefulWidget {
//   @override
//   _LicencepagehomeState createState() => _LicencepagehomeState();
// }

// class _LicencepagehomeState extends State<Licencepagehome> {
 
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//                       String initialnumber='';
//                       bool _autoValidate = false;
//                       var saveFormat = DateFormat('yyyy-MM-dd'); 
//                       var showformmat = DateFormat('dd-MM-yyyy');
//                        final dateFormat = DateFormat("dd-MM-yyyy");
//                       String languageString;
//                       Licenceclass saveLicenseData= new Licenceclass();
//                       Licenceclass apiLicencddata=new Licenceclass();
//                       LicenseDetail licenseDetail=new LicenseDetail(); 
//                       //final TextEditingController _controller = new TextEditingController();
//                      // Licenceclass apiLicencddata=new Licenceclass(); UserClass userdata = UserClass.fromJson(jsonstring);
//                         List<Examinerapi> examinerapiplist=[];
//                         List examinerdatafrompage;
//                         List<Instructorapi> instructorapiplist=[];
//                         List instructordatafrompage;  
//                         List<EndorsementAPI> endorsementApipList=[];
//                         List endorsementDataFromPage;
//                      // Personneldata personal=new Personneldata();
//                       final dtirtest = new TextEditingController();
//                       final dtissue = new TextEditingController();  
//                       final dtratingtest = new TextEditingController(); 
//                       final dtvalidity = new TextEditingController();    
//                       String a;
//                       bool checkboxValue=false;
//                       String licencenumber='';
//                       DateTime initialdateval;
//                      // // Future<Licenceclass>futureLicenceclass;
//                       // //Future<Album> futureAlbum;
//                   //      Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
//                   // showDatePicker(
//                   //           context: context,
//                   //           initialDate: DateTime.now(),
//                   //           firstDate: DateTime(1950),
//                   //           lastDate: DateTime(2200)
//                   //           ).then((date) {
//                   //           setState(() {
//                   //           datecontroller.text= a =date.toString();
//                   //     //new DateFormat.yMMMMd().format(date);
//                   //    }); });  }

// //   @override
// //   void initState() {
// //     super.initState();
// //   //futureLicenceclass = getlicencddata();
// //  print(apiLicencddata.licenseNumber);
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//       appBar: new AppBar(title: new Text('    Licence'), ),
//       body: SingleChildScrollView(
//            child: new Container(
//             margin: new EdgeInsets.all(15.0),
//             child: new Form(
//               key: _formKey,
//               autovalidate: _autoValidate,
//               child:formUI(),
//             ),
//           ),
//         ) ,
//   //       Center(
//   //         child: FutureBuilder<Licenceclass>(
//   //           future: futureLicenceclass,
//   //           builder: (context, snapshot) {
//   //             if (snapshot.hasData) {
//   //               return   SingleChildScrollView(
//   //          child: new Container(
//   //           margin: new EdgeInsets.all(15.0),
//   //           child: new Form(
//   //             key: _formKey,
//   //             autovalidate: _autoValidate,
//   //             child:formUI(),
//   //           ),
//   //         ),
//   //       );
//   //     } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
//   //      // By default, show a loading spinner.
//   //       return CircularProgressIndicator();
//   //       },
//   //     ),
//   //  ),
//   ),
//  );
//  }


//  /////////////////
//    Widget formUI() {
//        return  Column(
//       children: <Widget>[
//            _contries(), 
//             _licenceCodeOptions(),
//            _licenceNumber(),
//             _dateOfInitialIssue(),
//           //  _countryCodes(),
//           //  _dateofratingtest(),
//           //  _dateofIRtest(),
//           //  _validuntil(),
//            _examinerscertificatenumber(),
//          //  _classOptions(),
//         //   _tpyeOptionData(),
//            _ir(),
//            _co_Pilot(),
//            _additionalDetails(),
//            FlatButton(
//                 color: Colors.grey[300],
//                 child: Text('Instructor'),
//                 onPressed: () async {
//                 String inst = await Navigator.push( 
//                 context, MaterialPageRoute( builder: (context) =>Instructorpage(instructorapiplist), ), );
//                 if (inst != null) {
//                    instructordatafrompage = jsonDecode(inst) as List;
//                    instructorapiplist = instructordatafrompage.map((i)=>Instructorapi.fromJson(i)).toList();} }),
//           FlatButton(
//                child: Text('Examiner'),
//                onPressed: () async {
//                String a = await Navigator.push( context, MaterialPageRoute( builder: (context) =>ExaminarPage (examinerapiplist), ),);
//                if (a != null) {
//                 examinerdatafrompage = jsonDecode(a) as List;
//                 examinerapiplist = examinerdatafrompage.map((i)=>Examinerapi.fromJson(i)).toList();
//               print(examinerapiplist);}}),
//           FlatButton(
//               color: Colors.grey[300],
//               child: Text('Endorsement'),
//               onPressed: () async {
//               String endor = await Navigator.push( context, MaterialPageRoute( builder: (context) =>EndorsementPage(endorsementApipList), ), );
//                 if (endor != null) {
//                 endorsementDataFromPage = jsonDecode(endor) as List;
//                 endorsementApipList = endorsementDataFromPage.map((i)=>EndorsementAPI.fromJson(i)).toList();
//               print(endorsementApipList);} },  ),
//            showdata()
        
//          ]
//      );
     
//    }
  
//    Widget _contries()  {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: ' Nationality * ',
      
//       ),
//       value: findval( apiLicencddata.countryId,1), //
//       onChanged: (String newValue){apiLicencddata.countryId=apiLicencddata.countryId;},// => setState(() => contries = newValue),
//       validator: (value) => value == null ? 'field required' : null,
//       onSaved: (val) => apiLicencddata.countryId = apiLicencddata.countryId,
//       items: countriesdatalist.map((item) {
//         return new DropdownMenuItem(
//           child: new Text(item['countryCode']),
//           value: item['countryCode'].toString(),
//           onTap: () {
//             apiLicencddata.countryId = item['id'];
//           },
//         );
//       }).toList(),
//     );
//   }
// //   // 
// //   ///////////////
//    Widget _licenceCodeOptions() { 
//        return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: ' LicenceCode * ',
      
//       ),
//       value:findval( apiLicencddata.codeId,2), //
//       onChanged: (String newValue){apiLicencddata.codeId=apiLicencddata.codeId;},// => setState(() => licenceCodeOptions = newValue),
//       validator: (value) => value == null ? 'field required' : null,
//       onSaved: (val) => apiLicencddata.codeId = apiLicencddata.codeId,
//        items: licensecodesdatalist.map((item) {
//         return new DropdownMenuItem(
//           child: new Text(item['code']),
//           value: item['code'].toString(),
//           onTap: () {
//             print( item['id']);
//             apiLicencddata.codeId = item['id'];
//           },
//         );
//       }).toList(),
//     );
//   }
    
// //   ///////////////////
//       Widget _licenceNumber() { 
//       return TextFormField(
//           initialValue:initialnumber??apiLicencddata.licenseNumber.toString(),
//           decoration: const InputDecoration(labelText: 'Certificate Number'),
//           keyboardType: TextInputType.phone,
//           validator: licenceNumber,
//            onChanged: (String newValue) { apiLicencddata.licenseNumber=int.parse(newValue);},
//           onSaved: (val) =>  apiLicencddata.licenseNumber=int.parse(val),
//         );
// }
  
// //   /////////////
//     Widget _dateOfInitialIssue() {
//        return DateTimeField(
//             //  dateOnly: true,
//             decoration: InputDecoration(labelText: 'Date of initial issue  *',
//             suffixIcon : Icon(Icons.calendar_today),
//             hintText: '$dateOfInitialIssue'),
//             format: dateFormat,
//             initialValue:initialdateval??DateTime.parse(apiLicencddata.dtIssue),
//             onShowPicker: (context, currentValue) {
//                           return showDatePicker(
//                           context: context,
//                           firstDate: DateTime(1900),
//                           initialDate:  DateTime.now(),
//                           lastDate: DateTime(2100));
//                     },
//             validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
//             onChanged: (dt) { setState(() => dateOfInitialIssue = dt);
//                         print('Selected date: $dateOfInitialIssue');},
//             onSaved: (value) {apiLicencddata.dtIssue= saveFormat.format(value);value.toString();
//               debugPrint(value.toString());},
//       );
    
  
//   }

//  ////////////////
//  /// 
//  ///  
// //  Widget _countryCodes() { 
// //       return DropdownButtonFormField<String>(
// //       decoration: InputDecoration(
// //        labelText:'Country Codes   ',
// //          hintText:'country Code',
// //        ),
// //               value: countryCodes=findval( apiLicencddata.countryId,3),
// //               onChanged: (String newValue) =>setState(() => countryCodes = newValue),
// //               validator: (value) => value == null ? 'field required' : null,
// //          //  onSaved: (val) =>  apiLicencddata.codeId=int.parse(val),
// //               items: countriesdatalist.map((item) {
// //             return new DropdownMenuItem(
// //               child: new Text(item['countryName']),
// //               value: item['countryName'].toString(),
              
// //             );
// //           }).toList(),
// //         );}
// //   //////////////////////
// //    Widget _dateofratingtest () {
// //       return DateTimeField(
// //             //  dateOnly: true,
// //             decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
// //             suffixIcon : Icon(Icons.calendar_today),),
// //            // hintText: '$dateOfInitialIssue'),
// //             format: dateFormat,
// //             initialValue:DateTime.parse(apiLicencddata.dtRatingtest),
// //             onShowPicker: (context, currentValue) {
// //                           return showDatePicker(
// //                           context: context,
// //                           firstDate: DateTime(1900),
// //                           initialDate:  DateTime.now(),
// //                           lastDate: DateTime(2100));
// //                     },
// //             validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
// //             onChanged: (dt) { setState(() => dateofratingtest = dt);
// //                         print('Selected date: $dateofratingtest');},
// //             onSaved: (value) {apiLicencddata.dtRatingtest= saveFormat.format(value);value.toString();
// //               debugPrint(value.toString());},
// //       );
   
// //   }
  
// //   ////////////////
// //    Widget _dateofIRtest () {
// //       return DateTimeField(
// //             //  dateOnly: true,
// //             decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
// //             suffixIcon : Icon(Icons.calendar_today),),
// //            // hintText: '$dateOfInitialIssue'),
// //             format: dateFormat,
// //             initialValue:DateTime.parse(apiLicencddata.dtIrtest),
// //             onShowPicker: (context, currentValue) {
// //                           return showDatePicker(
// //                           context: context,
// //                           firstDate: DateTime(1900),
// //                           initialDate:  DateTime.now(),
// //                           lastDate: DateTime(2100));
// //                     },
// //             validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
// //             onChanged: (dt) { setState(() => dateofIRtest = dt);
// //                         print('Selected date: $dateofIRtest');},
// //             onSaved: (value) {apiLicencddata.dtIrtest= saveFormat.format(dateofIRtest);value.toString();
// //               debugPrint(value.toString());},
// //       );
    
// //   }
// //   //////////////////
// //    Widget _validuntil  () {
// //      return DateTimeField(
// //             //  dateOnly: true,
// //             decoration: InputDecoration(labelText: 'Valid upto',
// //             suffixIcon : Icon(Icons.calendar_today),),
// //            // hintText: '$dateOfInitialIssue'),
// //             format: dateFormat,
// //             initialValue:DateTime.parse(apiLicencddata.dtValidity),
// //             onShowPicker: (context, currentValue) {
// //                           return showDatePicker(
// //                           context: context,
// //                           firstDate: DateTime(1900),
// //                           initialDate:  DateTime.now(),
// //                           lastDate: DateTime(2100));
// //                     },
// //             validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
// //             onChanged: (dt) { setState(() => validuntil = dt);
// //                         print('Selected date: $dateofratingtest');},
// //             onSaved: (value) {apiLicencddata.dtValidity= saveFormat.format(value);value.toString();
// //               debugPrint(value.toString());},
// //       );
// //     //
// //   }
  
//   /////////////////////
//      Widget _examinerscertificatenumber() { 
//       return TextFormField(
//         initialValue:initialnumber??apiLicencddata.examinerNumber.toString(),// licencenumber.toString(),
//            decoration: InputDecoration(  hintText: 'Enter Licence number',
//            labelText: 'Examiners certificate number '),
//           keyboardType: TextInputType.phone,
//           validator: licenceNumber,
//           onChanged: (String newValue){apiLicencddata.examinerNumber=int.parse(newValue);},
//           onSaved: (val) =>  apiLicencddata.examinerNumber=int.parse(val),
//         );
// }
  
// //   ///////////////
  
//     // Widget _classOptions() { 
//     //   return DropdownButtonFormField<String>(
//     //   decoration: InputDecoration(
//     //    labelText:'Class  * ',
//     //      hintText:'class Name',
//     //    ),
//     //           value: classOptions=findval( licenseDetail.classId,4),
//     //           onChanged: (String newValue) =>setState(() => classOptions = newValue),
//     //           validator: (value) => value == null ? 'field required' : null,
//     //    onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
//     //           items: licenseclassdatalist.map((item) {
//     //         return new DropdownMenuItem(
//     //           child: new Text(item['className']),
//     //           value: item['id'].toString(),
//     //            onTap: () {
//     //               print( item['id']);
//     //               licenseDetail.classId = item['id'];
//     //            },
//     //         );
//     //       }).toList(),
//     //     );}
  
// // ///////////////////////////
// //     Widget _tpyeOptionData() { 
// //       return DropdownButtonFormField<String>(
// //       decoration: InputDecoration(
// //       labelText:' Type * ',
// //       hintText:'Select Type',
// //        ),
// //               value: tpyeOptionData,
// //               onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
// //               validator: (value) => value == null ? 'field required' : null,
// //              onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
// //               items: licensetypedatalist.map((item) {
// //             return new DropdownMenuItem(
// //               child: new Text(item['typeName']),
// //               value: item['id'].toString(),
// //             );
// //           }).toList(),
// //         );
// //         }
  
 
// //  /////////
//   Widget _ir(){
//     return CheckboxListTile(
//               activeColor: Theme.of(context).accentColor,
//               title: Text('IR'),
//                controlAffinity: ListTileControlAffinity.leading,
//               value: ir,
//               onChanged: (bool value) { 
//                 setState(() =>ir= value);
//                 licenseDetail.ir=ir;
//               },  
        
             
//             );
//   }
// //  /////////
//  Widget _co_Pilot(){
//     return CheckboxListTile(
//               activeColor: Theme.of(context).accentColor,
//               title: Text('Co_Pilot'),
//                controlAffinity: ListTileControlAffinity.leading,
//               value: co_Pilot,
//               onChanged: (bool value) { 
//                //
                
//                 setState(() =>co_Pilot= value);
//                 licenseDetail.copilot=ir;
//               },  
        
             
//             );
//   }
//   //////////////
//   ///
//   Widget _additionalDetails(){
//  return  Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4.0),
//         child: Column(
//           children: <Widget>[
//             SizedBox(height:10.0),
//             ExpansionTile(
//               title: Text( "Additional Detail", style: TextStyle( fontWeight: FontWeight.bold ),
//               ),
//               children: <Widget>[
//                 DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//        labelText:'Class  * ',
//          hintText:'class Name',
//        ),
//               value: classOptions,//=findval( licenseDetail.classId,4),
//               onChanged: (String newValue) =>setState(() => classOptions = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//        onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
//               items: licenseclassdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['className']),
//               value: item['className'].toString(),
//                onTap: () {
//                   print( item['id']);
//                   licenseDetail.classId = item['id'];
//                },
//             );
//           }).toList(),
//         ),
//   DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//             labelText:' Type * ',
//             hintText:'Select Type',
//             ),
//                     value: tpyeOptionData,
//                     onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
//                     validator: (value) => value == null ? 'field required' : null,
//                   onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
//                     items: licensetypedatalist.map((item) {
//                   return new DropdownMenuItem(
//                     child: new Text(item['typeName']),
//                     value: item['id'].toString(),
//                   );
//                 }).toList(),
//               ),
//    CheckboxListTile(
//               activeColor: Theme.of(context).accentColor,
//               title: Text('IR'),
//                controlAffinity: ListTileControlAffinity.leading,
//               value: ir,
//               onChanged: (bool value) { 
//                 setState(() =>ir= value);
//                 licenseDetail.ir=ir;  },  ),
//    CheckboxListTile(
//               activeColor: Theme.of(context).accentColor,
//               title: Text('Co_Pilot'),
//                controlAffinity: ListTileControlAffinity.leading,
//               value: co_Pilot,
//               onChanged: (bool value) { 
//                 setState(() =>co_Pilot= value);
//                 licenseDetail.copilot=ir; },   ),
//               ],
//             ),
//           ],
//         ),
      
//     );
  
//   }
//   /////////////////
  
  
//   Widget showdata(){
//     return Row(children: <Widget>[
//       SizedBox(  height: 39, width: 3, ),
//       RaisedButton(
//               color:Colors.pink,
//               onPressed:(){},//,
//               child: new Text('get'),
//               ),
//       SizedBox( width: 3, ),
//       RaisedButton(
//        color:Colors.pink,
//           onPressed:reset,
//           child: new Text('Reset'),
//           ),
//          SizedBox( width: 3, ),
//       RaisedButton(
//          color:Colors.indigo[400],
//           onPressed:(){postdata();},// _validateInputs,
//           child: new Text('Save'),
//           )
//       ]
//      );
//   }
  
//   ////////////////////////////////////////
//   //validation
//   ////////////////////////////
// String licenceNumber(String value) {
//   if(value == null)  return null;
//   final n = num.tryParse(value);
//   if(n == null)  return '"$value" is not a valid number';
//   return null;
// }
  
//  bool isValidDob(String dob) {
//     if (dob.isEmpty) return true;
//     var d = convertToDate(dob);
//     return d != null && d.isBefore(new DateTime.now());
// }


//   DateTime convertToDate(String input) {
//     try 
//     {
//       var d = new DateFormat.yMd().parseStrict(input);
//       return d;
//     } catch (e) {
//       return null;
//     }    
//   }
  
//   /////////////////////////////////////////////////////////////////
//    void reset() {

//    _formKey.currentState.reset();
// }
//   void _validateInputs() {
   
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//     postdata( );
//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
// }

 
//   //   Future<Licenceclass> getlicencddata() async {
//   // final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/226');

//   // if (response.statusCode == 200) {
//   //     print(json.decode(response.body));
//   //      apiLicencddata =Licenceclass.fromJson(json.decode(response.body));
//   //      //_onSuccessResponse();
//   //    return Licenceclass.fromJson(json.decode(response.body));
    
//   // } else {
//   //   // If the server did not return a 200 OK response,
//   //   // then throw an exception.
//   //   throw Exception('Failed to load album');
//   // }

//   // }
//     // Response response = await Dio().get("http://192.168.43.246:8080/dLicence/api/license/v1/193");
   
//     //   String res = response.data;
//     //    int statusCode = response.statusCode;

//     //   if (statusCode < 200 || statusCode > 400 || json == null) {
//     //   //  _onFailureResponse(new Exception("Error while fetching data"));
//     //   } else { }
//     //     print(json.decode(res));
//     //     //String data=json.decode(res);
//     //     apiLicencddata=LicenceclassFromJson(res);
//     //     //
//     //   // apiLicencddata=Licenceclass.fromJson(data);
//     //     // Licenceclass userdataofclass=Licenceclass.fromJson(data);
//     //     print(Licenceclass);
//     //       setState(() {
//     //  print(apiLicencddata.licenseNumber);
//     //   licencenumber=apiLicencddata.licenseNumber.toString();
//     // }); 




//     void   _onSuccessResponse( ){
//    //  levelvalue(apiLicencddata.countryId,1);
//     // levelvalue(apiLicencddata.codeId,2);
//      print(apiLicencddata.examinerId);
//       print(apiLicencddata.countryId);
//      print(contries);
//      //contries=countriesdatalist[apiLicencddata.countryId]['countryCode'];
//       licencenumber=apiLicencddata.licenseNumber.toString();
//     //  licencenumber=apiLicencddata.
//      // licencenumber=apiLicencddata.licenseNumber.toString();
//     }
//  List<ExaminerDetail> playerExaminer = new List(10);
//   int x=0;
//    List<InstructorDetail> playerInstructor = new List(10);
//     int z=0;
//      List<EndorsementDetail> playerEndorsement = new List(10);
//     int w=0;
// addexaniner(int id ,String type,String remark){
//   playerExaminer[x] = new ExaminerDetail() ; // add this to your code
//   playerExaminer[x].remark =remark;
//   playerExaminer[x].id =id;
//   playerExaminer[x].examinerTypeId =int.parse(type);    
//   saveLicenseData.examinerDetails.add(playerExaminer[x]);
//   x++;
// }
// addinstructorr(int id ,String type,String remark){
//   playerInstructor[z] = new InstructorDetail() ; // add this to your code
//   playerInstructor[z].remark =remark;
//   playerInstructor[z].id =id;
//   playerInstructor[z].instructorTypeId =int.parse(type);    
//   saveLicenseData.instructorDetails.add(playerInstructor[z]);
//   z++;
// }
// addendorsement(int id ,String type){
//   playerEndorsement[w] = new EndorsementDetail() ; // add this to your code
//   playerEndorsement[w].id =id;
//   playerEndorsement[w].endorsementTypeId =int.parse(type);    
//   saveLicenseData.endorsementDetails.add(playerEndorsement[w]);
//   w++;
// }
// void postdata(){
//        saveLicenseData.instructorDetails = <InstructorDetail>[];
//        saveLicenseData.examinerDetails = <ExaminerDetail>[];
//        saveLicenseData.endorsementDetails = <EndorsementDetail>[];
//     int dat;
    
//   int count=endorsementDataFromPage.length;print(count);

//   for(dat=0;dat<instructordatafrompage.length;dat++){ 
//               String f= instructordatafrompage[dat]['instructorTypeId'];
//               String r= instructordatafrompage[dat]['remark'];
//               int b= instructordatafrompage[dat]['id'];
//             //  print(b); print(r); print(f);
//             addinstructorr(b,f,r);
//     }
//      for(dat=0;dat<examinerdatafrompage.length;dat++){ 
//               String f= examinerdatafrompage[dat]['examinerTypeId'];
//               String r= examinerdatafrompage[dat]['remark'];
//               int b= examinerdatafrompage[dat]['id'];
//             //  print(b); print(r); print(f);
//             addexaniner(b,f,r);
//     }
//     for(dat=0;dat<count;dat++){ 
//               String f= endorsementDataFromPage[dat]['endorsementTypeId'];
//               int b= endorsementDataFromPage[dat]['id'];
//             //  print(b); print(r); print(f);
//             addendorsement(b,f);
//     }
//  //saveLicenseData.personnel = <Personneldata>[personal];
//  saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
//  String jsons = licenceclassToJson(saveLicenseData);
//  print( jsons);
//  //sendRequest( jsons) ;

  
// }

// sendRequest( String data) async {

 

//     var url = 'http://192.168.43.246:8080/dLicence/api/license/v1';
//     http.post(url, headers: {"Content-Type": "application/json"}, body: data)
//         .then((response) {
//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");
//     });  
//   }








// ///////////////////////////
// //end
// //////////////////
// }