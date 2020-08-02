

import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'modal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
import 'package:appdata/src/models/masterdata.dart';

class MedicalPage extends StatefulWidget {
  @override
  _MedicalPage createState() => new _MedicalPage();
  }
class _MedicalPage extends State<MedicalPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool _autoValidate = false;
 var initialnum='';
 String languageString;
var saveFormat = DateFormat('yyyy-MM-dd'); 
var showformmat = DateFormat("dd-MM-yyyy");
final dateFormat = DateFormat("dd-MM-yyyy");
  var dtAudiogram ;  
  var dtEcg ; 
  var dtExam ;  
  var dtExpPrevcert ; 
  var dtExpiryC1 ;  
  var dtExpiryC1Sp ; 
  var dtExpiryC2 ;  
  var dtExpiryC3 ;
  var dtExpiryClapl ;  
  var dtIssue ; 
  var tpyeOptionDatamed;

  Future<int> futuremedicalclass;
 bool visibilityclass1 = false;
 bool visibilityclass3=false;
  DateTime date;
  String niveaulevel=''; 
  int nilevel;
  String levelvalueanswer;
  String fromjsondata;
  int showdt;
  
 
  Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
      showDatePicker(
                     context: context,
                     initialDate: DateTime.now(),
                     firstDate: DateTime(1950),
                     lastDate: DateTime(2200)
                     ).then((date) {
                     setState(() {
                     datecontroller.text= a =date.toString();
                      //new DateFormat.yMMMMd().format(date);
                     }); }); 
  }
 //nal TextEditingController _controller ;
 Medical saveMedicalData=new Medical();
   //Medical user=new Medical();
 String a;
 bool checkboxValue=false;
 

  @override
  void initState() {
    super.initState();
  futuremedicalclass = getlicencddata();
 //print(apiLicencddata.licenseNumber);
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
        appBar: new AppBar( title: new Text('    Medical'), ),
  //        body: Center(
  //         child: FutureBuilder<int>(
  //           future: futuremedicalclass,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               return   SingleChildScrollView(
  //          child: new Container(
  //           margin: new EdgeInsets.all(15.0),
  //           child: new Form(
  //             key: _formKey,
  //             autovalidate: _autoValidate,
  //             child:formUI(),
  //           ),
  //         ),
  //       );
  //     } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
  //      // By default, show a loading spinner.
  //       return CircularProgressIndicator();
  //       },
  //     ),
  //  ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              
              autovalidate: _autoValidate,
              
        
            child:  formUI(),
     
            ),
         
        ),
      ),
        ),
    );
  }
   Widget formUI() {
       return  Column(
      children:[
          _tpyeOptionData(),
          _contries(), 
         _licenceNumber(),
          _limitations(),
         visibilityclass1 ? _dtExpiryC1Sp() : new Container(),
         visibilityclass1 ? _dtExpiryC1() : new Container(),
         visibilityclass1 ? _dtExpiryC2() : new Container(),
         visibilityclass1 ? _dtExpiryClapl() : new Container(),
         visibilityclass3 ? _dtExpiryC3() : new Container(),
       //   _expirydateofthiscertificate(),
         _dateOfInitialIssue(),
         _examinationdate(),
         _expirydateofpreviousMedicalCertificate(), 
         _electrocardiogram(),
         _audiogram(),
         _comments(),
//       
        showdata()
        
        
        
   
      ]
     );
     
   }
  //////////////////
  
    // Widget _tpyeOptionData() { 
    //   return DropdownButtonFormField<String>(
    //   decoration: InputDecoration(
    //   labelText:' Type * ',
    //   hintText:'Select Type',
    //    ),
    //           value: findval( saveMedicalData.licenseId, 1),
    //           onChanged: (String newValue) {  saveMedicalData.licenseId =  saveMedicalData.licenseId;},
    //           validator: (value) => value == null ? 'field required' : null,
    //         onSaved: (val) =>   saveMedicalData.licenseId =  saveMedicalData.licenseId ,
    //           items: medicaltpedatalist.map((item) {
    //         return new DropdownMenuItem(
    //           child: new Text(item['type']),
    //           value: item['type'].toString(),
    //             onTap: () {
    //               print( item['id']);
                  
    //              saveMedicalData.licenseId= item['id'];
    //               _changed( item['id'].toString());
    //            },
    //         );
    //       }).toList(),
    //     );
    //     }
     Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:' Type  ',
      hintText:'Select Type',
       ),
              value: tpyeOptionDatamed,
              onChanged: (String newValue) {
               _changed(newValue);
                setState(() => tpyeOptionDatamed = newValue);
              },
              validator: (value) => value == null ? 'field required' : null,
        //  onSaved: (val) =>  saveMedicalData.licenseId=int.parse(val),
              items: medicaltpedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['type']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  
  
 /////////////////////
   Widget _contries() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'State of issue * ',
      hintText:'Select State',
       ),
              value: findval(saveMedicalData.stateId, 2),
              onChanged: (String newValue) {saveMedicalData.stateId=saveMedicalData.stateId;},
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveMedicalData.stateId= saveMedicalData.stateId,
              items: statedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['stateName']),
              value: item['stateName'].toString(),
              onTap: () {
                  print( item['id']);
                  saveMedicalData.stateId= item['id'];
               },
            );
          }).toList(),
        );
     }  
  //////////////////////
    Widget _licenceNumber() { 
      return TextFormField(
        initialValue: initialnum?? saveMedicalData.licenseNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: validNumber,
          onSaved: (val) =>  saveMedicalData.licenseNumber=int.parse(val),
        );
}
  
  
  ///////////////
    Widget _limitations() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:'Limitations ',
       //hintText:'Select LicenceCode',
       ),
              value: findval( saveMedicalData.limitationId, 3),
              onChanged: (String newValue){ saveMedicalData.limitationId= saveMedicalData.limitationId;},
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveMedicalData.limitationId= saveMedicalData.limitationId,
              items: limitationdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['limitation']),
              value: item['limitation'].toString(),
                 onTap: () {
                  print( item['id']);
                  saveMedicalData.limitationId= item['id'];
               },
            );
          }).toList(),
        );}

  /////////////
    Widget _dtExpiryC1Sp()     {
        return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration( labelText: 'Expiry date of Class 1(SP) *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpiryC1Sp,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryC1Sp = dt);
                        print('Selected date: $dtExpiryC1Sp');},
            onSaved: (value) { saveMedicalData.dtExpiryC1Sp= saveFormat.format(value);value.toString();
            //  debugPrint(value.toString());},
               },
                  );
   
  }
//    
// //   ///////////////////
    Widget _dtExpiryC1() {
  return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(   labelText: 'Expiry date of Class 1 *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpiryC1,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryC1 = dt);
                        print('Selected date: $dtExpiryC1');},
            onSaved: (value) { saveMedicalData.dtExpiryC1= saveFormat.format(value);value.toString();
            //  debugPrint(value.toString());},
               },
                  );
   
  }

// //   ///////////////////
    Widget _dtExpiryC2() {
       return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(   labelText: 'Expiry date of Class 2 *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpiryC2,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryC2 = dt);
                        print('Selected date: $dtExpiryC2');},
            onSaved: (value) { saveMedicalData.dtExpiryC2= saveFormat.format(value);value.toString();
            //  debugPrint(value.toString());},
               },
                  );
   
  }

/////////////
      Widget _dtExpiryC3() {
return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(   labelText: 'Expiry date of Class 3 *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpiryC3,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryC3 = dt);
                        print('Selected date: $dtExpiryC3');},
            onSaved: (value) { saveMedicalData.dtExpiryC3= saveFormat.format(value);value.toString();
            //  debugPrint(value.toString());},
               },
                  );
   
  }

//   ///////////////////
    Widget _dtExpiryClapl() {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(    labelText: 'Expiry date of LAPL *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpiryClapl,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryClapl = dt);
                        print('Selected date: $dtExpiryClapl');},
            onSaved: (value) { saveMedicalData.dtExpiryClapl= saveFormat.format(value);value.toString();
            //  debugPrint(value.toString());},
               },
                  );
   
  }

//   ///////////////////
       Widget _dateOfInitialIssue() {
         return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(   labelText: 'Examination date',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExam,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExam = dt);
                        print('Selected date: $dtExam');},
            onSaved: (value) { saveMedicalData.dtExam= saveFormat.format(value);value.toString();  },  );
        }
//   ////////////////////////
   Widget _examinationdate () {
        return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(    labelText: 'Date Of Initial Issue',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtIssue,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtIssue = dt);
                        print('Selected date: $dtIssue');},
            onSaved: (value) { saveMedicalData.dtIssue= saveFormat.format(value);value.toString();  },  );
        }
//   ////////////////
   Widget _expirydateofpreviousMedicalCertificate () {
 return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(  labelText: 'Epiry date previous Medical Certificate',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtExpPrevcert,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpPrevcert = dt);
                        print('Selected date: $dtExpPrevcert');},
            onSaved: (value) { saveMedicalData.dtExpPrevcert= saveFormat.format(value);value.toString();  },  );
        }
//   //////////////////
   Widget _electrocardiogram  () {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(  labelText: 'Electrocardiogram',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtEcg,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtEcg = dt);
                        print('Selected date: $dtEcg');},
            onSaved: (value) { saveMedicalData.dtEcg= saveFormat.format(value);value.toString();  },  );
        }

//   /////////////////////
  
       Widget _audiogram  () {
              return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(  labelText: 'Audiogram',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dtAudiogram,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtAudiogram = dt);
                        print('Selected date: $dtAudiogram');},
            onSaved: (value) { saveMedicalData.dtAudiogram= saveFormat.format(value);value.toString();  },  );
        }
  
  //////////////
     Widget _comments() { 
      return TextFormField(
        initialValue: initialnum??saveMedicalData.comments,
           decoration: InputDecoration(  hintText: 'Enter  Comments Here',
           labelText: 'Comments '),
      
          onSaved: (val) =>  saveMedicalData.comments=val,
        );
}

  
  
  
  ///////////////
    
  Widget showdata(){
    return Row(children: <Widget>[
          Expanded(
            
              child: Container(
             
                height: 100,
              ),),
     RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child: new Text('Reset'),
          ),
         Container(
               width: 10,
               
              ),
  RaisedButton(
       color:Colors.indigo[400],
          onPressed: _validateInputs,
          child: new Text('Save'),
         
            ),
      
            ]
        );
  }
  ////////////////////////////////////////
  //validation
  ////////////////////////////
  
  String validNumber(String value) {

  if(value == null) 
    return null;
 
  final n = num.tryParse(value);
  if(n == null) 
  return '"$value" is not a valid number';
 
  return null;
}
  
   bool isValidDob(String dat) {
    if (dat.isEmpty) return true;
     return false;
//  var d = convertToDate(dob);
 // return d != null && d.isBefore(new DateTime.now());
}

  
  /////////////////////////////////////////////////////////////////
  // All function
  /////////////////////////////////////////////////////////////////
 
   void reset() {

   _formKey.currentState.reset();
     
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    shoe();

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
  

  ///////////////////
  shoe( ){

 String json = welcomeToJson(saveMedicalData);
   fromjsondata= json;
 print( json);

}
  
   
  void _changed( String field) {
    switch(field){
   case "1": { visibilityclass1=true;  visibilityclass3=false;}
  break;
    case "2":{ visibilityclass3=true;  visibilityclass1=false;}
       break;
      
   default: { 
      visibilityclass1=false;
     visibilityclass3=false;
   }
   break; 
} 
       }
  
        
//   void _changed( String field) {
//     switch(field){
//    case "1": { visibilityclass1=true;  visibilityclass3=false;}
//   break;
//     case "2":{ visibilityclass3=true;  visibilityclass1=false;}
//        break;
      
//    default: { 
//       visibilityclass1=false;
//      visibilityclass3=false;
//    }
//    break; 
// } 
//        }


     Future<int> getlicencddata() async {
        // return 1;
  final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/$savelicencdId/medicaldata');

  if (response.statusCode == 200) {
      print(json.decode(response.body));
       saveMedicalData =Medical.fromJson(json.decode(response.body));
       //_onSuccessResponse();
     return 1; } 
  else if  (response.statusCode == 500){initialnum=''; return 1;}
  else{
    initialnum='';
    return 1;
    // If th
//     String emptjson = MedicalToJson(saveMedicalData);
//  print( emptjson);
//      return Medical.fromJson(json.decode(emptjson));//e server did not return a 200 OK response,
    // then throw an exception.
 //throw Exception('check network connecion');
  }

     }
///////////////////////////////
// /post
  
sendRequest( String data) async {
  
var url = 'http://192.168.43.246:8080/dLicence/api/license/v1/$savelicencdId/medicaldata';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
    //  print("Response body: ${response.body}");
    final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      } else {
         print(json.decode(res));
        // Map data=json.decode(res);
        // final userdata=UserClass.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
      //  _onSuccessResponse();
      }
    });

   
  }

 //////////////////////////////End medicalpage//////////////////////////////////////////
}
///////////////























////////////////////////////////


