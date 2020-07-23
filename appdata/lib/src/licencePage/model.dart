
import 'package:http/http.dart' as http;
import 'dart:convert';

Licenceclass LicenceclassFromJson(String str) => Licenceclass.fromJson(json.decode(str));
String LicenceclassToJson(Licenceclass data) => json.encode(data.toJson());

class Licenceclass {
    Licenceclass({
           this.additionalRemarks,
        this.codeId,
        this.countryId,
        this.dtIrtest,
        this.dtIssue,
        this.dtRatingtest,
        this.dtValidity,
        this.examinerId,
        this.examinerNumber,
        this.id,
        this.licenseDetails,
        this.licenseNumber,
        this.personnel,
        this.ratingCertId,
        this.remarks,
        this.stateId,
        this.titleId,
    });
  String additionalRemarks;
    int codeId;
    int countryId;
    String dtIrtest;
    String dtIssue;
    String dtRatingtest;
    String dtValidity;
    int examinerId;
    int examinerNumber;
    int id;
    List<LicenseDetail> licenseDetails;
    int licenseNumber;
    List<Personneldata> personnel;
    String ratingCertId;
    String remarks;
    int stateId;
    int titleId;

    factory Licenceclass.fromJson(Map<String, dynamic> json) => Licenceclass(
         additionalRemarks: json["additionalRemarks"] == null ? null : json["additionalRemarks"],
        codeId: json["codeId"] == null ? null : json["codeId"],
        countryId: json["countryId"] == null ? null : json["countryId"],
        dtIrtest: json["dtIrtest"] == null ? null : json["dtIrtest"],
        dtIssue: json["dtIssue"] == null ? null : json["dtIssue"],
        dtRatingtest: json["dtRatingtest"] == null ? null : json["dtRatingtest"],
        dtValidity: json["dtValidity"] == null ? null : json["dtValidity"],
        examinerId: json["examinerId"] == null ? null : json["examinerId"],
        examinerNumber: json["examinerNumber"] == null ? null : json["examinerNumber"],
        id: json["id"] == null ? null : json["id"],
        licenseDetails: json["licenseDetails"] == null ? null : List<LicenseDetail>.from(json["licenseDetails"].map((x) => LicenseDetail.fromJson(x))),
        licenseNumber: json["licenseNumber"] == null ? null : json["licenseNumber"],
        personnel: json["personnel"] == null ? null : List<Personneldata>.from(json["personnel"].map((x) => Personneldata.fromJson(x))),
        ratingCertId: json["ratingCertId"] == null ? null : json["ratingCertId"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        stateId: json["stateId"] == null ? null : json["stateId"],
        titleId: json["titleId"] == null ? null : json["titleId"],
    );

    Map<String, dynamic> toJson() => {
        "additionalRemarks": additionalRemarks == null ? null : additionalRemarks,
        "codeId": codeId == null ? null : codeId,
        "countryId": countryId == null ? null : countryId,
        "dtIrtest": dtIrtest == null ? null : dtIrtest,
        "dtIssue": dtIssue == null ? null : dtIssue,
        "dtRatingtest": dtRatingtest == null ? null : dtRatingtest,
        "dtValidity": dtValidity == null ? null : dtValidity,
        "examinerId": examinerId == null ? null : examinerId,
        "examinerNumber": examinerNumber == null ? null : examinerNumber,
        "id": id == null ? null : id,
        "licenseDetails": licenseDetails == null ? null : List<dynamic>.from(licenseDetails.map((x) => x.toJson())),
        "licenseNumber": licenseNumber == null ? null : licenseNumber,
        "personnel": personnel == null ? null : List<dynamic>.from(personnel.map((x) => x.toJson())),
        "ratingCertId": ratingCertId == null ? null : ratingCertId,
        "remarks": remarks == null ? null : remarks,
        "stateId": stateId == null ? null : stateId,
        "titleId": titleId == null ? null : titleId,
    };
}

class LicenseDetail {
    LicenseDetail({
        this.additionalRating,
        this.classId,
        this.copilot,
        this.id,
        this.ir,
        this.typeId,
    });

    bool additionalRating;
    int  classId;
    bool copilot;
    int  id;
    bool ir;
    int  typeId;

    factory LicenseDetail.fromJson(Map<String, dynamic> json) => LicenseDetail(
        additionalRating: json["additionalRating"] == null ? null : json["additionalRating"],
        classId: json["classId"] == null ? null : json["classId"],
        copilot: json["copilot"] == null ? null : json["copilot"],
        id: json["id"] == null ? null : json["id"],
        ir: json["ir"] == null ? null : json["ir"],
        typeId: json["typeId"] == null ? null : json["typeId"],
    );

    Map<String, dynamic> toJson() => {
        "additionalRating": additionalRating == null ? null : additionalRating,
        "classId": classId == null ? null : classId,
        "copilot": copilot == null ? null : copilot,
        "id": id == null ? null : id,
        "ir": ir == null ? null : ir,
        "typeId": typeId == null ? null : typeId,
    };
}

class Personneldata {
    Personneldata({
        this.id,
        this.idUser,
        this.personnelType,
        this.remarks,
    });

    int id;
    String idUser;
    String personnelType;
    String remarks;

    factory Personneldata.fromJson(Map<String, dynamic> json) => Personneldata(
        id: json["id"] == null ? null : json["id"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        personnelType: json["personnelType"] == null ? null : json["personnelType"],
        remarks: json["remarks"] == null ? null : json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "idUser": idUser == null ? null : idUser,
        "personnelType": personnelType == null ? null : personnelType,
        "remarks": remarks == null ? null : remarks,
    };
}





void postdata(
 Licenceclass saveLicenseData,
 LicenseDetail licenseDetail,
 //Personneldata personal
 ){
 //saveLicenseData.personnel = <Personneldata>[personal];
 saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String jsons = LicenceclassToJson(saveLicenseData);
 print( jsons);
 sendRequest( jsons) ;

  
}

sendRequest( String data) async {

 

    var url = 'http://192.168.43.246:8080/dLicence/api/license/v1';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });  
  }



  ///////////////////

  

 ////////////////////////////////////////////////////////////////////////

///////////////





























// import 'dart:convert';
// //import 'model.dart';

// import 'package:flutter/material.dart';
// //import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
// @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Language',
//       home: Licencepage(),
//     );
//   }
// } 

// class Licencepage extends StatefulWidget {
//   @override
//   _Licencepage createState() => new _Licencepage();
//   }
// class _Licencepage extends State<Licencepage> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  bool _autoValidate = false;
//  String languageString;
//   final dtAudiogram = new TextEditingController();  
//   final dtEcg = new TextEditingController(); 
//   final dtExam = new TextEditingController();  
//   final dtExpPrevcert = new TextEditingController(); 
//   final dtExpiryC1 = new TextEditingController();  
//   final dtExpiryC1Sp = new TextEditingController(); 
//   final dtExpiryC2 = new TextEditingController();  
//   final dtExpiryC3 = new TextEditingController();
//   final dtExpiryClapl = new TextEditingController();  
//   final dtIssue = new TextEditingController(); 
//  final TextEditingController _controller = new TextEditingController();
//  Medical saveMedicalData=new Medical();
//  String a;
//  bool checkboxValue=false;
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         debugShowCheckedModeBanner: false,
//       home: new Scaffold(
        
//         appBar: new AppBar(
          
//           title: new Text('    Medical'),
//         ),
//         body: new SingleChildScrollView(
//           child: new Container(
//             margin: new EdgeInsets.all(15.0),
//             child: new Form(
//               key: _formKey,
              
//               autovalidate: _autoValidate,
              
        
//             child:  formUI(),
     
//             ),
         
//         ),
//       ),
//         ),
//     );
//   }
//    Widget formUI() {
//        return  Column(
//       children:[
//           _tpyeOptionData(),
//           _contries(), 
//          _licenceNumber(),
//           _limitations(),
//           _expirydateofthiscertificate(),
//          _dateOfInitialIssue(),
//            _examinationdate(),
//            _expirydateofpreviousMedicalCertificate(), 
//         _electrocardiogram(),
//            _audiogram(),
//           _comments(),
// //       
//         showdata()
        
        
        
   
//       ]
//      );
     
//    }
//   //////////////////
//      Widget _tpyeOptionData() { 
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//      labelText:' Type  ',
//       hintText:'Select Type',
//        ),
//               value: tpyeOptionData,
//               onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//           onSaved: (val) =>  saveMedicalData.licenseId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryName']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}
  
//  /////////////////////
//    Widget _contries() {
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:'State of issue * ',
//       hintText:'Select State',
//        ),
//               value: contries,
//               onChanged: (String newValue) =>setState(() => contries = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//                onSaved: (val) =>  saveMedicalData.stateId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );
//      }  
//   //////////////////////
//     Widget _licenceNumber() { 
//       return TextFormField(
//           decoration: const InputDecoration(labelText: 'Certificate Number'),
//           keyboardType: TextInputType.phone,
//           validator: licenceNumber,
//           onSaved: (val) =>  saveMedicalData.licenseNumber=int.parse(val),
//         );
// }
  
  
//   ///////////////
//     Widget _limitations() { 
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//      labelText:'Limitations ',
//        //hintText:'Select LicenceCode',
//        ),
//               value: limitations,
//               onChanged: (String newValue) =>setState(() => limitations = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//                onSaved: (val) =>  saveMedicalData.limitationId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}

//   /////////////
//     Widget _expirydateofthiscertificate() {
//      return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                hintText: ' Select Date of initial issue :',
//  labelText: 'Expiry date of this certificate',
//             ),
//          controller: dtExpiryC1,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtExpiryC1 =val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
//               showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtExpiryC1.text= expirydateofthiscertificate =date.toString();
//                       //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             //_chooseDate(context, _controller.text,_expirydateofthiscertificate);
//             }),
//           )
//         ]);
//     }
  
// //   }
// //   ///////////////////
//        Widget _dateOfInitialIssue() {
//      return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                hintText: ' Date Of Initial Issue',
//  labelText: 'Expiry date of this certificate',
//             ),
//          controller: dtIssue,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtIssue =val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
//                showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtIssue.text= dateOfInitialIssue =date.toString();

//             //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
//   }
// //   ////////////////////////
//    Widget _examinationdate () {
//     return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                  hintText: 'Examination date',
//               labelText: 'Date of date examinationdate :',
//             ),
//          controller: dtExam,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtExam=val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
//             showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtExam.text= examinationdate =date.toString();

//             //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
//   }
  
// //   ////////////////
//    Widget _expirydateofpreviousMedicalCertificate () {
//     return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                       hintText: ' Select Date of IR Test ',
//          labelText: 'Epiry date previous Medical Certificate',
//             ),
//          controller: dtExpPrevcert,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtExpPrevcert=val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
              
//             showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtExpPrevcert.text= expirydateofpreviousMedicalCertificate =date.toString();

//             //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
//   }
// //   //////////////////
//    Widget _electrocardiogram  () {
//     return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                 hintText: ' Select Date',
//          labelText: 'Electrocardiogram ',
//             ),
//          controller: dtEcg,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtEcg=val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
//                showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtEcg.text= electrocardiogram =date.toString();

//             //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
//   }
  
// //   /////////////////////
  
//        Widget _audiogram  () {
//     return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                 hintText: ' Select Date',
//          labelText: ' Audiogram',
//             ),
//          controller: dtAudiogram,
//             keyboardType: TextInputType.datetime,
//          // validator: (val) =>
//          //     isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>saveMedicalData.dtAudiogram=val.toString(),//convertToDate(val).toString(),
//           )),
//           new IconButton(
//             icon: const Icon(Icons.calendar_today),
//             tooltip: 'Choose date',
//             onPressed: (() {
//                showDatePicker(

//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     lastDate: DateTime(2200)
//                 ).then((date) {
//                   setState(() {
//                   dtAudiogram.text= audiogram =date.toString();

//             //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
//   }
//   //////////////
//      Widget _comments() { 
//       return TextFormField(
//            decoration: InputDecoration(  hintText: 'Enter  Comments Here',
//            labelText: 'Comments '),
      
//           onSaved: (val) =>  saveMedicalData.comments=val,
//         );
// }
  
//   ///////////////
  
//     Widget _classOptions() { 
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//        labelText:'Issued by : * ',
//          hintText:'country Code',
//        ),
//               value: classOptions,
//               onChanged: (String newValue) =>setState(() => classOptions = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//        onSaved: (val) =>  licenseDetail.classId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryName']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}
  
//   /////////////////////////
//     Widget _tpyeOptionData() { 
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//      labelText:' Type * ',
//       hintText:'Select Type',
//        ),
//               value: tpyeOptionData,
//               onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//           onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryName']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}
  
 
//  /////////
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
//   /////////////////
//    Widget _co_Pilot(){
//     return CheckboxListTile(
//               activeColor: Theme.of(context).accentColor,
//               title: Text('Co_Pilot'),
//                controlAffinity: ListTileControlAffinity.leading,
//               value: co_Pilot,
//               onChanged: (bool value) { 
//                 setState(() =>co_Pilot= value);
//                 licenseDetail.copilot=ir;
//               },  
        
             
//             );
//   }
//   ////////////
   
  



















