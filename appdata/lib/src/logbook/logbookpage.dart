

import 'dart:convert';
import 'modal.dart';

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/logbookModule/logbookModulePage.dart';

class LogBookPage extends StatefulWidget {
  var selected_entryId;
 LogBookPage( this.selected_entryId);
  @override
  State<StatefulWidget> createState(){return _LogBookPage( this.selected_entryId);}
  }
class _LogBookPage extends State<LogBookPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 var selected_entryid;
_LogBookPage( this.selected_entryid);
 bool _autoValidate = false;
 
final FocusNode _ageFocus = FocusNode();  
final FocusNode _heightFocus = FocusNode();  
final FocusNode _weightFocus = FocusNode();
 String languageString;
  var saveformmat = DateFormat("yyyy-MM-dd");
 LoogBookModuleClass logbookdata=new LoogBookModuleClass();
//  Logbook logbookdata= Logbook();
 String initialnumdata;
 final _scaffoldKey = GlobalKey<ScaffoldState>();
//    final totalLandingNight =  TextEditingController();
// totalLandingNight.addListener(() {logbookdata.totalLandingNight=totalLandingNight.text});
    bool visibilityTag = false;
  bool visibilityObs = false;


  Future<int> futurelogbookclass;
  @override
  void initState() {
    super.initState();
    if(selected_entryid!=null)
  futurelogbookclass = getlicencddata(selected_entryid);
 else futurelogbookclass= defaultvalue();
}
 String a;
 bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar:  AppBar(
          
          title:  Text('    Logbook   '),
        ),
         key:_scaffoldKey ,
        body: SafeArea(
          child:Center(
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
// var new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') }) = new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') });
  var totalTimeSinglePilotCtr=new TextEditingController();//text: '23:43');
    Widget _totalTimeSinglePilot() { 
      return TextFormField(
        // controller: totalTimeSinglePilotCtr,
        inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
          initialValue: logbookdata.sp==null?'':logbookdata.sp.toString(),
          decoration: const InputDecoration(
            labelText: 'Total time single pilot (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '
            ),
          keyboardType: TextInputType.phone,
       autovalidate: true,
       onChanged: (val){
         logbookdata.sp=val.toString();
         },
          textInputAction: TextInputAction.next,
        focusNode: _ageFocus,
        onFieldSubmitted: (term){
          _fieldFocusChange(context, _ageFocus, _heightFocus);
        },
          onSaved: (val) => logbookdata.sp=val,
        );
}
  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
}

  ///////////////////////////_totalTimeSinglePilot
  
      Widget _totalTimeMultiPilot () { 
      return TextFormField(
         initialValue:logbookdata.mp!=null?logbookdata.mp.toString():'',
         decoration: const InputDecoration(labelText: 'Total time multi pilot (HH:MM:SS ) *',
         hintText: 'HH:MM:SS '),
         inputFormatters: [new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
      // controller:totalTimeMultiPilot,
          validator: validNumber,
          keyboardType: TextInputType.phone,
          onSaved: (val) => logbookdata.mp=val,
        );
}
  
  ///////////////
    Widget _totalTimeFlights() { 
       return TextFormField(
          initialValue:logbookdata.totalTimeFlights!=null?logbookdata.totalTimeFlights.toString():'',
          decoration: const InputDecoration(labelText: 'Total time of flight (HH:MM:SS ) *'),
          keyboardType: TextInputType.phone,
          inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTimeFlights,
          validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFlights=val,
        );
}
  
  ///////////////
        Widget _totalTimeairborne() { 
      return TextFormField(
         initialValue:logbookdata.totalTimeairborne!=null?logbookdata.totalTimeairborne.toString():'',
          decoration: const InputDecoration(labelText: 'Total time airborne (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTimeairborne,
         //validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeairborne=val,
        );
}
  
  ///////////////
        Widget _totalLandingDay() { 
      return TextFormField(
         initialValue:logbookdata.landingDay!=null?logbookdata.landingDay.toString():'',
          decoration: const InputDecoration(labelText: 'Total landings day *',
            hintText: 'Total landings day'),
          keyboardType: TextInputType.phone,//inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalLandingDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.landingDay=int.parse(val),
        );
}
  ///////////////
Widget _totalLandingNight() { 
      return TextFormField(
        initialValue:logbookdata.totalTimeFlights!=null?logbookdata.landingNight.toString():"",
          decoration: const InputDecoration(labelText: 'Total Landing Night *',
            hintText: 'Total Landing Night'),
          keyboardType: TextInputType.phone,//inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       // controller:totalLandingNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.landingNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTakeoffDay() { 
      return TextFormField(
         initialValue:logbookdata.takeOffDay!=null?logbookdata.takeOffDay.toString():'',
          decoration: const InputDecoration(labelText: 'Total Take off Day *',
            hintText: 'Total Take off Day'),
          keyboardType: TextInputType.phone,//inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
         //controller:totalTakeoffDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.takeOffDay=int.parse(val),
        );
}
  /////////////  ///////////////
        Widget _totalTakeoffNight() { 
      return TextFormField(
         initialValue:logbookdata.takeOffNight!=null?logbookdata.takeOffNight.toString():'',
          decoration: const InputDecoration(labelText: 'Total Take off Night *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,//inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTakeoffNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.takeOffNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimePic() { 
      return TextFormField(
         initialValue:logbookdata.pic!=null?logbookdata.pic.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time Single PIC(HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       //  controller:totalTimePic,
         //validator: validNumber,
          onSaved: (val) => logbookdata.pic=val,
        );
}
    ///////////////
        Widget _totalTimeSolo() { 
      return TextFormField(
         initialValue:logbookdata.solo!=null?logbookdata.solo.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time SOLO (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
    //     controller:totalTimeSolo,
         //validator: validNumber,
          onSaved: (val) => logbookdata.solo=val,
        );
}
  ///////////////
        Widget  _totalTimeSpic(){ 
      return TextFormField(
         initialValue:logbookdata.spic!=null?logbookdata.spic.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time SPIC (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTimeSpic,
         //validator: validNumber,
          onSaved: (val) => logbookdata.spic=val,
        );
}
  
  ///////////////
        Widget  _totalTimePicus () { 
      return TextFormField(
         initialValue:logbookdata.picus!=null?logbookdata.picus.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time PICUS (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       //  controller:totalTimePicus,
         //validator: validNumber,
          onSaved: (val) => logbookdata.picus=val,
        );
}
  
  ///////////////
        Widget  _totalTimeCoPilot() { 
      return TextFormField(
         initialValue:logbookdata.copilot!=null?logbookdata.copilot.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time CO-PILOT(HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       //  controller:totalTimeCoPilot,
         //validator: validNumber,
          onSaved: (val) => logbookdata.copilot=val,
        );
}
  
  ///////////////
        Widget  _totalTimeDual() { 
      return TextFormField(
         initialValue:logbookdata.duall!=null?logbookdata.duall.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time DUAL(HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
      //   controller:totalTimeDual,
         //validator: validNumber,
          onSaved: (val) => logbookdata.duall=val,
        );
}
  
  ///////////////
        Widget _totalTimeFI() { 
      return TextFormField(
         initialValue:logbookdata.fl!=null?logbookdata.fl.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time FL (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTimeFI,
        //validator: validNumber,
          onSaved: (val) => logbookdata.fl=val,
        );
}
  
  ///////////////
        Widget  _totalTimeFE() { 
      return TextFormField(
         initialValue:logbookdata.fe!=null?logbookdata.fe.toString():'',
          decoration: const InputDecoration(labelText: ' Total Time FE (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
        // controller:totalTimeFE,
         //validator: validNumber,
          onSaved: (val) => logbookdata.fe=val,
        );
}

  ///////////////
        Widget  _totalTimeNight() { 
      return TextFormField(
         initialValue:logbookdata.night!=null?logbookdata.night.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time NIGHT (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       //controller:totalTimeNight,
         //validator: validNumber,
          onSaved: (val) => logbookdata.night=val,
        );
}
  ///////////////
        Widget _totalTimeIFR(){ 
      return TextFormField(
         initialValue:logbookdata.ifr!=null?logbookdata.ifr.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time IFR (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
         //controller:totalTimeIFR,
         //validator: validNumber,
          onSaved: (val) => logbookdata.ifr=val,
        );
}
  ///////////////
        Widget  _totalTimeFSTD() { 
      return TextFormField(
         initialValue:logbookdata.totalTimeFstd!=null?logbookdata.totalTimeFstd.toString():'',
          decoration: const InputDecoration(labelText: 'Total Time FSTD (HH:MM:SS ) *',
            hintText: 'HH:MM:SS '),
          keyboardType: TextInputType.phone,inputFormatters: [ new MaskTextInputFormatter(mask: '## : ## : ##', filter: { "#": RegExp(r'[0-9]') })],
       //  controller:totalTimeFSTD,
         //validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFstd=val,
        );
}
  
  /////////
  
  /////////////
  
  ///////////////
  
    
  Widget showdata(){
    return Row(children: <Widget>[
          SizedBox(height:100,width:20),
      RaisedButton(
          color:Colors.pink,
          onPressed:shoe,//reset,
          child:  Text('Reset'),
          ),
     SizedBox(width:10),
    RaisedButton(
       color:Colors.indigo[400],
          onPressed: _validateInputs,
          child:  Text('Save'),)
    ]
  );
}
  ////////////////////////////////////////
  //validation
  ////////////////////////////
  
  String  validNumber(String value) {
  if(value == null) 
  return 'Field Required';
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
// logbookdata.id=1;
logbookdata.dtOfFlight=saveformmat.format(DateTime.now());
// Logbookdemo a=new Logbookdemo();
// a.id=1;
logbookdata.userId=uuid;
 String json = jsonEncode(logbookdata);
 print( json);
sendRequest(json);
}
////////////////////
/////get
/////////////////

Future<int> defaultvalue()async{ return 1;}

Future<int> getlicencddata(var id) async {
  final response = await http.get('http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$id/logBookEntryData',
   headers: {"Authorization":"$token"},);
  if (response.statusCode == 200||response.statusCode == 201) {
      print(json.decode(response.body));
      logbookdata =LoogBookModuleClass .fromJson(json.decode(response.body));
  return 1; } 
  else if  (response.statusCode == 500){initialnumdata=''; return 1;}
  else{ initialnumdata=''; return 1;}
// return 1;
     }
///////////////////////////////
///post
 
sendRequest( String data) async {  
var url = 'http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$uuid';print(url);
    http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) 
       onsucesses('Save successfully');       
       else  onsucesses('Check Network Connection');
          }
     );
  }

  onsucesses(String val){
   _scaffoldKey.currentState.showSnackBar(
        SnackBar(elevation: 6.0,
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating, content:
        Text(val, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: 
        FontWeight.bold),),
        duration: Duration(seconds: 2))
   );
 }
 ////////////////////////////////////////////////////////////////////////
}
/////////////