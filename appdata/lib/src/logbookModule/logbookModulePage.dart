import 'model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
class LoogBookModule extends StatefulWidget {
  @override
  _LoogBookModuleState createState() => _LoogBookModuleState();
}

class _LoogBookModuleState extends State<LoogBookModule> {
 LoogBookModuleClass loogBookModule=new LoogBookModuleClass();
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 Future<int>futureModualclass;
 var initialVal,defaultval;
 var saveFormat = DateFormat('yyyy-MM-dd'); 
                      var showformmat = DateFormat("dd-MM-yyyy");
                       final dateFormat = DateFormat("dd-MM-yyyy");
  @override
  void initState() {
    super.initState();
  futureModualclass = getLicenceModuledata();
  }
 
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
      appBar: new AppBar(title: new Text('Licence'),),
      body: Center(
          child: FutureBuilder<int>(
            future: futureModualclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
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
  ),
 );
  }
  Widget formUI() {
       return  Column(
      children: <Widget>[
          
           _dateOfFlight(),
           _placeOfDeparture(),
           _placeOfArival(),
          //  _dateofIRtest(),
          //  _validuntil(),
            showdata()
        
         ]
     );
     
   }
  Widget _dateOfFlight() {
       return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of Flight  *',
            suffixIcon : Icon(Icons.calendar_today),
           // hintText: '$dateOfInitialIssue'
           ),
            format: dateFormat,
            initialValue:dateOfInitialIssue,//DateTime.parse(loogBookModule.dtIssue),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateOfInitialIssue = dt);
                        print('Selected date: $dateOfInitialIssue');},
            onSaved: (value) {loogBookModule.dtOfFlight= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
       );
  }
////////////////// 
Widget _placeOfDeparture()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' Place Of Departure * ',
      
      ),
      value:defaultval,
      // value: findval( loogBookModule.placeOfDeparture,1), //
       onChanged: (String newValue){loogBookModule.placeOfDeparture=newValue;
              //  loogBookModule.placeOfDeparture=loogBookModule.placeOfDeparture;
       },// => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => loogBookModule.placeOfDeparture = loogBookModule.placeOfDeparture,
        items: placesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
          //      onTap: () {
          //   print( item['id']);
          //   loogBookModule.placeOfDeparture = item['id'];
          // },
            );
          }).toList(),
    );
  }
///////////
Widget _placeOfArival()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' Place Of Arival * ',
      
      ),
      value:defaultval,
      // value: findval( loogBookModule.placeOfDeparture,1), //
       onChanged: (String newValue){loogBookModule.placeOfDeparture=newValue;
              //  loogBookModule.placeOfDeparture=loogBookModule.placeOfDeparture;
       },// => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => loogBookModule.placeOfDeparture = loogBookModule.placeOfDeparture,
        items: placesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
          //      onTap: () {
          //   print( item['id']);
          //   loogBookModule.placeOfDeparture = item['id'];
          // },
            );
          }).toList(),
    );
  }
///////////
  Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(  height: 39, width: 3, ),
      RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child: new Text('Reset'),
          ),
         SizedBox( width: 3, ),
      RaisedButton(
         color:Colors.indigo[400],
          onPressed: _validateInputs,
          child: new Text('Save'),
          )
      ]
     );
  }
  String licenceNumber(String value) {
  
  if(value == null)  return null;
  final n = num.tryParse(value);
  if(n == null)  return '"$value" is not a valid number';
  return null;
}
  void reset() {

   _formKey.currentState.reset();
}
  void _validateInputs() {
   
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    postdata( );
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}

 void postdata(){
   String jsons = loogBookModuleClassToJson(loogBookModule);
 print( jsons);
//  sendRequest( jsons) ;
 }



//////////Post////////////////////

sendRequest( String data) async {
 var url = 'http://$ipAddress:8080/dLicence/api/license/v1';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      // final forLicenceid = jsonDecode(response.body);
      //     forLicenceid(  forLicenceid['id']);
       
    });  
}


////////////
///get
//////////////////

    Future<int> getLicenceModuledata() async {
    //   var urlLicence='http://$ipAddress:8080/dLicence/api/license/v1/$uuid';
    //  print(urlLicence);
    //  final response = await http.get(urlLicence);
    //  print(response.statusCode);
    //  if (response.statusCode == 200) {
    //      print(json.decode(response.body));
    //     //  String api=response.body;
    //      loogBookModule =LoogBookModuleClass.fromJson(json.decode(response.body));
    //     // forLicenceid(loogBookModule.id);print(loogBookModule.id);
    //     //  _onSuccessResponse(api);
    //      return 1; }  
    //  else if  (response.statusCode == 500){initialVal='';return 1;}
    //  else{initialVal='';return 1;//throw Exception('check network connecion');
    //  }
    return 1;
    }




  ////////////End_LoogBookModuleState/////////////
}