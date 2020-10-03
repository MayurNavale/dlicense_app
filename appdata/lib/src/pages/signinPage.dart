import 'package:appdata/src/models/masterdata.dart';
import 'dart:convert';
import 'package:appdata/src/pages/home_page.dart';
import 'package:appdata/src/userregisterpage/registeruserpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:timezone/timezone.dart';
import 'package:flutter/services.dart';
class LogInPage extends StatefulWidget {
 @override
  _LogInPageState createState() => _LogInPageState();
}
class _LogInPageState extends State<LogInPage> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();
bool _passwordVisible=true, _autoValidate = false;
var email =  TextEditingController(); 
final _password=  TextEditingController(text:'password');
Signinuser user =  Signinuser();

Future tztime() async {
ByteData tzf = await rootBundle.load('assets/2020a_2015-2025.tzf');
initializeDatabase(tzf.buffer.asUint8List());
print(DateTime.now());
}
Future parsePropertiesJson() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/properties.json");
    final jsonResponse = jsonDecode(jsonString);
    ipaddress(jsonResponse['ipAddress']);}
    ipaddress(String ip){ipAddress=ip;setState(() =>ipAddress=ip);
}

  @override
  void initState() {
    super.initState();
   parsePropertiesJson();
    tztime();
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
    children: <Widget>[ 
       Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "airline.png",
                  width:  MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height,
                )),
               Scaffold(
                  backgroundColor:Colors.transparent,
                  key:_scaffoldKey ,
                  body: Builder(
                        builder: (context) => Center(
                        child:  Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child:  formUI(),     
                        ),
                      ),
                    ),
                  ),
                 ]
              );
            }
   Widget formUI() {
       return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only( left: 24.0, right: 24.0),
                children: <Widget>[
                Text('Welcome',textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 37),),
                SizedBox(height:40),
                TextFormField(
                   enableSuggestions: true,
                   initialValue:'',
                   decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Email',labelText:'Email' ,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        ),
                  keyboardType: TextInputType.emailAddress,
                  validator: validatePassword,
                  onSaved: (String val)  =>user.email=val.toString(),),
              SizedBox(height:16),
              TextFormField(
                autovalidate: _autoValidate,
                controller: _password,
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible? Icons.visibility : Icons.visibility_off,   color: Theme.of(context).primaryColorDark, ),
                    onPressed: () { setState(() { _passwordVisible = !_passwordVisible;  }); },
                    ),
                  ),
                keyboardType: TextInputType.text,
                validator: validatePassword,
                onSaved: (String val)  =>user.password=val.toString()
               ),
             inputButton(),
          ]  
     );
    }

  Widget inputButton(){
    return Column(
      children: <Widget>[
         // SizedBox(height: 4,width: 10,),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(46.0),
          child: MaterialButton(
            highlightColor: Colors.pink[400],
            animationDuration: Duration(milliseconds: 2000) ,
            visualDensity:VisualDensity.comfortable ,
            splashColor:Color.fromARGB(255, 21,236,229),
           child: Text('Sign In',textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 22),),
          minWidth:  MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: _validateInputs
          ))), 
            // SizedBox(height: 4,width: 10,),
       Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(46.0),
          child: MaterialButton(
            splashColor:Color.fromARGB(255, 21,236,229),
           child: Text('Sign Up',textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 22),),
          minWidth:  MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) =>RegisterUser()));   },
          ))),
        SizedBox(height: 4),
        InkWell(
          child: Text('Forget Password',textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue, fontSize: 20),),
          onTap:  () { Navigator.push( context, MaterialPageRoute(builder: (context) =>RegisterUser()));   },
          ),
        ]
    );
  }
 ////////////////////////////
    String validatePassword(String value) {
    if (value.length < 4)
      return 'Name must be more than 2 charater';
    else
      return null;
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
 
void _validateInputs() {
  if (_formKey.currentState.validate()) {
     _formKey.currentState.save();
     uplodeuserdetail();
    //  _onSuccessResponse();
     } 
    else {
      setState(() {
      _autoValidate = true;
    });
  }
}

  ///////////////////
uplodeuserdetail(){
 String json = signinuserToJson(user);
 print( json);
//  _onFatchingUserDetail();
 sendRequest(json);
}
  
sendRequest( String data) async {
    var url = 'http://$ipAddress:8080/dLicence/public/validateUser';
    print(url);
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
           final int statusCode = response.statusCode;
      if(statusCode==200) {
        print(response.body );
        authorizationLogin( response.body );
      }
       else if(statusCode == 404) 
      _onFailuar('invalid user');
      else if(statusCode < 200 || statusCode > 400 || json == null) 
      _onFailuar('check network connection');
      });
 } 
 void authorizationLogin(var json){
   var foruuidTokan= jsonDecode(json);
 uuid=foruuidTokan['id'].toString();
 token=foruuidTokan['token'].toString();
  List<dynamic>roles = foruuidTokan['roles'];
 print(roles);
   switch (roles[0]['name']) {
     case 'ROLE_APPLICANT':
          Navigator.of(context).pushReplacementNamed('/user');
       break;
       case 'ROLE_SCHOOL_ADMIN':
          Navigator.of(context).pushReplacementNamed('/schooladmin');
       break;
       case 'cvc':
       
       break;
       
     default:
   }
    
    print('uuid :-'+uuid.toString());
      print('token :-'+token.toString());
  }


_onFailuar(String val){
//    _scaffoldKey.currentState.showSnackBar(
//         SnackBar(elevation: 6.0,
//   backgroundColor: Colors.black54,
//   behavior: SnackBarBehavior.floating,
//         content:
//         Text(val,
//        textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 16.0, fontWeight: 
//        FontWeight.bold),),
//         duration: Duration(seconds: 2))
// );
 Navigator.of(context).pushReplacementNamed('/schooladmin');
}
 ////////////////////////////////////////////////////////////////////////
}

Signinuser signinuserFromJson(String str) => Signinuser.fromJson(json.decode(str));

String signinuserToJson(Signinuser data) => json.encode(data.toJson());

class Signinuser {
    Signinuser({
        this.email='mayurnavale97@gmail.com',
        this.password='pass',
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

