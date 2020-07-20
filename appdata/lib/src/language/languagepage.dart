
//import 'model.dart';
import 'modal.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:appdata/src/models/masterdata.dart';

DateTime _dateTime;
    String dt_irtest;
   
    var contries;
   
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//import 'dart:convert';





class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
  }
class _Licencepage extends State<Licencepage> {
  LanguagePost language=new LanguagePost();
  TextEditingController _datecontroller = new TextEditingController(); TextEditingController datecontroller = new TextEditingController();
  TextEditingController ba= new TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
 String languageString;
  String lavels;
   var expirydateofthiscertificate; var dateofthiscertificate;
  DateTime date;
String niveaulevel; 
  int nilevel;
  String levelvalueanswer="";
  String levelvaluedata="";
  var fourear;
  var sixear;
  final TextEditingController _controller = new TextEditingController();
  Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
   showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  datecontroller.text= a =date.toString();
                       fourear= date.add(Duration(days: 1460));
                     sixear= date.add(Duration(days: 2190));
  print(sixear);
  print(fourear);
                      //new DateFormat.yMMMMd().format(date);
                  });
                }); 
  }
    bool visibilityTag = false;

  void _changed(bool visibility) => setState(()=>visibilityTag = visibility);
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
        appBar: new AppBar(
          
          title: new Text('    Language'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:formUI(),
            ),
          ),
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
        Row(children: <Widget>[
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
        )
      ],
    );
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
  
   
   Widget _checkDate() {
   return TextField(
      controller: _controller,
      onTap : ()=> _selectDate(context,expirydateofthiscertificate,_controller),
 onSubmitted:(val) => language.checkDate= val.toString(),
//              // convertToDate(val),
  decoration: InputDecoration(
     suffixIcon : Icon(Icons.calendar_today),
 //   border: OutlineInputBorder(),
      labelText: 'Check Date',
     hintText: ' $expirydateofthiscertificate',
  ),
);}
  ///////////////////////
  
  Widget _certificateNo() {
   return    TextFormField(
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenseId,
          onSaved: (String val) {
            language.certificateNumber= int.parse(val);
          },
        );
  }
  
  
  //////////////////////////
    Widget _language() {
     return DropdownButtonFormField<String>(
        
      decoration: InputDecoration(
      labelText:'Language * ',
   hintText:'select language',
   
      ),
              value: languageString,
             
              onChanged: (val) =>
                  setState(() => language.supportedLanguageId = int.parse(val)),
              validator: (value) => value == null ? 'field required' : null,
              items: languagedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['language']),
              value: item['id'].toString(),
            );
          }).toList(),
            );
//       
}  
  
  //////////////////////
  
      Widget _lavels() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'Lavels  ',
      hintText:'country Code',
 ),
              value: lavels,
                  onChanged: (val) {
                    print(val);
                    leveldt(int.parse(val));
                  setState(() => language.niveauLevelId = int.parse(val));
                    _changed(true);
                  },
              validator: (value) => value == null ? 'field required' : null,
              items: niveauleveldatalist.map((item) {
                 return new DropdownMenuItem(
                 child: new Text(item['id'].toString()),
                 value: item['id'].toString(),
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
);
//       
} 
  
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
      levelvaluedata=fourear.toString();
      
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
  
  
  /////////////////end///////////
     }  
  





























