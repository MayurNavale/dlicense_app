
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
 final _scaffoldKey = GlobalKey<ScaffoldState>();
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
  DateTime fouryear;
  DateTime sixear;
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
          key:_scaffoldKey ,
        appBar:  AppBar( title:  Text('    Language   '), ),
        body:SingleChildScrollView(child:
         FutureBuilder<int>(
            future: futurelogbookclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Container(
           padding: EdgeInsets.all(3),
            margin:  EdgeInsets.fromLTRB(10, 7, 10, 0),
            child:  Form(
              key: _formKey,
              autovalidate: _autoValidate,
             child:formUI(),
            ),
         );
      } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
       // By default, show a loading spinner.
        return Container(
          height: 400,
          alignment: Alignment.center,
          child:CircularProgressIndicator());
        },
      ),
       )
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
            initialValue:language.checkDate==null?null:DateTime.parse(language.checkDate),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            // validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState((){ checkDate = dt;
                   fouryear= dt.add(Duration(days: 1460));
                   sixear= dt.add(Duration(days: 2190));print(sixear);});},
            onSaved: (value) {language.checkDate= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
    //
   }

//   ///////////////////////
  
  Widget _certificateNo() {
   return    TextFormField(
          initialValue: language.certificateNumber==null?'':language.certificateNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenseId,
          onSaved: (String val) {
            language.certificateNumber= int.parse(val);
          },
          onChanged: (String value){ language.certificateNumber= int.parse(value);},
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
        isDense: true,
              decoration: InputDecoration( labelText:'Lavels  ', hintText:'country Code',),
              value: findval(language.niveauLevelId, 2),
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
      return  Container(
        alignment: Alignment.centerLeft,  
            constraints: BoxConstraints.expand(height: 60.0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
  border: Border.all(
    color: Colors.black54,
  ),
  borderRadius: BorderRadius.circular(10.0),
),
       child:Text('Expiry Date :- $levelvaluedata',),);
      }
 Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(height:80,width:90),
      RaisedButton(
            color:Colors.pink,splashColor: Colors.pink[200],
            onPressed:reset,
            child:  Text('Reset'), ),
      SizedBox(width:6),
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
    shoe();
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
 ///////////////////////
leveldt(int a){
 setState(() {
 switch( a){
   case 1: levelvaluedata=levelvalue(1); break; 
   case 2: levelvaluedata=levelvalue(2);break; 
   case 3: levelvaluedata=levelvalue(3);break; 
   case 4: levelvaluedata=showformmat.format(fouryear).toString();break; 
   case 5:  levelvaluedata=showformmat.format( sixear).toString();break; 
   case 6: levelvaluedata= levelvalue(6); break; 
   default: { } break; 
  } 
    
 }); 
}
 String levelvalue(int a){
  a--; 
 return niveauleveldatalist[a]['level']; 
}

int val;
  String findval(int a, int casevalue) {
    if(casevalue==null)return defauldval;
    switch (casevalue) {
      case 1:{ val = a;val--;
            if(a==0)return defauldval;
            else return languagedatalist[val]['language'];
            } break;
      case 2: {
         val = a;val--;
          if(a==0)  return defauldval;
          else return niveauleveldatalist[val]['id'].toString();
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

shoe(){
  language.id=1;
 String json = jsonEncode(language);
 sendRequest( json);

}
  ////////////////////
/////get
/////////////////

Future<int> getlicencddata() async {
  var url='http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/languagedata';
  // print(url);      
  final response = await http.get(url, headers: {"Authorization":"$token"},);
 if (response.statusCode == 200) {
   print(response.statusCode);
      print(json.decode(response.body));
       language =LanguageClass.fromJson(json.decode(response.body));
       fordatecalcilation(language.checkDate);
         leveldt(language.niveauLevelId);
     return 1; 
     } else{
    //  else if  (response.statusCode == 500,){
       
       defaultValue=''; return 1;}
    // else {defaultValue=''; return 1;}
 }



void fordatecalcilation(String checkdata){
   checkDate= DateTime.parse(checkdata);
   fouryear= checkDate.add(Duration(days: 1460));
   sixear= checkDate.add(Duration(days: 2190));
 
   }
sendRequest( String data) async {
  ///////////////////////////////post////////////
var url = 'http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/languagedata';
    http.post(url,headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
     print("Response body: ${response.body}");
    // final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201 ) {
        onsucesses('Save successfully'); 
      } else {
         
// Find the Scaffold in the widget tree and use it to show a SnackBar.
// Scaffold.of(context).showSnackBar(snackBar);
        //  print(json.decode(res));
        // Map data=json.decode(res);
        //  language=LanguageClass.fromJson(data);
      
         } });

   
  }
  final snackBar = SnackBar(content: Text('Save Sucessefull'));
    
onsucesses(String val){
   _scaffoldKey.currentState.showSnackBar(
        SnackBar(elevation: 6.0,
  backgroundColor: Colors.blue,
  behavior: SnackBarBehavior.floating,
        content:  Text(val,
       textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: 
       FontWeight.bold),),
        duration: Duration(seconds: 3))
);

}


  /////////////////end///////////
     }  
  
































