
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
  _LanguagePage createState() =>  _LanguagePage();
  }
class _LanguagePage extends State<LanguagePage> {
  LanguageClass language= LanguageClass();
 
  TextEditingController niveaulevelcontroller;
 // TextEditingController _datecontroller =  TextEditingController(); TextEditingController datecontroller =  TextEditingController();
  TextEditingController ba=  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String languageString;
  String defaultValue;
  String lavels;
  String niveaulevel; 
  // DateTime _dateTime;
    // String dt_irtest;
  String levelvalueanswer="";
  String levelvaluedata="";
  var expirydateofthiscertificate; 
  var dateofthiscertificate;
  var fouryear;
  var sixear;
  var defauldval;
  
  DateTime date;
  DateTime checkDate;
  int nilevel;
 var saveFormat = DateFormat('yyyy-MM-dd'); 
 var showformmat = DateFormat('dd-MM-yyyy');
 final dateFormat = DateFormat("dd-MM-yyyy");
 bool visibilityTag = false;
 Future<int> futurelogbookclass;
  @override
  void initState() {
    super.initState();
 futurelogbookclass = getlicencddata();
 //print(apiLicencddata.licenseNumber);
  }
 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar( title:  Text('    Language   '), ),
        body: Center(
          child: FutureBuilder<int>(
            future: futurelogbookclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child:  Container(
            margin:  EdgeInsets.all(15.0),
            child:  Form(
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
    );
  }
  Widget formUI() {
   return  Column(
      children: <Widget>[
        _certificateNo(),
        _checkDate(),
        _language(),
        _lavels(),
        _niveaulevel(),
       SizedBox(height:2),
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
                         print(fouryear);
                     sixear= dt.add(Duration(days: 2190));print(sixear);},
            onSaved: (value) {language.checkDate= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
    //
   }

//   ///////////////////////
  
  Widget _certificateNo() {
   return    TextFormField(
          initialValue:defaultValue?? language.certificateNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenseId,
          onSaved: (String val) {
            language.certificateNumber= int.parse(val);
          },
          onChanged: (String Value){ language.certificateNumber= int.parse(Value);},
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
            return  DropdownMenuItem(
              child:  Text(item['language']),
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
              decoration: InputDecoration( labelText:'Lavels  ', hintText:'country Code',),
              value: findval(language.niveauLevelId, 2).toString(),
              onChanged: (val) {
                    print(val);
                    leveldt( int.parse(val));
                    language.niveauLevelId =language.niveauLevelId; },
              validator: (value) => value == null ? 'field required' : null,
              items: niveauleveldatalist.map((item) {
                    return  DropdownMenuItem(
                    child:  Text(item['id'].toString()),
                    value: item['id'].toString(),
                    onTap: () { language.niveauLevelId = item['id']; },   ); }).toList(),
        );
     }  
  
      
 Widget _niveaulevel() {
      return  TextField(
         decoration: InputDecoration(
         border: OutlineInputBorder(),
        labelText: 'Expiry Date :- $levelvaluedata',),);
      }
 Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(height:100,width:10),
      RaisedButton(
            color:Colors.pink,splashColor: Colors.pink[200],
            onPressed:reset,
            child:  Text('Reset'), ),
      SizedBox(width:3),
      RaisedButton(
            color:Colors.indigo[400],splashColor: Colors.indigo[200],
            onPressed: _validateInputs,
            child:  Text('Save'),  )
            ]
        );
  }
////////////////////////////////////////////////////
// function
///////////////////////////////////////      

  


String licenseId(String value) {
  if(value == null) {return null;}
  final n = num.tryParse(value);
  if(n == null) { return '"$value" is not a valid number';}
  return null;
}


void reset() => _formKey.currentState.reset();

 
 
 
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
   case 1: levelvaluedata=levelvalue(1); break; 
   case 2: levelvaluedata=levelvalue(2);break; 
   case 3: levelvaluedata=levelvalue(3);break; 
   case 4: levelvaluedata=fouryear.toString();break; 
   case 5:  levelvaluedata= sixear.toString();break; 
   case 6: levelvaluedata= levelvalue(6); break; 
   default: { } break; 
  }  
}
 String levelvalue(int a){
  a--;
  for(int dat=0;dat<=niveauleveldatalist.length;dat++){
      if (dat==a){levelvalueanswer= niveauleveldatalist[dat]['level'];
      break; }} 
  return levelvalueanswer;  
}


  String findval(int a, int casevalue) {
    switch (casevalue) {
      case 1:{int val = a;val--;
            if(a==0){return defauldval;}else{
            for (int dat = 0; dat <= languagedatalist.length; dat++) {
              if (dat == val) {return languagedatalist[dat]['language'];
              }
            }
          }
        } break;
      case 2:
        {
          int val = a;val--;
          if(a==0){return defauldval;}else{
          for (int dat = 0; dat <= niveauleveldatalist.length; dat++) {
            if (dat == val) {
              String level= niveauleveldatalist[dat]['id'].toString();
             return level;
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
    return defauldval;
  }

shoe(
 LanguageClass postLanguagedata)
{
 String json = welcomeToJson(postLanguagedata);
 print( json);

}
  ////////////////////
/////get
/////////////////

Future<int> getlicencddata() async {
      
  final response = await http.get('http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/languagedata');

  if (response.statusCode == 200) {
      print(json.decode(response.body));
       language =LanguageClass.fromJson(json.decode(response.body));
       //_onSuccessResponse();
     return 1; } 
     else if  (response.statusCode == 500){defaultValue=''; return 1;}
    else throw Exception('check network connecion');
 }

void assign(String checkdata){
   checkDate= DateTime.parse(checkdata);}
sendRequest( String data) async {
  ///////////////////////////////post////////////
var url = 'http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/languagedata';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
    //  print("Response body: ${response.body}");
    // final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      } else {
        
// Find the Scaffold in the widget tree and use it to show a SnackBar.
Scaffold.of(context).showSnackBar(snackBar);
        //  print(json.decode(res));
        // Map data=json.decode(res);
        //  language=LanguageClass.fromJson(data);
      }
    });

   
  }
  final snackBar = SnackBar(content: Text('Save Sucessefull'));


  /////////////////end///////////
     }  
  





























