import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:flutter/material.dart';
import 'package:appdata/src/models/masterdata.dart';
class RadiotelephonePage extends StatefulWidget {
  @override
  _RadiotelephonePage createState() =>  _RadiotelephonePage();
  }
    class _RadiotelephonePage extends State<RadiotelephonePage> {
    Radiotelephone radiotelephone= Radiotelephone();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autoValidate = false;
    var initialLicenceId;
    DateTime dtIssue;
    var saveFormat = DateFormat('yyyy-MM-dd'); 
    var showformmat = DateFormat("dd-MM-yyyy");
    final dateFormat = DateFormat("dd-MM-yyyy");
    Future<int> futuremedicalVal;

@override
void initState() {
super.initState();
futuremedicalVal = getMedicaldata();
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar( title:  Text('    Radiotelephone'), ),
        body: Center(
          child: FutureBuilder<int>(
            future: futuremedicalVal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    child:  Container(
                    margin:  EdgeInsets.all(15.0),
                    child:  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child:formUI(),  ),),
                ); } 
              else if (snapshot.hasError) { return Text("${snapshot.error}");  }
              return CircularProgressIndicator();
            },
          ),
        ),
    );
  }
Widget formUI() {
  return  Column(
    children: <Widget>[
     SizedBox(height:2),
          TextFormField(
          initialValue: initialLicenceId??radiotelephone.licenseId,
          decoration: const InputDecoration(labelText: 'license ID'),
          keyboardType: TextInputType.phone,
          validator: licenseId,
          onSaved: (String val) { radiotelephone.licenseId= int.parse(val); },  ),
          SizedBox(height:2),
             _dateOfInitialIssue(),
          Row(children: <Widget>[
                SizedBox(height:20,width:20),
                RaisedButton(
                  color:Colors.pink,
                  onPressed:reset,
                  child:  Text('Reset'), ),
              SizedBox(width: 10, ),
        RaisedButton(
                color:Colors.indigo[400],
                onPressed: _validateInputs,
                child:  Text('Save'),
              
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
void reset() =>_formKey.currentState.reset();

 
 
 
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    uplodeRadioTelephoneData();
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
   
   Widget _dateOfInitialIssue() {
   return  DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(   
               hintText: ' Select Date of  issue :',
               labelText: 'Date of issue :',
               suffixIcon : Icon(Icons.calendar_today),),
               format: dateFormat,
               initialValue:dtIssue,//DateTime.parse(saveLicenseData.dtRatingtest),
               onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
              validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
              onChanged: (dt) { setState(() => dtIssue = dt);
                        print('Selected date: $dtIssue');},
               onSaved: (value) {  radiotelephone.dtIssue= saveFormat.format(value);value.toString();  },  );
        
  }


uplodeRadioTelephoneData()
{String json = radiotelephoneToJson(radiotelephone);
uplode(json);
}



Future<int> getMedicaldata() async {
final response = await http.get('http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/radiotelephone');
 if (response.statusCode == 200) {
       print(json.decode(response.body));
       radiotelephone =Radiotelephone.fromJson(json.decode(response.body));
       assign(radiotelephone.dtIssue);
     return 1; } 
  else if  (response.statusCode == 500){initialLicenceId=''; return 1;}
  else{ return 1;
    //throw Exception('check network connecion');
   }
 }

void assign(var dateval)=>dtIssue= DateTime.parse(dateval);
///////////post//////////////////
           
uplode( String data) async {
  
var url = 'http://$ipAddress:8080/dLicence/api/license/v1/$savelicencdId/radiotelephone';
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
        // Map data=json.decode(res);
        // saveMedicalData =Medical.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
      //  _onSuccessResponse();
      }
    });

   
  }
///////////End///////////////
}

