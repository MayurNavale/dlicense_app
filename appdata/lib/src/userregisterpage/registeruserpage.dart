import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/pages/signinPage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUser createState() =>  _RegisterUser();
}
class _RegisterUser extends State<RegisterUser> {
                                bool visibilityTag = false;
                                 var myFormat = DateFormat('yyyy-MM-dd');
                                  var myFormadme = DateFormat('dd-MM-yyyy');
                                final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                                bool _autoValidate = false;
                                String languageString;
                                var dtOfBirth = new TextEditingController();  
                                bool visibilityclass1 = false;
                                bool visibilityclass3=false;
                                UserClass saveUserData = new UserClass();
                                UserClass alreadySave = new UserClass();
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
                                                        datecontroller.text = myFormat.format(date);
                                                        a= myFormat.format(date);
                                                        }); }); 
                                }

                                                    String a;
                                                    bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:  Text(' Register for DLicence'),),
      body:  SingleChildScrollView(
          child:  Container(
            margin:  EdgeInsets.all(15.0),
            child:  Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:  formUI(),
            ),
          ),
        ),
      
    );
  }
   Widget formUI() {
    return  Column(
      children:[
          TextFormField(
           initialValue: saveUserData.firstName,
                decoration: const InputDecoration(labelText: ' First Name'),
                keyboardType: TextInputType.text,
               // validator: validateName,
                onSaved: (String val)  =>saveUserData.firstName=val, ),
         
         TextFormField(
          initialValue: saveUserData.email,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            //validator: validateEmail,
            onSaved: (String val)  =>saveUserData.email=val.toString(),),
         TextFormField(
          initialValue: saveUserData.telephoneNumber.toString(),
            decoration: const InputDecoration(labelText: 'Telephone'),
            keyboardType: TextInputType.phone,
           // validator: validateMobile,
            onSaved: (String val)  =>saveUserData.telephoneNumber=int.parse(val),),
        TextFormField(
         initialValue:saveUserData.password ,
            decoration: const InputDecoration(labelText: 'Password'),
           keyboardType: TextInputType.text,
          //      validator: validateName,
           // validator: validateMobile,
            onSaved: (String val)  =>saveUserData.password=val.toString(),),
       
       // visibilityTag ? _onDone():  Container(),
        showdata()
      ]
    );
  }
  //////////////////

  ///////////////
    
  Widget showdata(){
    return InkWell(onTap: _validateInputs, child:Container(color: CupertinoColors.systemBlue, padding:EdgeInsets.all(10) , height: 60 ,width:  MediaQuery.of(context).size.width, child:Center (child :Text('Register'),)));
    
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
    RegExp regex =  RegExp(pattern);
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
//       var d =  DateFormat.yMd().parseStrict(input);
//       return d;
//     } catch (e) {
//       return null;
//     }    
//   }
  
  /////////////////////////////////////////////////////////////////
  // All function
  /////////////////////////////////////////////////////////////////

void reset() {
 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );
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
  Role role= Role();
  role.name='ROLE_APPLICANT';
  saveUserData.roles=<Role>[role];
// alreadySave.passportPhoto='photo';
//   alreadySave.id= '123e4567-e89b-12d3-a456-426655440000';
  String json = userClassToJson(saveUserData);
  print( json);
  sendRequest(json);
}
sendRequest( String data) async {
var url = 'http://$ipAddress:8080/dLicence/public/signUpUser';
print(url);
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      UserClass foruuid =UserClass.fromJson(json.decode(response.body));
       var   uuidval =foruuid.id;
      ondone(uuidval);
       //_onSuccessResponse();
      
    });  
  }

  
 void ondone(var uuidvalue){
    uuid =uuidvalue;
      print(uuid);
      visibilityTag=true;
      setState(() {
        uuid=uuidvalue;
      });
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );
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
    var _status;
    var telephoneNumber;

 ////////////////////////////////////////////////////////////////////////
}
///////////////













