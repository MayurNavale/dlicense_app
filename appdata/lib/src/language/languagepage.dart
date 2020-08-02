
//import 'model.dart';
import 'modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:dlicence_codemagic/sr
import 'package:appdata/src/models/masterdata.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class LanguagePage extends StatefulWidget {
  @override
  _LanguagePage createState() => new _LanguagePage();
  }
class _LanguagePage extends State<LanguagePage> {
  LanguagePost language=new LanguagePost();
 // TextEditingController _datecontroller = new TextEditingController(); TextEditingController datecontroller = new TextEditingController();
  TextEditingController ba= new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String languageString;
  String initialnum='';
  String lavels;
  String niveaulevel; 
  // DateTime _dateTime;
    String dt_irtest;
  String levelvalueanswer="";
  String levelvaluedata="";
  var expirydateofthiscertificate; 
  var dateofthiscertificate;
  var fouryear;
  var sixear;
  var lang;
  
  DateTime date;
  DateTime checkDate;
  int nilevel;
 var saveFormat = DateFormat('yyyy-MM-dd'); 
 var showformmat = DateFormat('dd-MM-yyyy');
 final dateFormat = DateFormat("dd-MM-yyyy");
 final TextEditingController _controller = new TextEditingController();
 bool visibilityTag = false;
 Future<int> futurelogbookclass;
  @override
  void initState() {
    super.initState();
 // futurelogbookclass = getlicencddata();
 //print(apiLicencddata.licenseNumber);
  }
  void _changed(bool visibility) => setState(()=>visibilityTag = visibility);
   @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar( title: new Text('    Language   '), ),
        body: Center(
          // child: FutureBuilder<int>(
          //   future: futurelogbookclass,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return   SingleChildScrollView(
          //  child: new Container(
          //   margin: new EdgeInsets.all(15.0),
          //   child: new Form(
          //     key: _formKey,
          //     autovalidate: _autoValidate,
              child:formUI(),
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
      ),   
    );
  }
  Widget formUI() {
   return new Column(
      children: <Widget>[
       
        _certificateNo(),
        _checkDate(),
        _language(),
        _lavels(),
     
        visibilityTag ? _niveaulevel(): new Container(),
       showdata(),
           
      ],
    );
  }


   
   Widget _checkDate() {
        return DateTimeField(
            decoration: InputDecoration( labelText: 'Check Date',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:checkDate,//DateTime.parse(language.checkDate),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => checkDate = dt);
                        print('Selected date: $checkDate');
                         fouryear= dt.add(Duration(days: 1460));
                     sixear= dt.add(Duration(days: 2190));},
            onSaved: (value) {language.checkDate= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
    //
   }
//    return TextField(
//       controller: _controller,
//       onTap : ()=> _selectDate(context,expirydateofthiscertificate,_controller),
//  onSubmitted:(val) => language.checkDate= val.toString(),
// //              // convertToDate(val),
//   decoration: InputDecoration(
//      suffixIcon : Icon(Icons.calendar_today),
//  //   border: OutlineInputBorder(),
//       labelText: 'Check Date',
//      hintText: ' $expirydateofthiscertificate',
//   ),
// );}
//   ///////////////////////
  
  Widget _certificateNo() {
   return    TextFormField(
          initialValue:initialnum?? language.certificateNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenseId,
          onSaved: (String val) {
            language.certificateNumber= int.parse(val);
          },
          onChanged: (String newValue){ language.certificateNumber= int.parse(newValue);},
        );
  }
  
  
  //////////////////////////
    Widget _language() {
     return DropdownButtonFormField<String>(
        
      decoration: InputDecoration(
      labelText:'Language * ',
   hintText:'select language',
   
      ),
              value: findval(language.supportedLanguageId, 1),
             
              onChanged: (val) => language.supportedLanguageId =  language.supportedLanguageId,
              validator: (value) => value == null ? 'field required' : null,
              items: languagedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['language']),
              value: item['language'].toString(),
             onTap: () {
            print( item['id']);
            language.supportedLanguageId  = item['id'];
          },
            );
          }).toList(),
            );
//       
}  
  
  //////////////////////
  int nive ;
      Widget _lavels() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'Lavels  ',
      hintText:'country Code',
 ),
              value: findval(language.niveauLevelId, 2),
                  onChanged: (val) {
                    print(val);
                   // leveldt(language.niveauLevelId);
                  language.niveauLevelId =language.niveauLevelId;
                    _changed(true);
                  },
              validator: (value) => value == null ? 'field required' : null,
              items: niveauleveldatalist.map((item) {
                 return new DropdownMenuItem(
                 child: new Text(item['id'].toString()),
                 value: item['id'].toString(),
                  onTap: () {
    leveldt( item['id']);//ldatalist
            language.niveauLevelId = item['id'];
          },
                 );
              }).toList(),
        );
     }  
  
      

    Widget _niveaulevel() {
      return  TextField(
//obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Expiry Date :- $levelvaluedata',
        
  ),
);}
 Widget showdata(){
    return Row(children: <Widget>[
          Expanded(
              flex: 2,
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
         
            )
            ]
        );
  }
////////////////////////////////////////////////////
// function
///////////////////////////////////////      

  
    String levelvalue(int a){
      print('a $a');
 int bed= a;
      bed--;
for(int dat=0;dat<=niveauleveldatalist.length;dat++){
  
      if (dat==bed){
        print(niveauleveldatalist[dat]['level']);
  levelvalueanswer= niveauleveldatalist[dat]['level'];
        
        break;
      }
  
} 
return levelvalueanswer;
  
}

  
  String licenseId(String value) {

  if(value == null) {
    return null;
  }
  final n = num.tryParse(value);
  if(n == null) {
    return '"$value" is not a valid number';
  }
  return null;
}
void reset() {

   _formKey.currentState.reset();
}
 
 
 
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    shoe(language);
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
 ///////////////////////
  
leveldt(int a){
 switch( a){
   case 1: { 
    levelvaluedata=levelvalue(1);
      // statements; 
   } 
   break; 
  
   case 2:{ 
      levelvaluedata=levelvalue(2);
   } 
   break; 
      case 3:{ 
      levelvaluedata=levelvalue(3);
   } 
   break; 
      case 4:{ 
      levelvaluedata=fouryear.toString();
      
   } 
   break; 
      case 5:{ 
      levelvaluedata= sixear.toString();
   } 
   break; 
    case 6:{ 
      levelvaluedata= levelvalue(6);
   } 
   break; 
    
      
   default: { 
      //statements;  
   }
   break; 
}  
}
 
  String findval(int a, int casevalue) {
    switch (casevalue) {
      case 1:
        {
      
          int val = a;
          val--;
          if(a==0){return lang;}else{
          for (int dat = 0; dat <= languagedatalist.length; dat++) {
            if (dat == val) {
              print(languagedatalist[dat]['language']);
             return languagedatalist[dat]['language'];
            }
          }
        }
    }
        break;

      case 2:
        {
          int val = a;
          val--;
          if(a==0){return lang;}else{
          for (int dat = 0; dat <= niveauleveldatalist.length; dat++) {
            if (dat == val) {
              print(niveauleveldatalist[dat]['id']);
             return niveauleveldatalist[dat]['id'];
            }
          }
           } //  iions= countriesdatalist[dat]['code'];
        }
        break;

        //  levelvaluedata=levelvalue(2);

        
      case 3:
        {
          // int val = a;
          // val--;
          //  if(a==0){return contries;}else{
          // for (int dat = 0; dat <= languagedatalist.length; dat++) {
          //   if (dat == val) {
          //     print(languagedatalist[dat]['countryName']);
          //    return languagedatalist[dat]['countryName'];
          //   }}
          // } // levelvaluedata=levelvalue(3);
        }
    break;
      default:
        {
         return null; //statements;
        }
        break;
    }
    
  }

shoe(
 LanguagePost postLanguagedata)
{
 String json = welcomeToJson(postLanguagedata);
 print( json);

}
  ////////////////////
/////get
/////////////////

     Future<int> getlicencddata() async {
         return 1;
//   final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/$savelicencdId/languagedata');

//   if (response.statusCode == 200) {
//       print(json.decode(response.body));
//        language =LanguagePost.fromJson(json.decode(response.body));
//        //_onSuccessResponse();
//      return 1; } 
//   else if  (response.statusCode == 500){initialnum=''; return 1;}
//   else{
//     // If th
// //     String emptjson = logbookToJson(logbookdata);
// //  print( emptjson);
// //      return Logbook.fromJson(json.decode(emptjson));//e server did not return a 200 OK response,
//     // then throw an exception.
//  throw Exception('check network connecion');
//   }

     }
///////////////////////////////
// /post
  
sendRequest( String data) async {
  
var url = 'http://192.168.43.246:8080/dLicence/api/license/v1/$savelicencdId/languagedata';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
    //  print("Response body: ${response.body}");
    final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      } else {
         print(json.decode(res));
        Map data=json.decode(res);
         language=LanguagePost.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
      //  _onSuccessResponse();
      }
    });

   
  }
  
  /////////////////end///////////
     }  
  





























