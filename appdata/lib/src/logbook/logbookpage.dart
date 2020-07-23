


import 'modal.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';


class LogBookPage extends StatefulWidget {
  @override
  _LogBookPage createState() => new _LogBookPage();
  }
class _LogBookPage extends State<LogBookPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool _autoValidate = false;
 String languageString;
  TextEditingController totalLandingDay = new TextEditingController();
    TextEditingController totalLandingNight = new TextEditingController();
   TextEditingController totalTakeoffDay = new TextEditingController();
    TextEditingController totalTakeoffNight = new TextEditingController();
    TextEditingController totalTimeCoPilot = new TextEditingController();
    TextEditingController totalTimeDual = new TextEditingController();
    TextEditingController totalTimeFE = new TextEditingController();
    TextEditingController totalTimeFI = new TextEditingController();
    TextEditingController totalTimeFSTD = new TextEditingController();
    TextEditingController totalTimeFlights = new TextEditingController();
    TextEditingController totalTimeIFR = new TextEditingController();
    TextEditingController totalTimeMultiPilot = new TextEditingController();
    TextEditingController totalTimeNight = new TextEditingController();
   TextEditingController totalTimePic = new TextEditingController();
   TextEditingController totalTimePicus = new TextEditingController();
   TextEditingController totalTimeSinglePilot = new TextEditingController();
   TextEditingController totalTimeairborne = new TextEditingController();
    TextEditingController totalTimeSolo = new TextEditingController();
   TextEditingController totalTimeSpic = new TextEditingController();


    bool visibilityTag = false;
  bool visibilityObs = false;
Logbook logbookdata=new Logbook();


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
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              
              autovalidate: _autoValidate,
              
        
            child:  formUI(),
     
            ),
         
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
          decoration: const InputDecoration(labelText: 'Total time single pilot *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeSinglePilot,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSinglePilot=int.parse(val),
        );
}
  

  ///////////////////////////_totalTimeSinglePilot
  
      Widget _totalTimeMultiPilot () { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total time multi pilot *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeMultiPilot,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeMultiPilot=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeFlights() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total time of flight *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeFlights,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFlights=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeairborne() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total time airborne *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeairborne,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeairborne=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalLandingDay() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total landings day *'),
          keyboardType: TextInputType.phone,
         controller:totalLandingDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalLandingDay=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalLandingNight() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Landing Night *'),
          keyboardType: TextInputType.phone,
         controller:totalLandingNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalLandingNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTakeoffDay() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Take off Day *'),
          keyboardType: TextInputType.phone,
         controller:totalTakeoffDay,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTakeoffDay=int.parse(val),
        );
}
  /////////////  ///////////////
        Widget _totalTakeoffNight() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Take off Night *'),
          keyboardType: TextInputType.phone,
         controller:totalTakeoffNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTakeoffNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimePic() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time Single PIC*'),
          keyboardType: TextInputType.phone,
         controller:totalTimePic,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimePic=int.parse(val),
        );
}
    ///////////////
        Widget _totalTimeSolo() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time SOLO *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeSolo,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSolo=int.parse(val),
        );
}
  ///////////////
        Widget  _totalTimeSpic(){ 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time SPIC *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeSpic,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeSpic=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimePicus () { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time PICUS *'),
          keyboardType: TextInputType.phone,
         controller:totalTimePicus,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimePicus=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeCoPilot() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time CO-PILOT *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeCoPilot,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeCoPilot=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeDual() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time DUAL *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeDual,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeDual=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeFI() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time FI *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeFI,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFi=int.parse(val),
        );
}
  
  ///////////////
        Widget  _totalTimeFE() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: ' Total Time FE *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeFE,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeFe=int.parse(val),
        );
}

  ///////////////
        Widget  _totalTimeNight() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time NIGHT *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeNight,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeNight=int.parse(val),
        );
}
  
  ///////////////
        Widget _totalTimeIFR(){ 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time IFR *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeIFR,
         validator: validNumber,
          onSaved: (val) => logbookdata.totalTimeIfr=int.parse(val),
        );
}
  
    
  ///////////////
        Widget  _totalTimeFSTD() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Total Time FSTD *'),
          keyboardType: TextInputType.phone,
         controller:totalTimeFSTD,
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
    shoe( logbookdata                 );

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
   
 ////////////////////////////////////////////////////////////////////////
}
///////////////



















