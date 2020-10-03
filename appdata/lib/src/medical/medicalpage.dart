

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
final _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false,visibilityclass1 = false, visibilityclass3=false;
var initialnum='';
final saveFormat = DateFormat('yyyy-MM-dd'); 
final showformmat = DateFormat("dd-MM-yyyy");
final dateFormat = DateFormat("dd-MM-yyyy");
var dtAudiogram ,dtEcg , dtExam , dtExpPrevcert , dtExpiryC1 , dtExpiryC1sp , dtExpiryC2 , dtExpiryC3 ,
dtExpiryClapl , dtIssue ;
int tpyeOptionDatamed,medicalval;
Future<int> futuremedicalclass;
DateTime date;
String niveaulevel='',levelvalueanswer, fromjsondata,languageString;
int nilevel,showdt; 


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
    print(limitationdatalist);
  futuremedicalclass = getlicencddata();
 //print(apiLicencddata.licenseNumber);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key:_scaffoldKey ,
        appBar: new AppBar( title: new Text('    Medical'), ),
         body: Center(
          child: FutureBuilder<int>(
            future: futuremedicalclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:formUI(),
            ),
          ),
        );
      } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
       // By default, show a loading spinner.
        return CircularProgressIndicator();
        },
      ),
   ),
      //   body: new SingleChildScrollView(
      //     child: new Container(
      //       margin: new EdgeInsets.all(15.0),
      //       child: new Form(
      //         key: _formKey,
              
      //         autovalidate: _autoValidate,
              
        
      //       child:  formUI(),
     
      //       ),
      //     ),
      // ),
    );
  }
   Widget formUI() {
       return  Column(
      children:[
          _tpyeOptionData(),
          _contries(), 
         _licenceNumber(),
        //  _limit(),
          _limitations(),
         visibilityclass1 ? _dtExpiryC1sp() : new Container(),
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
    int w;
     Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:' Type  ',
      hintText:'Select Type',
       ),
              value:saveMedicalData.medicalType==null?null:saveMedicalData.medicalType.toString(),
              onChanged: (String newValue) {
            // _changed(tpyeOptionDatamed); 
            },
              validator: (value) => value == null ? 'field required' : null,
         onSaved: (val) =>  saveMedicalData.medicalType=val,
          items: medicaltpedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['type']),
              value: item['type'].toString(),
              onTap: () {
                  // saveMedicalData.medicalType=item['id'].toString();
                  _changed(item['id']);
               },
            );
          }).toList(),
          //     items: medicaltpedatalist.map((item) {
          //   return new DropdownMenuItem(
          //     child: new Text(item['type']),
          //     value: item['type'],
          //     onTap: (){ print( item['id']);
          //         saveMedicalData.medicalType= item['id'];}
          //   );
          // }).toList(),
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
        initialValue:  saveMedicalData.licenseNumber==null?'': saveMedicalData.licenseNumber.toString(),
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
              items: limtationHardcoded.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['limitation']),
              value: item['limitation'].toString(),
                 onTap: () {
                  print( item['id']);
                  setState(() {
                      saveMedicalData.limitationId= item['id'];
                  });
               },
            );
          }).toList(),
        );}

  /////////////
    Widget _dtExpiryC1sp(){
        return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration( labelText: 'Expiry date of Class 1(SP) *',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:saveMedicalData.dtExpiryC1sp==null?null:DateTime.parse(saveMedicalData.dtExpiryC1sp),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dtExpiryC1sp = dt);
                        print('Selected date: $dtExpiryC1sp');},
            onSaved: (value) { dtExpiryC1sp==null?saveMedicalData.dtExpiryC1sp='':saveMedicalData.dtExpiryC1sp= saveFormat.format(value);value.toString();
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
            initialValue:saveMedicalData.dtExpiryC1==null?null:DateTime.parse(saveMedicalData.dtExpiryC1),
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
            onSaved: (value) { dtExpiryC1==null?saveMedicalData.dtExpiryC1='':saveMedicalData.dtExpiryC1= saveFormat.format(value);value.toString();
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
            initialValue:saveMedicalData.dtExpiryC2==null?null:DateTime.parse(saveMedicalData.dtExpiryC2),
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
            onSaved: (value) {dtExpiryC2==null?saveMedicalData.dtExpiryC2= '':saveMedicalData.dtExpiryC2= saveFormat.format(value);
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
            initialValue:saveMedicalData.dtExpiryC3==null?null:DateTime.parse(saveMedicalData.dtExpiryC3),
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
            onSaved: (value) { dtExpiryC3==null?saveMedicalData.dtExpiryC3='':saveMedicalData.dtExpiryC3= saveFormat.format(value);value.toString();
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
            initialValue:saveMedicalData.dtExpiryClapl==null?null:DateTime.parse(saveMedicalData.dtExpiryClapl),
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
            onSaved: (value) { dtExpiryClapl==null?saveMedicalData.dtExpiryClapl='':saveMedicalData.dtExpiryClapl= saveFormat.format(value);value.toString();
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
            initialValue:saveMedicalData.dtExam==null?null:DateTime.parse(saveMedicalData.dtExam),
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
            initialValue:saveMedicalData.dtIssue==null?null:DateTime.parse(saveMedicalData.dtIssue),
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
            initialValue:saveMedicalData.dtExpPrevcert==null?null:DateTime.parse(saveMedicalData.dtExpPrevcert),
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
         initialValue:saveMedicalData.dtEcg==null?null:DateTime.parse(saveMedicalData.dtEcg),
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
            initialValue:saveMedicalData.dtAudiogram==null?null:DateTime.parse(saveMedicalData.dtAudiogram),
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
        initialValue: saveMedicalData.comments==null?'':saveMedicalData.comments,
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
  var dropdownDefaultVal;

  String findval(int a, int casevalue) {
    // if(casevalue==null)return dropdownDefaultVal;
    switch (casevalue) {
      case 1:
        {
       int val = a;
          val--;
          if(a==0){return dropdownDefaultVal;}
          else{ return medicaltpedatalist[val]['type']; }
        }
        break;

      case 2:
          {
      
          int val = a;
          val--;
          if(a==0){return dropdownDefaultVal;}else{
          for (int dat = 0; dat <= statedatalist.length; dat++) {
            if (dat == val) {
            //  print(countriesdatalist[dat]['countryCode']);
             return statedatalist[dat]['stateName'];
            }
          }
        }
    }
        break;
case 3:
        {if(val==null) return dropdownDefaultVal;
          else{
           val = a;
           print (val);
          return limtationHardcoded[val]['limitation'];
            }
         }
        break;
        case 4:
          {
      
          int val = a;
          val--;
          if(a==0){return dropdownDefaultVal;}else{
          for (int dat = 0; dat <= limtationHardcoded.length; dat++) {
            if (dat == val) {
            //  print(countriesdatalist[dat]['countryCode']);
             return limtationHardcoded[dat]['limitation'];
            }
          }
        }
    }
        break;
     
    }
    
  }
int val;
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
saveMedicalData.licenseId=1;
saveMedicalData.id=1;
 String json = jsonEncode(saveMedicalData);
  //  fromjsondata= json;
 print( json);
sendRequest(json);
}
  
   
  void _changed( int field) {
setState(() {
switch(field){
   case 1: { visibilityclass1=true;  visibilityclass3=false;}break;
   case 2:{ visibilityclass3=true;  visibilityclass1=false;}break;      
   default: {   visibilityclass1=false; visibilityclass3=false; } break; 
}
  
});
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
//        }+

Future<int> getlicencddata() async {
 final response = await http.get('http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/medicaldata', headers: {"Authorization":"$token"},);
 if (response.statusCode == 200) {
      print(json.decode(response.body)); print(response.statusCode);
       saveMedicalData =Medical.fromJson(json.decode(response.body));
       //_onSuccessResponse();
     return 1; } 
  else if  (response.statusCode == 500){initialnum=''; return 1;}
  else{
    initialnum='';
    return 1;

  }

     }
///////////////////////////////
// /post
sendRequest( String data) async {
              
String url = 'http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/medicaldata';
print(url);
    http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
     print("Response body: ${response.body}");
    final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      } else {
         onsucesses('Save successfully');
         print(json.decode(res));
        // Map data=json.decode(res);
        // saveMedicalData =Medical.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
      //  _onSuccessResponse();
      }
    });

   
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
 //////////////////////////////End medicalpage//////////////////////////////////////////
}
///////////////























////////////////////////////////


