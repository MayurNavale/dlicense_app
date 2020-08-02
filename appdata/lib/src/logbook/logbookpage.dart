

import 'dart:convert';
import 'modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
//import 'package:flutter/material.dart;
// import 'package:flutter_validate/flutter_validate.dart';

class LogBookPage extends StatefulWidget {
  @override
  _LogBookPage createState() => new _LogBookPage();
  }
class _LogBookPage extends State<LogBookPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool _autoValidate = false;
 String languageString;
 Logbook logbookdata=new Logbook();
 String initialnumdata;
//    final totalLandingNight = new TextEditingController();
// totalLandingNight.addListener(() {logbookdata.totalLandingNight=totalLandingNight.text});
    bool visibilityTag = false;
  bool visibilityObs = false;


  Future<int> futurelogbookclass;
  @override
  void initState() {
    super.initState();
  futurelogbookclass = getlicencddata();
 //print(apiLicencddata.licenseNumber);
  }
 String a;
 bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
        appBar: new AppBar(
          
          title: new Text('    Logbook   '),
        ),
        body: Center(
          child: FutureBuilder<int>(
            future: futurelogbookclass,
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
      children:[
          _totalTimeSinglePilot(),
          _totalTimeMultiPilot(),
          _totalTimeFlights(),
          _totalTimeairborne(),       
          _totalLandingDay(),
          _totalLandingNight(),
          _totalTakeoffDay(),
          _totalTakeoffNight(),
          _totalTimePic(),
          _totalTimeSolo(),
          _totalTimeSpic(),
          _totalTimePicus(),
          _totalTimeCoPilot(),
          _totalTimeDual(),
          _totalTimeFI(),
          _totalTimeFE(),
          _totalTimeNight(),
          _totalTimeIFR(),
          _totalTimeFSTD(),
          showdata()
        
        
        
   
      ]
     );
     
   }
  //////////////////
  
 /////////////////////
 
  //////////////////////
  
    Widget _totalTimeSinglePilot() { 
      return TextFormField(
          initialValue:initialnumdata??logbookdata.totalTimeSinglePilot.toString(),
          decoration: const InputDecoration(labelText: 'Total time single pilot *'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimeSinglePilot,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSinglePilot=int.parse(val),
        );
}
  

  ///////////////////////////_totalTimeSinglePilot
  
      Widget _totalTimeMultiPilot () { 
      return TextFormField(
        initialValue:initialnumdata??logbookdata.totalTimeMultiPilot.toString(),
        decoration: const InputDecoration(labelText: 'Total time multi pilot *'),
        keyboardType: TextInputType.phone,
        // controller:totalTimeMultiPilot,
         validator: validNumber,
         onSaved: (val) => logbookdata.totalTimeMultiPilot=int.parse(val),
        );
}
  
  ///////////////
    Widget _totalTimeFlights() { 
       return TextFormField(
        initialValue:initialnumdata??logbookdata.totalTimeFlights.toString(),
          decoration: const InputDecoration(labelText: 'Total time of flight *'),
          keyboardType: TextInputType.phone,
        // controller:totalTimeFlights,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFlights=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeairborne() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeairborne.toString(),
          decoration: const InputDecoration(labelText: 'Total time airborne *'),
          keyboardType: TextInputType.phone,
        // controller:totalTimeairborne,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeairborne=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalLandingDay() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalLandingDay.toString(),
          decoration: const InputDecoration(labelText: 'Total landings day *'),
          keyboardType: TextInputType.phone,
        // controller:totalLandingDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalLandingDay=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalLandingNight() { 
      return TextFormField(
        initialValue:initialnumdata??logbookdata.totalLandingNight.toString()??"",
          decoration: const InputDecoration(labelText: 'Total Landing Night *'),
          keyboardType: TextInputType.phone,
       // controller:totalLandingNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalLandingNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTakeoffDay() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTakeoffDay.toString(),
          decoration: const InputDecoration(labelText: 'Total Take off Day *'),
          keyboardType: TextInputType.phone,
         //controller:totalTakeoffDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTakeoffDay=int.parse(val),
        );
}
  /////////////  ///////////////
        Widget _totalTakeoffNight() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTakeoffNight.toString(),
          decoration: const InputDecoration(labelText: 'Total Take off Night *'),
          keyboardType: TextInputType.phone,
        // controller:totalTakeoffNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTakeoffNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimePic() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimePic.toString(),
          decoration: const InputDecoration(labelText: 'Total Time Single PIC*'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimePic,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimePic=int.parse(val),
        );
}
    ///////////////
        Widget _totalTimeSolo() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeSolo.toString(),
          decoration: const InputDecoration(labelText: 'Total Time SOLO *'),
          keyboardType: TextInputType.phone,
    //     controller:totalTimeSolo,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSolo=int.parse(val),
        );
}
  ///////////////
        Widget  _totalTimeSpic(){ 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeSpic.toString(),
          decoration: const InputDecoration(labelText: 'Total Time SPIC *'),
          keyboardType: TextInputType.phone,
        // controller:totalTimeSpic,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSpic=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimePicus () { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimePicus.toString(),
          decoration: const InputDecoration(labelText: 'Total Time PICUS *'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimePicus,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimePicus=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeCoPilot() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeCoPilot.toString(),
          decoration: const InputDecoration(labelText: 'Total Time CO-PILOT *'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimeCoPilot,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeCoPilot=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeDual() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeDual.toString(),
          decoration: const InputDecoration(labelText: 'Total Time DUAL *'),
          keyboardType: TextInputType.phone,
      //   controller:totalTimeDual,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeDual=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeFI() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeFi.toString(),
          decoration: const InputDecoration(labelText: 'Total Time FI *'),
          keyboardType: TextInputType.phone,
        // controller:totalTimeFI,
        validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFi=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeFE() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeFe.toString(),
          decoration: const InputDecoration(labelText: ' Total Time FE *'),
          keyboardType: TextInputType.phone,
        // controller:totalTimeFE,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFe=int.parse(val),
        );
}

  ///////////////
        Widget  _totalTimeNight() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeNight.toString(),
          decoration: const InputDecoration(labelText: 'Total Time NIGHT *'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimeNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeIFR(){ 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeIfr.toString(),
          decoration: const InputDecoration(labelText: 'Total Time IFR *'),
          keyboardType: TextInputType.phone,
         //controller:totalTimeIFR,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeIfr=int.parse(val),
        );
}
  
    
  ///////////////
        Widget  _totalTimeFSTD() { 
      return TextFormField(
         initialValue:initialnumdata??logbookdata.totalTimeFstd.toString(),
          decoration: const InputDecoration(labelText: 'Total Time FSTD *'),
          keyboardType: TextInputType.phone,
       //  controller:totalTimeFSTD,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFstd=int.parse(val),
        );
}
  
  /////////////
  
  ///////////////
  
    
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
  ////////////////////////////////////////
  //validation
  ////////////////////////////
  
  String  validNumber(String value) {

  if(value == null) 
    return null;
 
  final n = num.tryParse(value);
  if(n == null) 
  return '"$value" is not a valid number';
 
  return null;
}
  

  /////////////////////////////////////////////////////////////////
   void reset() {

   _formKey.currentState.reset();
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    shoe(                  );

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
   

shoe(){

 String json = logbookToJson(logbookdata);
 print( json);
sendRequest(json);
}
////////////////////
/////get
/////////////////

     Future<int> getlicencddata() async {
        // return 1;
  final response = await http.get('http://192.168.43.246:8080/dLicence/api/license/v1/{$savelicencdId/logBookdata');

  if (response.statusCode == 200) {
      print(json.decode(response.body));
       logbookdata =Logbook.fromJson(json.decode(response.body));
       //_onSuccessResponse();
     return 1; } 
  else if  (response.statusCode == 500){initialnumdata=''; return 1;}
  else{
    initialnumdata='';
    // If th
//     String emptjson = logbookToJson(logbookdata);
//  print( emptjson);
//      return Logbook.fromJson(json.decode(emptjson));//e server did not return a 200 OK response,
    // then throw an exception.
return 1;// throw Exception('check network connecion');
  }

     }
///////////////////////////////
// /post
  
sendRequest( String data) async {
  
var url = 'http://192.168.43.246:8080/dLicence/api/license/v1/$savelicencdId/logBookdata';
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
        // final userdata=UserClass.fromJson(data);
        // UserClass userdataofclass=UserClass.fromJson(data);
        // print(userdata.firstName);
        // _onSuccessResponse(userdataofclass);
      //  _onSuccessResponse();
      }
    });

   
  }
 ////////////////////////////////////////////////////////////////////////
}
/////////////