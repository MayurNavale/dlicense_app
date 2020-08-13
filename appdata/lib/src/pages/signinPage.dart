import 'package:appdata/src/models/masterdata.dart';
import 'dart:convert';
import 'package:appdata/src/pages/home_page.dart';
import 'package:appdata/src/userregisterpage/registeruserpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogInPage extends StatefulWidget {
 @override
  _LogInPageState createState() => _LogInPageState();
}
class _LogInPageState extends State<LogInPage> {

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
var email = new TextEditingController(); 
Signinuser user = new Signinuser();
Future parseJson() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/properties.json");
    final jsonResponse = jsonDecode(jsonString);
    ipaddress(  jsonResponse['ipAddress']);}
ipaddress(String ip){ipAddress=ip;setState(() =>ipAddress=ip);}

  @override
  void initState() {
    super.initState();
   parseJson();
  }




  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text('Sign In'), ),
      body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(10.0),
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
       return Column(children:[
           SizedBox(height:4),
            new TextFormField(
            //  style:TextDecoration.underline FontStyle.italic,// style:te FontStyle.italic,
              textAlign: TextAlign.center,
              initialValue: 'future1@gmail.com',
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                onSaved: (String val)  =>user.email=val.toString(),
            ),
            SizedBox(height:6),
            new TextFormField(
              textAlign: TextAlign.center,
              initialValue: '1234',
                decoration: const InputDecoration(labelText: 'Passward'),
                keyboardType: TextInputType.text,
                validator: validatepsw,
                onSaved: (String val)  =>user.password=val.toString()
            ),
           showdata(),
          ]
        );
    }
  
  ///////////////
    
    
  Widget showdata(){
    return Container(child:Column(children: <Widget>[
         SizedBox(height: 4,width: 10,),
       
      
        FlatButton(
          splashColor:Colors.deepPurple[200] ,
          color:Colors.deepPurple[700],
          onPressed: _validateInputs,//_validateInputs,
          child: new Text('Sign In'),),
          SizedBox(height: 4,width: 10,),
        InkWell(
          splashColor:Colors.grey[300] ,
          focusColor:Colors.grey[900],
          onTap:  () { Navigator.push( context, MaterialPageRoute(builder: (context) =>RegisterUser()));   },
          child: new Text('Register'), ),
        
      ]
    )
    );
  }
  ////////////////////////////////////////
  //validation
  ////////////////////////////
    String validatepsw(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
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
  






  /////////////////////////////////////////////////////////////////
  // All function
/////////////////////// 
      
       
  
 


void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    uplodeuserdetail();} 
    else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}

  ///////////////////
uplodeuserdetail(){
 String json = signinuserToJson(user);
 print( json);
 sendRequest(json);
}
  
sendRequest( String data) async {
    var url = 'http://$ipAddress:8080/dLicence/api/validateUser';
    print(url);
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
      new Exception("Check Network Connection");
      } else {
          final foruuid = jsonDecode(response.body);
          forSaveUUID(  foruuid['id']);
          _onSuccessResponse();
      }
    });

   
  }

  
 void forSaveUUID(var uuidvalue){
 uuid=uuidvalue.toString();
    print(uuid);
    
  }
  
_onSuccessResponse(){
  
    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>HomePage()));
              
  }
 ////////////////////////////////////////////////////////////////////////
}
///////////////







Signinuser signinuserFromJson(String str) => Signinuser.fromJson(json.decode(str));

String signinuserToJson(Signinuser data) => json.encode(data.toJson());

class Signinuser {
    Signinuser({
        this.email='future1@gmail.com',
        this.password='1234',
    });

    String email;
    String password;

    factory Signinuser.fromJson(Map<String, dynamic> json) => Signinuser(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}

