


import 'package:appdata/src/licencePage/endorsementDetailsPage.dart';
import 'package:appdata/src/licencePage/examinardetailpage.dart';
import 'package:appdata/src/licencePage/instructorpage.dart';
import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class Licencepagehome extends StatefulWidget {
  @override
  _LicencepagehomeState createState() => _LicencepagehomeState();
}

class _LicencepagehomeState extends State<Licencepagehome> {
 
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                      bool _autoValidate = false;
                      var saveFormat = DateFormat('yyyy-MM-dd'); 
                      var showformmat = DateFormat('dd-MM-yyyy');
                       final dateFormat = DateFormat("dd-MM-yyyy");
                      String languageString;
                      Licenceclass saveLicenseData= new Licenceclass();
                      Licenceclass apiLicencddata=new Licenceclass.fromJson(jsonstring);
                      LicenseDetail licenseDetail=new LicenseDetail(); 
                      //final TextEditingController _controller = new TextEditingController();
                     // Licenceclass apiLicencddata=new Licenceclass(); UserClass userdata = UserClass.fromJson(jsonstring);
                      
                     // Personneldata personal=new Personneldata();
                      final dtirtest = new TextEditingController();
                      final dtissue = new TextEditingController();  
                      final dtratingtest = new TextEditingController(); 
                      final dtvalidity = new TextEditingController();    
                      String a;
                      bool checkboxValue=false;
                      String licencenumber='';
                     //  Future<Licenceclass>futureLicenceclass;
                      // Future<Album> futureAlbum;
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

//   @override
//   void initState() {
//     super.initState();
//   //futureLicenceclass = getlicencddata();
//  print(apiLicencddata.licenseNumber);
//   }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text('    Licence'), ),
      body: SingleChildScrollView(
           child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:formUI(),
            ),
          ),
        ) ,
  //       Center(
  //         child: FutureBuilder<Licenceclass>(
  //           future: futureLicenceclass,
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
  ),
 );
 }


 /////////////////
   Widget formUI() {
       return  Column(
      children: <Widget>[
          _contries(), 
           _licenceCodeOptions(),
           _licenceNumber(),
           _dateOfInitialIssue(),
           _countryCodes(),
           _dateofratingtest(),
           _dateofIRtest(),
           _validuntil(),
           _examinerscertificatenumber(),
         //  _classOptions(),
           _tpyeOptionData(),
           _ir(),
           _co_Pilot(),
           _additionalDetails(),
           FlatButton(
             color: Colors.grey[300],
              child: Text('Instructor'),
              onPressed: () async {
              String instructorjson = await Navigator.push( context, MaterialPageRoute( builder: (context) =>Instructorpage(), ), );
                print(instructorjson); if (instructorjson != null) {
                instructordatafrompage = jsonDecode(instructorjson) as List; }
                print(instructordatafrompage);
                 }),
         FlatButton(
              color: Colors.grey[300],
              child: Text('Examiner'),
              onPressed: () async {
              String a = await Navigator.push( context, MaterialPageRoute( builder: (context) =>ExaminarPage(), ), );
                print(a); },  ), 
        FlatButton(
              color: Colors.grey[300],
              child: Text('Endorsement'),
              onPressed: () async {
              String a = await Navigator.push( context, MaterialPageRoute( builder: (context) =>EndorsementPage(), ), );
                print(a); },  ),
           showdata()
        
         ]
     );
     
   }
  
   Widget _contries()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' Nationality * ',
      
      ),
      value: contries=findval( apiLicencddata.countryId,1), //
      onChanged: (String newValue) => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => apiLicencddata.countryId = apiLicencddata.countryId,
      items: countriesdatalist.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['countryCode']),
          value: item['countryCode'].toString(),
          onTap: () {
            apiLicencddata.countryId = item['id'];
          },
        );
      }).toList(),
    );
  }
  // 
  ///////////////
   Widget _licenceCodeOptions() { 
       return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' LicenceCode * ',
      
      ),
      value: licenceCodeOptions=findval( apiLicencddata.codeId,2), //
      onChanged: (String newValue) => setState(() => licenceCodeOptions = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => apiLicencddata.codeId = apiLicencddata.codeId,
       items: licensecodesdatalist.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['code']),
          value: item['code'].toString(),
          onTap: () {
            print( item['id']);
            apiLicencddata.codeId = item['id'];
          },
        );
      }).toList(),
    );
  }
    
  ///////////////////
      Widget _licenceNumber() { 
      return TextFormField(
          initialValue:apiLicencddata.licenseNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  apiLicencddata.licenseNumber=int.parse(val),
        );
}
  
  /////////////
    Widget _dateOfInitialIssue() {
       return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of initial issue  *',
            suffixIcon : Icon(Icons.calendar_today),
            hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:DateTime.parse(apiLicencddata.dtIssue),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateOfInitialIssue = dt);
                        print('Selected date: $dateOfInitialIssue');},
            onSaved: (value) {apiLicencddata.dtIssue= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
  //   
  //      return TextFormField(
  //       initialValue:userdata.dateOfBirth,
  //   //  controller: dtOfBirth,
       
  //     onTap : ()=>_selectDate(context,userdata.dateOfBirth,dateOfInitialIssue),
  // onSaved:(val) => saveUserData.dateOfBirth= val.toString(),
  //     decoration: InputDecoration(
  //        suffixIcon : Icon(Icons.calendar_today),
  //        //   border: OutlineInputBorder(),
  //      labelText:'  Select Date of initial issue*',
  //     hintText: ' $dateOfInitialIssue',
  //     ),
  //   );
//      return   new Row(children: <Widget>[
//           new Expanded(
//               child: new TextFormField(
//             decoration: new InputDecoration(
//                hintText: ' :',
//  labelText: 'Date of initial issue :',
//             ),
//             controller: dtissue,
//             keyboardType: TextInputType.datetime,
//             // validator: (val) =>
//             //  isValidDob(val) ? null : 'Not a valid date',
//             onSaved: (val) =>apiLicencddata.dtIssue =dateOfInitialIssue.toString(),
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
//                     ).then((date) {
//                   setState(() {
//                     dateOfInitialIssue= myFormat.format(date);
//                   dtissue.text = myFormadme.format(date); 
//           //new DateFormat.yMMMMd().format(date);
//                   });
//                 }); 
//             }),
//           )
//         ]);
  }

 ////////////////
 /// 
 ///  
 Widget _countryCodes() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Country Codes   ',
         hintText:'country Code',
       ),
              value: countryCodes=findval( apiLicencddata.countryId,3),
              onChanged: (String newValue) =>setState(() => countryCodes = newValue),
              validator: (value) => value == null ? 'field required' : null,
         //  onSaved: (val) =>  apiLicencddata.codeId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryName']),
              value: item['countryName'].toString(),
              
            );
          }).toList(),
        );}
  //////////////////////
   Widget _dateofratingtest () {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:DateTime.parse(apiLicencddata.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateofratingtest = dt);
                        print('Selected date: $dateofratingtest');},
            onSaved: (value) {apiLicencddata.dtRatingtest= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
   
  }
  
  ////////////////
   Widget _dateofIRtest () {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:DateTime.parse(apiLicencddata.dtIrtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateofIRtest = dt);
                        print('Selected date: $dateofIRtest');},
            onSaved: (value) {apiLicencddata.dtIrtest= saveFormat.format(dateofIRtest);value.toString();
              debugPrint(value.toString());},
      );
    
  }
  //////////////////
   Widget _validuntil  () {
     return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Valid upto',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:DateTime.parse(apiLicencddata.dtValidity),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => validuntil = dt);
                        print('Selected date: $dateofratingtest');},
            onSaved: (value) {apiLicencddata.dtValidity= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
    //
  }
  
  /////////////////////
     Widget _examinerscertificatenumber() { 
      return TextFormField(
        initialValue:apiLicencddata.examinerNumber.toString(),// licencenumber.toString(),
           decoration: InputDecoration(  hintText: 'Enter Licence number',
           labelText: 'Examiners certificate number '),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  apiLicencddata.examinerNumber=int.parse(val),
        );
}
  
//   ///////////////
  
    // Widget _classOptions() { 
    //   return DropdownButtonFormField<String>(
    //   decoration: InputDecoration(
    //    labelText:'Class  * ',
    //      hintText:'class Name',
    //    ),
    //           value: classOptions=findval( licenseDetail.classId,4),
    //           onChanged: (String newValue) =>setState(() => classOptions = newValue),
    //           validator: (value) => value == null ? 'field required' : null,
    //    onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
    //           items: licenseclassdatalist.map((item) {
    //         return new DropdownMenuItem(
    //           child: new Text(item['className']),
    //           value: item['id'].toString(),
    //            onTap: () {
    //               print( item['id']);
    //               licenseDetail.classId = item['id'];
    //            },
    //         );
    //       }).toList(),
    //     );}
  
///////////////////////////
    Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Type * ',
      hintText:'Select Type',
       ),
              value: tpyeOptionData,
              onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
              validator: (value) => value == null ? 'field required' : null,
             onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
              items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['id'].toString(),
            );
          }).toList(),
        );
        }
  
 
//  /////////
  Widget _ir(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('IR'),
               controlAffinity: ListTileControlAffinity.leading,
              value: ir,
              onChanged: (bool value) { 
                setState(() =>ir= value);
                licenseDetail.ir=ir;
              },  
        
             
            );
  }
//  /////////
 Widget _co_Pilot(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Co_Pilot'),
               controlAffinity: ListTileControlAffinity.leading,
              value: co_Pilot,
              onChanged: (bool value) { 
               //
                
                setState(() =>co_Pilot= value);
                licenseDetail.copilot=ir;
              },  
        
             
            );
  }
  //////////////
  ///
  Widget _additionalDetails(){
 return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:10.0),
            ExpansionTile(
              title: Text( "Additional Detail", style: TextStyle( fontWeight: FontWeight.bold ),
              ),
              children: <Widget>[
                DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Class  * ',
         hintText:'class Name',
       ),
              value: classOptions,//=findval( licenseDetail.classId,4),
              onChanged: (String newValue) =>setState(() => classOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
              items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['className'].toString(),
               onTap: () {
                  print( item['id']);
                  licenseDetail.classId = item['id'];
               },
            );
          }).toList(),
        ),
  DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Type * ',
      hintText:'Select Type',
       ),
              value: tpyeOptionData,
              onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
              validator: (value) => value == null ? 'field required' : null,
             onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
              items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['id'].toString(),
            );
          }).toList(),
        ),
   CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('IR'),
               controlAffinity: ListTileControlAffinity.leading,
              value: ir,
              onChanged: (bool value) { 
                setState(() =>ir= value);
                licenseDetail.ir=ir;  },  ),
   CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Co_Pilot'),
               controlAffinity: ListTileControlAffinity.leading,
              value: co_Pilot,
              onChanged: (bool value) { 
                setState(() =>co_Pilot= value);
                licenseDetail.copilot=ir; },   ),
              ],
            ),
          ],
        ),
      
    );
  
  }
  /////////////////
  
  
  Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(  height: 39, width: 3, ),
      RaisedButton(
              color:Colors.pink,
              onPressed:(){},//,
              child: new Text('get'),
              ),
      SizedBox( width: 3, ),
      RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child: new Text('Reset'),
          ),
         SizedBox( width: 3, ),
      RaisedButton(
         color:Colors.indigo[400],
          onPressed: _validateInputs,
          child: new Text('Save'),
          )
      ]
     );
  }
  
  ////////////////////////////////////////
  //validation
  ////////////////////////////
String licenceNumber(String value) {
  if(value == null)  return null;
  final n = num.tryParse(value);
  if(n == null)  return '"$value" is not a valid number';
  return null;
}
  
 bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
}


  DateTime convertToDate(String input) {
    try 
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }
  
  /////////////////////////////////////////////////////////////////
   void reset() {

   _formKey.currentState.reset();
}
  void _validateInputs() {
   
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    postdata( );
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}

 
  //   Future<Licenceclass> getlicencddata() async {
  // final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/226');

  // if (response.statusCode == 200) {
  //     print(json.decode(response.body));
  //      apiLicencddata =Licenceclass.fromJson(json.decode(response.body));
  //      //_onSuccessResponse();
  //    return Licenceclass.fromJson(json.decode(response.body));
    
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }

  // }
    // Response response = await Dio().get("http://192.168.43.246:8080/dLicence/api/license/v1/193");
   
    //   String res = response.data;
    //    int statusCode = response.statusCode;

    //   if (statusCode < 200 || statusCode > 400 || json == null) {
    //   //  _onFailureResponse(new Exception("Error while fetching data"));
    //   } else { }
    //     print(json.decode(res));
    //     //String data=json.decode(res);
    //     apiLicencddata=LicenceclassFromJson(res);
    //     //
    //   // apiLicencddata=Licenceclass.fromJson(data);
    //     // Licenceclass userdataofclass=Licenceclass.fromJson(data);
    //     print(Licenceclass);
    //       setState(() {
    //  print(apiLicencddata.licenseNumber);
    //   licencenumber=apiLicencddata.licenseNumber.toString();
    // }); 




    void   _onSuccessResponse( ){
   //  levelvalue(apiLicencddata.countryId,1);
    // levelvalue(apiLicencddata.codeId,2);
     print(apiLicencddata.examinerId);
      print(apiLicencddata.countryId);
     print(contries);
     //contries=countriesdatalist[apiLicencddata.countryId]['countryCode'];
      licencenumber=apiLicencddata.licenseNumber.toString();
    //  licencenumber=apiLicencddata.
     // licencenumber=apiLicencddata.licenseNumber.toString();
    }
     
  String findval(int a, int casevalue) {
    switch (casevalue) {
      case 1:
        {
      
          int val = a;
          val--;
          for (int dat = 0; dat <= countriesdatalist.length; dat++) {
            if (dat == val) {
              print(countriesdatalist[dat]['countryCode']);
             return countriesdatalist[dat]['countryCode'];
            }
          }
        }

        break;

      case 2:
        {
          int val = a;
          val--;
          for (int dat = 0; dat <= licensecodesdatalist.length; dat++) {
            if (dat == val) {
              print(licensecodesdatalist[dat]['code']);
             return licensecodesdatalist[dat]['code'];
            }
          }
          //  iions= countriesdatalist[dat]['code'];
        }
        break;

        //  levelvaluedata=levelvalue(2);

        
      case 3:
        {
          int val = a;
          val--;
          for (int dat = 0; dat <= countriesdatalist.length; dat++) {
            if (dat == val) {
              print(countriesdatalist[dat]['countryName']);
             return countriesdatalist[dat]['countryName'];
            }
          } // levelvaluedata=levelvalue(3);
        }
        break;
      case 4:
        {
           int val = a;
          val--;
          for (int dat = 0; dat <= licenseclassdatalist.length; dat++) {
            if (dat == val) {
              print(licenseclassdatalist[dat]['className']);
             return licenseclassdatalist[dat]['className'];
            }
          } 
          //  levelvaluedata=fourear.toString();

        }
        break;
      case 5:
        {
          //  levelvaluedata= sixear.toString();
        }
        break;
      case 6:
        {
          //  levelvaluedata= levelvalue(6);
        }
        break;

      default:
        {
         return null; //statements;
        }
        break;
    }
  }

   List<InstructorDetail> player = new List(10);
addinstructorr(int id ,String type,String remark){
 int x=0;

    player[x] = new InstructorDetail() ; // add this to your code
      // var fill = player[x];
       player[x].remark =remark;
  player[x].id =id;
   player[x].instructorTypeId =int.parse(type);
      
 saveLicenseData.instructorDetails.add(player[x]);
  x++;
}

void postdata(){
       saveLicenseData.instructorDetails = <InstructorDetail>[];
    int dat;
    
  int count=instructordatafrompage.length;print(count);

  for(dat=0;dat<count;dat++){ 
              String f= instructordatafrompage[dat]['examinerTypeId'];
              String r= instructordatafrompage[dat]['remark'];
              int b= instructordatafrompage[dat]['id'];
              print(b); print(r); print(f);
            addinstructorr(b,f,r);
    }
 //saveLicenseData.personnel = <Personneldata>[personal];
 saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String jsons = licenceclassToJson(saveLicenseData);
 print( jsons);
 //sendRequest( jsons) ;

  
}

sendRequest( String data) async {

 

    var url = 'http://192.168.43.246:8080/dLicence/api/license/v1';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });  
  }








///////////////////////////
//end
//////////////////
}