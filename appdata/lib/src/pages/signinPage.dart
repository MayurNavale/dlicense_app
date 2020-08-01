
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
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: new Container(color: Colors.red, width: 48.0, height: 48.0), //Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      controller: null,
       validator: validateEmail,
            //    onSaved: (String val)  =>user.email=val.toString(),
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      controller: null,
       validator: validatepsw,
        onSaved: (String val) { },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: _onSuccessResponse,
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
    //  shoe(  user);
// 
         

//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
  // },

          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
final registerlable = FlatButton(
      child: Text(
        'Register',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: ()  { Navigator.push( context,
                          MaterialPageRoute(builder: (context) =>RegisterUser()));   },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body:new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:  Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerlable,
            forgotLabel
          ],
        ),
      ),),
    );
  }
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
  



//         final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//         bool _autoValidate = false;
//         var email = new TextEditingController(); 
//         Signinuser user = new Signinuser();
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//       appBar: new AppBar(title: new Text('Sign In'), ),
//       body: new SingleChildScrollView(
//           child: new Container(
//             margin: new EdgeInsets.all(15.0),
//             child: new Form(
//               key: _formKey,
//               autovalidate: _autoValidate,
//               child:  formUI(),     
//             ),
//           ),
//       ),
//      ),
//     );
//   }
//    Widget formUI() {
//        return Center(
//          child:Column( children:[
//             new TextFormField(
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: validateEmail,
//                 onSaved: (String val)  =>user.email=val.toString(),
//             ),
//             new TextFormField(
//                 decoration: const InputDecoration(labelText: 'Passward'),
//                 keyboardType: TextInputType.text,
//                 validator: validatepsw,
//                 onSaved: (String val)  =>user.password=val.toString()
//             ),
//            showdata(),
//           ]
//          ),
//        );
//     }
  
//   ///////////////
    
    
//   Widget showdata(){
//     return Row(children: <Widget>[
//          SizedBox(height: 100,width: 40,),
//         RaisedButton(
//           color:Colors.pink,
//           onPressed:  () { Navigator.push( context,
//                           MaterialPageRoute(builder: (context) =>RegisterUser()));   },
//           child: new Text('Register'), ),
//         SizedBox(width: 10,),
//         RaisedButton(
//           color:Colors.indigo[400],
//           onPressed: _onSuccessResponse,//_validateInputs,
//           child: new Text('Sign In'),
//         ),
//       ]
//     );
//   }
//   ////////////////////////////////////////
//   //validation
//   ////////////////////////////
//     String validatepsw(String value) {
//     if (value.length < 3)
//       return 'Name must be more than 2 charater';
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
  






//   /////////////////////////////////////////////////////////////////
//   // All function
// /////////////////////// 
      
       
  
 


// void _validateInputs() {
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//     shoe(  user);

//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
// }
  

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

