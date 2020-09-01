import 'package:appdata/src/models/masterdata.dart';
import 'dart:convert';
import 'package:appdata/src/pages/home_page.dart';
import 'package:appdata/src/userregisterpage/registeruserpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:timezone/timezone.dart';

class LogInPage extends StatefulWidget {
 @override
  _LogInPageState createState() => _LogInPageState();
}
class _LogInPageState extends State<LogInPage> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();
bool _passwordVisible=true, _autoValidate = false;
var email =  TextEditingController(); 
final _password=  TextEditingController(text:'pass');
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
    return  Scaffold(
      // backgroundColor: ,
        key:_scaffoldKey ,
        body: Stack(
    children: <Widget>[ 
      //  Container(
      //    height: 400,
      //       decoration: new BoxDecoration(
      //           gradient: new LinearGradient(
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //             colors: [
      //               Color.fromARGB(255, 25,178,238),
      //               Color.fromARGB(255, 21,236,229),
      //               Colors.blue[300]
      //             ],
      //           )
      //         ),
      //       ),
       Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "airline.jpg",
                  width:  MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height,
                )),
  // ListView( children: <Widget>[
  //     SizedBox(height:90),
  //     Card(
  //      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0), ),
  //     child:Container(
  //     padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
  //     height: 400,child:   ListView(
  //               shrinkWrap: true,
  //               padding: EdgeInsets.only( left: 24.0, right: 24.0),
  //               children: <Widget>[
                   Builder(
                builder: (context) => Center(
                child:  Form(
                   key: _formKey,
                  autovalidate: _autoValidate,
                  child:  formUI(),     
                ),
              ),
             ),
          //   ]
          //  )
          // );
      //    )
      //   ]
      //  ),
      ]
    ),
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
                   initialValue:'mayurnavale97@gmail.com',
                   decoration: InputDecoration(
                     isDense: true,
                        hintText: 'Email',labelText:'Email' ,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
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
                // onEditingComplete: () { setState(() { _passwordVisible = false;  });} ,
                keyboardType: TextInputType.text,
                validator: validatepsw,
                onSaved: (String val)  =>user.password=val.toString()
               ),
             showdata(),
          ] 
     );
    }

  Widget showdata(){
    return Column(
      children: <Widget>[
         // SizedBox(height: 4,width: 10,),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(46.0),
          child: MaterialButton(
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
    String validatepsw(String value) {
    if (value.length < 3)
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
     uplodeuserdetail();} 
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
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      final int statusCode = response.statusCode;
      if(statusCode==200) {
          final foruuid = jsonDecode(response.body);
          forSaveUUID(  foruuid['id'],foruuid['token']);
          _onSuccessResponse();
      }
       else if(statusCode == 404) 
      _onFailuar('invalid user');
      else if(statusCode < 200 || statusCode > 400 || json == null) 
      _onFailuar('check network connection');
      });
 } 
 void forSaveUUID(var uuidvalue,var tokenval){
 uuid=uuidvalue.toString();
 token=tokenval.toString();
    print('uuid :-'+uuid.toString());
      print('token :-'+token.toString());
  }
_onSuccessResponse()=> 
Navigator.push( context, MaterialPageRoute(builder: (context) =>HomePage()));
                     

_onFailuar(String val){
   _scaffoldKey.currentState.showSnackBar(
        SnackBar(elevation: 6.0,
  backgroundColor: Colors.black54,
  behavior: SnackBarBehavior.floating,
        content:
        Text(val,
       textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 16.0, fontWeight: 
       FontWeight.bold),),
        duration: Duration(seconds: 2))
);

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

