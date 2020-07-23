


import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
class Licencepagehome extends StatefulWidget {
  @override
  _LicencepagehomeState createState() => _LicencepagehomeState();
}

class _LicencepagehomeState extends State<Licencepagehome> {
 
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                      bool _autoValidate = false;
                      var myFormat = DateFormat('yyyy-MM-dd'); 
                      var myFormadme = DateFormat('dd-MM-yyyy');
                      String languageString;
                      //final TextEditingController _controller = new TextEditingController();
                     // Licenceclass apiLicencddata=new Licenceclass();
                       Licenceclass apiLicencddata=new Licenceclass();
                      LicenseDetail licenseDetail=new LicenseDetail(); 
                     // Personneldata personal=new Personneldata();
                      final dtirtest = new TextEditingController();
                      final dtissue = new TextEditingController();  
                      final dtratingtest = new TextEditingController(); 
                      final dtvalidity = new TextEditingController();    
                      String a;
                      bool checkboxValue=false;
                      String licencenumber='';
                       Future<Licenceclass>futureLicenceclass;
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

  @override
  void initState() {
    super.initState();
    futureLicenceclass = getlicencddata();
     print(apiLicencddata.licenseNumber);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text('    Language'), ),
      body: Center(
          child: FutureBuilder<Licenceclass>(
            future: futureLicenceclass,
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
           _classOptions(),
           _tpyeOptionData(),
           _ir(),
           _co_Pilot(),
           showdata()
        
         ]
     );
     
   }
  
   Widget _contries() {
    //  return DropdownButtonFormField<String>(
    //   decoration: InputDecoration(
    //   labelText:'State of issue * ',
    //    hintText:'Select State',
    //    ),
    //           value: contries.toString(),
    //           onChanged: (String newValue) =>setState(() => contries = newValue),
    //           validator: (value) => value == null ? 'field required' : null,
    //            onSaved: (val) =>  apiLicencddata.countryId=int.parse(val),
    //           items: countriesdatalist.map((item) {
    //         return new DropdownMenuItem(
    //           child: new Text(item['countryCode']),
    //           value: item['id'].toString(),
    //         );
    //       }).toList(),
    //     );
    //  }  
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'State of issue * ',
      hintText:'Select State',
       ),
              value: contries,
              onChanged: (String newValue) =>setState(() => contries = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  apiLicencddata.countryId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['id'].toString(),
            );
          }).toList(),
        );
     }  
  
  ///////////////
    Widget _licenceCodeOptions() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:'LicenceCode * ',
         hintText:'Select LicenceCode',
       ),
              value: licenceCodeOptions,
              onChanged: (String newValue) =>setState(() => licenceCodeOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) { apiLicencddata.codeId=int.parse(val);
              //  apiLicencddata.stateId=int.parse(val);
              //  apiLicencddata.titleId=int.parse(val);
              //  apiLicencddata.ratingCertId=val.toString();
               apiLicencddata.examinerId=int.parse(val);},
              items: licensecodesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['code']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  ///////////////////
      Widget _licenceNumber() { 
      return TextFormField(
          initialValue:licencenumber,
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  apiLicencddata.licenseNumber=int.parse(val),
        );
}
  
  /////////////
    Widget _dateOfInitialIssue() {
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
     return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
               hintText: ' :',
 labelText: 'Date of initial issue :',
            ),
            controller: dtissue,
            keyboardType: TextInputType.datetime,
            // validator: (val) =>
            //  isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>apiLicencddata.dtIssue =dateOfInitialIssue.toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
              showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                    ).then((date) {
                  setState(() {
                    dateOfInitialIssue= myFormat.format(date);
                  dtissue.text = myFormadme.format(date); 
          //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
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
              value: countryCodes,
              onChanged: (String newValue) =>setState(() => countryCodes = newValue),
              validator: (value) => value == null ? 'field required' : null,
           onSaved: (val) =>  apiLicencddata.codeId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryName']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  //////////////////////
   Widget _dateofratingtest () {
    return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                 hintText: ' Selectdate Of Rating Test ',
              labelText: 'Date of date Of Rating Test :',
            ),
         controller: dtratingtest,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>apiLicencddata.dtRatingtest=dateofratingtest.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
              showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtratingtest.text=   myFormadme.format(date);
                  dateofratingtest = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  
  ////////////////
   Widget _dateofIRtest () {
    return    Row(
      children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                      hintText: ' Select Date of IR Test ',
         labelText: 'Date of IR Test ',
            ),
         controller: dtirtest,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>apiLicencddata.dtIrtest=dateofIRtest.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
               showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtirtest.text=  myFormadme.format(date);
                  dateofIRtest = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  //////////////////
   Widget _validuntil  () {
    return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                hintText: ' Select Date',
         labelText: 'Valid upto ',
            ),
         controller: dtvalidity,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>apiLicencddata.dtValidity=validuntil.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
               showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtvalidity.text=  myFormadme.format(date); 
                  validuntil = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  
  /////////////////////
     Widget _examinerscertificatenumber() { 
      return TextFormField(
        initialValue: licencenumber.toString(),
           decoration: InputDecoration(  hintText: 'Enter Licence number',
           labelText: 'Examiners certificate number '),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  apiLicencddata.examinerNumber=int.parse(val),
        );
}
  
//   ///////////////
  
    Widget _classOptions() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Class  * ',
         hintText:'class Name',
       ),
              value: classOptions,
              onChanged: (String newValue) =>setState(() => classOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  licenseDetail.classId=int.parse(val),
              items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  
//   /////////////////////////
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
        );}
  
 
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
  
  
  
  
  
  
  Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(  height: 39, width: 3, ),
      RaisedButton(
              color:Colors.pink,
              onPressed:getlicencddata,
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
    postdata(  apiLicencddata,licenseDetail);
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}

 
    Future<Licenceclass> getlicencddata() async {
  final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/226');

  if (response.statusCode == 200) {
      print(json.decode(response.body));
       apiLicencddata =Licenceclass.fromJson(json.decode(response.body));
       //_onSuccessResponse();
     return Licenceclass.fromJson(json.decode(response.body));
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

  }
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
     levelvalue(apiLicencddata.countryId,1);
    // levelvalue(apiLicencddata.codeId,2);
     print(apiLicencddata.examinerId);
      print(apiLicencddata.countryId);
     print(contries);
     //contries=countriesdatalist[apiLicencddata.countryId]['countryCode'];
      licencenumber=apiLicencddata.licenseNumber.toString();
    //  licencenumber=apiLicencddata.
     // licencenumber=apiLicencddata.licenseNumber.toString();
    }
     
  
levelvalue(int a,int casevalue){
 switch( casevalue){
   case 1: { 
    //  levelvalueAns(a);
     print('a $a');
   int val= a;
      val--;
     for(int dat=0;dat<=countriesdatalist.length;dat++){
          if (dat==val){
          print(countriesdatalist[dat]['countryCode']);
        contries= countriesdatalist[dat]['countryCode'];
      
        break;
      }
  
} 
   }
      
  
   break; 
  
   case 2:{ 
    //  iions= countriesdatalist[dat]['code'];
      }
       break;
     
     
    //  levelvaluedata=levelvalue(2);
   
   break; 
      case 3:{ 
     // levelvaluedata=levelvalue(3);
   } 
   break; 
      case 4:{ 
    //  levelvaluedata=fourear.toString();
      
   } 
   break; 
      case 5:{ 
    //  levelvaluedata= sixear.toString();
   } 
   break; 
    case 6:{ 
    //  levelvaluedata= levelvalue(6);
   } 
   break; 
    
      
   default: { 
      //statements;  
   }
   break; 
}  
 }
//   levelvalueAns(int a){
//      print('a $a');
//    int val= a;
//       val--;
//      for(int dat=0;dat<=countriesdatalist.length;dat++){
//           if (dat==val){
//           print(countriesdatalist[dat]['countryCode']);
//         contries= countriesdatalist[dat]['countryCode'];
      
//         break;
//       }
  
// } 
// // return levelvalueanswer;
  
// }     
 



  








///////////////////////////
//end
//////////////////
}