import 'package:appdata/src/models/masterdata.dart';
import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUser createState() => new _RegisterUser();
}
class _RegisterUser extends State<RegisterUser> {

                                 var myFormat = DateFormat('yyyy-MM-dd');
                                  var myFormadme = DateFormat('dd-MM-yyyy');
                                final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                                bool _autoValidate = false;
                                String languageString;
                                var dtOfBirth = new TextEditingController();  
                                bool visibilityclass1 = false;
                                bool visibilityclass3=false;
                                UserClass saveUserData = new UserClass();
                                DateTime date;
                                String niveaulevel=''; 
                                int nilevel;
                                String levelvalueanswer;
                                String fromjsondata;
                                final TextEditingController _controller = new TextEditingController();
                                Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
                                    showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2200)
                                                  ).then((date) {
                                                        setState(() {
                                                        datecontroller.text = myFormadme.format(date);
                                                        a= myFormat.format(date);
                                                        }); }); 
                                }

                                                    String a;
                                                    bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text(' Register for DLicence'),),
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
         new TextFormField(
                decoration: const InputDecoration(labelText: ' First Name'),
                keyboardType: TextInputType.text,
                validator: validateName,
                onSaved: (String val)  =>saveUserData.firstName=val, ),
         new TextFormField(
                decoration: const InputDecoration(labelText: '  Last Name'),
                keyboardType: TextInputType.text,
                validator: validateName,
                onSaved: (String val)  =>saveUserData.lastName=val,),
        _nationality(),
        _placeOfBirth(),
        _dateOfBirth(),
        new TextFormField(
            decoration: const InputDecoration(labelText: ' Address '),
            keyboardType: TextInputType.text,
            validator: (value) => value == null ? 'field required' : null,
            onSaved: (String val)  =>saveUserData.address=val.toString(),
        ),
        _postalcode(),
        _city(),
        new TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String val)  =>saveUserData.email=val.toString(),),
        new TextFormField(
            decoration: const InputDecoration(labelText: 'Telephone'),
            keyboardType: TextInputType.phone,
            validator: validateMobile,
            onSaved: (String val)  =>saveUserData.telephoneNumber=int.parse(val),),
        showdata()
      ]
    );
  }
  //////////////////

Widget _nationality() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Nationality * ',
      hintText:'Select Nationality',
       ),
              value: nationality,
              onChanged: (String newValue) =>setState(() => nationality = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveUserData.nationality=val,
              items: countriesalreadlist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
//   //////////////////////
Widget _placeOfBirth() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'Place Of Birth * ',
      hintText:'Select Place Of Birth',
       ),
              value: placeOfBirth,
              onChanged: (String newValue) =>setState(() => placeOfBirth = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveUserData.placeOfBirth=val,
              items: countriesalreadlist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
//   //////////////////////
  //   //////////////////////
    Widget _postalcode() {
           return DropdownButtonFormField<String>(
      decoration: InputDecoration(
    labelText:'Postal Code * ',
      hintText:'Select Postal Code',
       ),
              value: postalcode,
              onChanged: (String newValue) =>setState(() => postalcode = newValue),
              validator: (value) => value == null ? 'field required' : null,
          //     onSaved: (val) =>  saveUserData..limitationId=int.parse(val),
              items: countriesalreadlist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryPhone'].toString()),
              value: item['id'].toString(),
            );
          }).toList(),
        );}

     
    //   //////////////////////
    Widget _city() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' City * ',
      hintText:'Select City',
       ),
              value: city,
              onChanged: (String newValue) =>setState(() => city = newValue),
              validator: (value) => value == null ? 'field required' : null,
          // onSaved: (val) =>  saveUserData..=val,
              items: countriesalreadlist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['countryCode'].toString(),
            );
          }).toList(),
        );
     }  
     ////////////////////
  Widget _dateOfBirth() {
      return TextFormField(
        controller:dtOfBirth,
        onTap : ()=>_selectDate(context,dateOfBirth,dtOfBirth),
        onSaved:(val) => saveUserData.dateOfBirth= dateOfBirth.toString(),
        decoration: InputDecoration(
            suffixIcon : Icon(Icons.calendar_today),
            labelText:' Date of Birth *',
           // hintText: ' $dateOfBirth',
        ),
      );
 }
  ///////////////
    
  Widget showdata(){
    return Row(children: <Widget>[
          SizedBox( width: 40,height: 100,),
          RaisedButton(
                color:Colors.pink,
                onPressed:reset,
                child: new Text('Reset'),
           ),
          SizedBox( width: 10,),
          RaisedButton(
                color:Colors.indigo[400],
                onPressed: _validateInputs,
                child: new Text('Register'),
          ),
      ]
  );
}

  ////////////////////////////////////////
  //validation
  ////////////////////////////
String validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    else return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)return 'Mobile Number must be of 10 digit';
    else return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  
String licenceNumber(String value) {
  if(value == null)  return null;
  final n = num.tryParse(value);
  if(n == null)  return '"$value" is not a valid number';
  return null;
}
  
bool isValidDob(String dat) {
    if (dat.isEmpty) return true;
     return false;
}




//   DateTime convertToDate(String input) {
//     try 
//     {
//       var d = new DateFormat.yMd().parseStrict(input);
//       return d;
//     } catch (e) {
//       return null;
//     }    
//   }
  
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
    showuserdata();
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
  

  ///////////////////
showuserdata(){
  saveUserData.id= '123e4567-e89b-12d3-a456-426655440000';
  String json = userClassToJson(saveUserData);
  print( json);
  sendRequest(json);
}
sendRequest( String data) async {
var url = 'http://192.168.43.246:8080/dLicence/api/signUpUser';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      
    });  
  }

  
  


  var city;
    var postalcode;
     var address;
    var dateOfBirth;
    var displayName;
    var email;
    var firstName;
    var id;
    var lastName;
    var nationality;
    var passportPhoto;
    var password;
    var placeOfBirth;
    var status;
    var telephoneNumber;

 ////////////////////////////////////////////////////////////////////////
}
///////////////














// import 'package:flutter/material.dart';
// //import 'package:flutter/material.dart';
// class RegisterUser extends StatefulWidget {
//   UserClass userdata = new UserClass();
//   RegisterUser(this.userdata);
//   @override
//   State<StatefulWidget> createState() { return _RegisterUserState(this.userdata);}
// }

// class _RegisterUserState extends State<RegisterUser> {


//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  bool _autoValidate = false;
//   var dtOfBirth = new TextEditingController();  
//   var email = new TextEditingController(); 
//   UserClass saveUserData = new UserClass();
//  UserClass userdata;
//  _RegisterUserState(this.userdata);
// // UserClass userdata= UserClass.fromJson(jsonstring);
//   DateTime date;
//   String niveaulevel=''; 
//   int nilevel;
//   String levelvalueanswer;
//   String fromjsondata;
// //  email=userdata.lastName.toString();
//   final TextEditingController _controller = new TextEditingController();
//   Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
//       showDatePicker(
//                      context: context,
//                      initialDate: DateTime.now(),
//                      firstDate: DateTime(1950),
//                      lastDate: DateTime(2200)
//                      ).then((date) {
//                      setState(() {
//                      datecontroller.text= a =date.toString();
//                       //new DateFormat.yMMMMd().format(date);
//                      }); }); 
//   }

//  String a;
//  bool checkboxValue=false;
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         debugShowCheckedModeBanner: false,
//       home: new Scaffold(
        
//         appBar: new AppBar(
          
//           title: new Text(' Register for DLicence'),
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
//          new TextFormField(
//            initialValue:userdata.firstName,
//           decoration: const InputDecoration(labelText: ' First Name'),
//           keyboardType: TextInputType.text,
//         //   controller: _quoteController,
//           validator: validateName,
//           onSaved: (String val)  =>saveUserData.firstName=val,
//           ),
//         new TextFormField(
//           initialValue:userdata.lastName,
//           decoration: const InputDecoration(labelText: '  Last Name'),
//           keyboardType: TextInputType.text,
//          //  controller: _authorController,
//           validator: validateName,
//           onSaved: (String val)  =>saveUserData.lastName=val,
//           ),
        
        
        
//           _nationality(),
//         _placeOfBirth(),
//         _dateOfBirth(),
        
        
        
//         new TextFormField(
//           initialValue:userdata.address,
//           decoration: const InputDecoration(labelText: ' Address '),
//           keyboardType: TextInputType.text,
//            validator: (value) => value == null ? 'field required' : null,
//           onSaved: (String val)  =>saveUserData.address=val.toString(),
//           ),
        
        
//          _postalcode(),
//         _city(),
       
        
//           new TextFormField(
//             initialValue:userdata.email,
//           decoration: const InputDecoration(labelText: 'Email'),
//           keyboardType: TextInputType.emailAddress,
           
//           validator: validateEmail,
//           onSaved: (String val)  =>saveUserData.email=val.toString(),
//         ),
//            new TextFormField(
//              initialValue:userdata.telephoneNumber.toString(),
//           decoration: const InputDecoration(labelText: 'Mobile Number'),
//           keyboardType: TextInputType.phone,
//           validator: validateMobile,
//           onSaved: (String val)  =>saveUserData.telephoneNumber=int.parse(val),
//         ),
         
// // //     
//         showdata()
        
        
        
   
//       ]
//      );
     
//    }
//   //////////////////
// //widget
// ///////////////////////
//    Widget _nationality() {
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:' Nationality * ',
//       hintText:'Select Nationality',
//        ),
//               value: nationality,
//               onChanged: (String newValue) =>setState(() => nationality = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//                onSaved: (val) =>  saveUserData.nationality=val,
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['countryCode'].toString(),
//             );
//           }).toList(),
//         );
//      }  
// //   //////////////////////
//     Widget _placeOfBirth() {
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:'Place Of Birth * ',
//       hintText:'Select Place Of Birth',
//        ),
//               value:placeOfBirth,
//               onChanged: (String newValue) =>setState(() => placeOfBirth = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//                onSaved: (val) =>  saveUserData.placeOfBirth=val,
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['countryCode'].toString(),
//             );
//           }).toList(),
//         );
//      }  
// //   //////////////////////
//   //   //////////////////////
//     Widget _postalcode() {
//            return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//     labelText:'Postal Code * ',
//       hintText:'Select Postal Code',
//        ),
//               value: postalcode,
//               onChanged: (String newValue) =>setState(() => postalcode = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//           //     onSaved: (val) =>  saveUserData..limitationId=int.parse(val),
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryPhone'].toString()),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         );}

     
//     //   //////////////////////
//     Widget _city() {
//       return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:' City * ',
//       hintText:'Select City',
//        ),
//               value: city,
//               onChanged: (String newValue) =>setState(() => city = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//           // onSaved: (val) =>  saveUserData..=val,
//               items: countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryCode']),
//               value: item['countryCode'].toString(),
//             );
//           }).toList(),
//         );
//      }  
// //   /////////////
//     Widget _dateOfBirth() {
//      return TextFormField(
//         initialValue:userdata.dateOfBirth,
//     //  controller: dtOfBirth,
       
//       onTap : ()=>_selectDate(context,userdata.dateOfBirth,dtOfBirth),
//   onSaved:(val) => saveUserData.dateOfBirth= val.toString(),
//       decoration: InputDecoration(
//          suffixIcon : Icon(Icons.calendar_today),
//          //   border: OutlineInputBorder(),
//        labelText:' Date of Birth *',
//       hintText: ' $dateOfBirth',
//       ),
//     );
//  }
// ///////////////
    
//   Widget showdata(){
//     return Row(children: <Widget>[
//       //     Expanded(
            
//       //         child: Container(
//       //        child:  RaisedButton(
//       //  color:Colors.pink,
//       //     onPressed:getmedicaldata,
//       //     child: new Text('load'),
//       //     ),
//       //           height: 100,
//       //         ),),
//      RaisedButton(
//        color:Colors.pink,
//           onPressed:reset,
//           child: new Text('Reset'),
//           ),
//          Container(
//                width: 10,
//                 ),
//   RaisedButton(
//        color:Colors.indigo[400],
//           onPressed: _validateInputs,
//           child: new Text('Save'),
         
//             ),
      
//             ]
//         );
//   }
//   ////////////////////////////////////////
//   //validation
//   ////////////////////////////
//     String validateName(String value) {
//     if (value.length < 3)
//       return 'Name must be more than 2 charater';
//     else
//       return null;
//   }

//   String validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//     if (value.length != 10)
//       return 'Mobile Number must be of 10 digit';
//     else
//       return null;
//   }

//   String validateEmail(String value) {
//     Pattern pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     if (!regex.hasMatch(value))
//       return 'Enter Valid Email';
//     else
//       return null;
//   }
  
//   String licenceNumber(String value) {

//   if(value == null) 
//     return null;
 
//   final n = num.tryParse(value);
//   if(n == null) 
//   return '"$value" is not a valid number';
 
//   return null;
// }
  
//    bool isValidDob(String dat) {
//     if (dat.isEmpty) return true;
//      return false;
// //  var d = convertToDate(dob);
//  // return d != null && d.isBefore(new DateTime.now());
// }




// //   DateTime convertToDate(String input) {
// //     try 
// //     {
// //       var d = new DateFormat.yMd().parseStrict(input);
// //       return d;
// //     } catch (e) {
// //       return null;
// //     }    
// //   }
  
//   /////////////////////////////////////////////////////////////////
//   // All function
//   /////////////////////////////////////////////////////////////////
//   // getmedicaldata(){
    
//   //    user = userClassFromJson(fromjsondata);
//   // //Map<String, dynamic> data = jsonDecode(fromjsondata);
//   // print(  user.firstName);

//   //   email.text=user.firstName;
//   //   placeOfBirth=user.nationality;
      
      
      
       
//   // }
//    void reset() {

//    _formKey.currentState.reset();
     
// }
//   void _validateInputs() {
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//     shoe(  saveUserData                 );

//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
// }
  

//   ///////////////////
//   shoe(
//  UserClass saveMedicalData){
//  String json = userClassToJson(saveMedicalData);
//    fromjsondata= json;
//  print( json);

   
// }
  

  
        
 

//   bool crewmember=false;
//   var city;
//     var postalcode;
//      var address;
//     var dateOfBirth;
//     var displayName;
//    // var email;
// //     var firstName;
// //     var id;
// //     var lastName;
//     var nationality;
//     var passportPhoto;
//     var password;
//     var placeOfBirth;
//     var status;
//     var telephoneNumber;

//  ////////////////////////////////////////////////////////////////////////
// }
// ///////////////
























