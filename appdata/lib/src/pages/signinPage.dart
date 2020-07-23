
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
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text('Sign In'), ),
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
       return Center(
         child:Column( children:[
            new TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                onSaved: (String val)  =>user.email=val.toString(),
            ),
            new TextFormField(
                decoration: const InputDecoration(labelText: 'Passward'),
                keyboardType: TextInputType.text,
                validator: validatepsw,
                onSaved: (String val)  =>user.password=val.toString()
            ),
           showdata(),
          ]
         ),
       );
    }
  
  ///////////////
    
    
  Widget showdata(){
    return Row(children: <Widget>[
         SizedBox(height: 100,width: 40,),
        RaisedButton(
          color:Colors.pink,
          onPressed:  () { Navigator.push( context,
                          MaterialPageRoute(builder: (context) =>RegisterUser()));   },
          child: new Text('Register'), ),
        SizedBox(width: 10,),
        RaisedButton(
          color:Colors.indigo[400],
          onPressed: _onSuccessResponse,//_validateInputs,
          child: new Text('Sign In'),
        ),
      ]
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
    shoe(  user);

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
  

  ///////////////////
  shoe(
 Signinuser saveUserData){
 String json = signinuserToJson(saveUserData);
 print( json);
   sendRequest(json);
}
  
sendRequest( String data) async {
  
var url = 'http://192.168.43.246:8080/dLicence/api/validateUser';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
      //  _onFailureResponse(new Exception("Error while fetching data"));
      } else {
        // print(json.decode(res));
        // Map data=json.decode(res);
        // final userdata=UserClass.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
        _onSuccessResponse();
      }
    });

   
  }
  
// _onSuccessResponse(UserClass userdataofclass){
//     Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => RegisterUser(userdataofclass)));
              
//   }
  
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
        this.email,
        this.password,
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

