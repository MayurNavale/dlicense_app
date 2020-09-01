//     final LoogBookModuleClass = LoogBookModuleClassFromJson(jsonString);
import 'logbookModulePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart';
import 'model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
import 'package:date_format/date_format.dart';
import 'package:timezone/standalone.dart' as tz;
LoogBookModuleClass loogBookModule=new LoogBookModuleClass();

class RowPage extends StatefulWidget {
  var selected_entryIid;
 RowPage( this.selected_entryIid);
  @override
  State<StatefulWidget> createState(){return _RowPage( this.selected_entryIid);}
  }
  
class _RowPage extends State<RowPage> {
  Future<int >futuregetlogbookIdvalue;
  var selected_entryIid;
_RowPage( this.selected_entryIid);

bool _autoValidate = false,readOnlytrue=false;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
var initialVal='',timeofDepart,initialtime='';
String defaultval,departZone,arrivalZone;
int landing=0,takeOff=0;
DateTime utc=DateTime.now().toUtc(),pickedDate;
var sizebox=SizedBox(height:2,child:Container(color: Colors.grey[400],));
var sizeboxblur=SizedBox(height:2,child:Container(color: Colors.blue[400],));
final dateFormatforcheck= DateFormat('dd-MM-yyyy'), 
saveFormat = DateFormat('yyyy-MM-dd'),savedateofflightFormat = DateFormat('yyyy-MM-dd HH:mm'), 
savetimeformmat = DateFormat("HH:mm"),
showformmat = DateFormat("dd-MM-yyyy HH:mm"),
dateFormat = DateFormat("dd-MM-yyyy HH:mm"),
formattime = DateFormat("dd-MM-yyyy HH:mm");
 DateTime utctolocal(DateTime val,String zone){
  var detroit = tz.getLocation(zone);
  DateTime detroitTime = tz.TZDateTime.from(val.toLocal(), detroit);
  return detroitTime;
 }
  localtoUtc(DateTime val,String zone){
  print(val);
  var detroit = tz.getLocation(zone);
  DateTime detroitTime = tz.TZDateTime.from(val, detroit);
  var value=detroitTime;
  print('arrivalZone' +value.toString());
 }
findLocationtime(String a, String location){
   var detroit = tz.getLocation(location);
  DateTime s= tz.TZDateTime.now(detroit);
  // DateTime s=now;
print('$a $s');
}
DateTime findLocationDatetime( String location){
   var detroit = tz.getLocation(location);
  DateTime s= tz.TZDateTime.now(detroit);
  return s;
}

clacuatetimeDiff(){

print("${timeOfArrivalInUTCfortimediff.difference(timeOfDepartureOutUTCfortimediff)}"); 
if(timeOfArrivalInUTCfortimediff!=null)
setState(() {
   initialtime=timeOfArrivalInUTCfortimediff.difference(timeOfDepartureOutUTCfortimediff).toString();
});
setState(() {});
print(initialtime);
}
DateTime dateOfInitial,firstdate=DateTime(1900), lastDate= DateTime(2100);
  @override
  void initState() {
    super.initState();
    boolseme=copilot=dual=fe=fl=ifr=mp=nameOfPic=night=pic=picus=solo=sp=spic=false;
    timeDepartureout=timeOfArrivalIn= timeOfArrivalInUTC= timeOfArrivalOn= timeOfArrivalOnUTC=timeOfDepartureOffUTC=timeOfDepartureOutUTC=  timeofDepartureOff=timeofDepartureOut=null;
    print('selected_entryIid $selected_entryIid');
if(selected_entryIid!=null)
futuregetlogbookIdvalue=getidloogbookdata(selected_entryIid);
else futuregetlogbookIdvalue= defaultvalue();
}
Future<int> defaultvalue()async{ return 1;}
 String languageString;
  final dtAudiogram = new TextEditingController();  
  final dtEcg = new TextEditingController(); 
  final dtArrivalIn = new TextEditingController();  
  final dtArrivalInUTC = new TextEditingController(); 
  final dtArrivalon = new TextEditingController();  
  final dtArrivalonUTC = new TextEditingController(); 
  final dtdepartureoff = new TextEditingController();  
  final dtdepartureoffUTC = new TextEditingController();
  final dtdepartureoutUTC = new TextEditingController();  
  final dtdepartureout = new TextEditingController(); 
  var timevalue;
  var nowtz;
 final TextEditingController _controller = new TextEditingController();
//  Medical saveMedicalData=new Medical();
 String a;
 bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        appBar: new AppBar(
          
          title: new Text(' Loogbook entry'),
        ),
        body: Center(
          child: FutureBuilder<int>(
            future: futuregetlogbookIdvalue,
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
      children:[
            
           _dateOfFlight(),
           sizebox,
           _placeOfDeparture(),
           sizebox,
           _placeOfArival(),
           sizebox,
           _makeModel(),
           sizebox,
           nameOfPIC(),
           sizebox,
          registrationofAircraft(),
          sizebox,
          seme(),
          sizeboxblur,
          _departureout(),
          _departureoutUTC(),
          sizebox,
         _departureoff(),
         _departureoffUtc(),
         sizeboxblur,
         _arrivaliOn(),
         _arrivalonUtc(),
         sizebox,
         _arrivalIn(),
         _arrivalInUtc(),
         sizeboxblur,
         _landing(),
         sizebox,
         _takeOff(),
         sizebox,
         _remark(),
          // _cardDepartureout(),
          // _cardDepartureoff(),
          // _cardArivalOn(),
          // _cardArivalIn(),
          _additionalDetails(),
      
        //  _licenceNumber(),
        
          
//       
        showdata() ]
     );
     
   }
  //////////////////
  
  //////////////////////
  Widget _dateOfFlight() {
       return DateTimeField(
         initialValue:selected_entryIid!=null? DateTime.parse(loogBookModule.dtOfFlight):null,
        //  controller: dtdepartureout,
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of Flight  *',
            suffixIcon : Icon(Icons.calendar_today),
           // hintText: '$dateOfInitialIssue'
           ),
            format: dateFormatforcheck,
            //:dateOfInitialIssue,//DateTime.parse(loogBookModule.dtdepartureout),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: firstdate,
                          initialDate:  DateTime.now(),
                          lastDate: lastDate);
                    },
            // validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateOfInitial = dt);
                        print('Selected date: $dateOfInitial');},
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
      // value:defaultval,
      value:selected_entryIid!=null? loogBookModule.placeOfDeparture:null,
       onChanged: (String newValue){loogBookModule.placeOfArrival=newValue;
              //  loogBookModule.placeOfDeparture=loogBookModule.placeOfDeparture;
       },// => setState(() => contries = newValue),
      // validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => loogBookModule.placeOfArrival = val,
        items: placesdatalistdemo.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
               onTap: () {
            print( item['id']);
            setState(() {
              departZone= item['placeCode'].toString();
            });

            // loogBookModule.placeOfDeparture = item['id'];
          },
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
       value:selected_entryIid!=null? loogBookModule.placeOfArrival:null,
      // value: findval( loogBookModule.placeOfDeparture,1), //
       onChanged: (String newValue){loogBookModule.placeOfDeparture=newValue;
              //  loogBookModule.placeOfDeparture=loogBookModule.placeOfDeparture;
       },// => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => loogBookModule.placeOfDeparture = val,
        items: placesdatalistdemo.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
               onTap: () {
            print( item['id']);
            setState(() {
               arrivalZone = item['placeCode'].toString();
            }); }, );
          }).toList(),
    );
  }
  ///////

Widget _makeModel()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: ' Make/Model * ', ),
      value:selected_entryIid!=null? loogBookModule.makemodel:null,
       onChanged: (String newValue){loogBookModule.makemodel=newValue.toString();},
      // validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => loogBookModule.makemodel = val,
        items: makemodeldatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['makeModelName'].toString()),
              value: item['makeModelName'].toString(),
               onTap: () {
            // print( item['id']);
            // arrivalZone = item['id'];
          }, );
          }).toList(),
    );
  }
  ////////////
Widget nameOfPIC(){
return Container(height:70,
                  child: Center(
          child:  Row(
          children: <Widget>[
          Expanded(flex:4,child:     Column(
                children: <Widget>[
                  Switch( value: readOnlytrue,
                      onChanged: (bool newValue) {
                        print(initialVal);
                         setState(() { 
                           readOnlytrue=newValue;}); }, ),
                  Text("Name of PIC"), ],),),
          Expanded(flex:6,child:TextFormField(
            enabled:readOnlytrue,
            initialValue:selected_entryIid!=null? loogBookModule.nameOfPic:'',
            //:  loogBookModule.nameOfPic,
            onSaved:(val) =>  loogBookModule.nameOfPic=val.toString(),
            decoration: const InputDecoration(labelText: 'Name Of PIC'),
            onChanged: (String newValue) =>initialVal=newValue,
         
         ) )]),),
       
      );
      }
///////////
// //   ///////////////////
  Widget registrationofAircraft() { 
  return  TextFormField(
  
    initialValue: selected_entryIid!=null? loogBookModule.registrationOfAircraft:'',
      decoration: const InputDecoration(labelText: 'Registration of aircraft:'),
      // keyboardType: TextInputType.phone,
      // validator: licenceNumber,
        onChanged: (String newValue) => loogBookModule.registrationOfAircraft=newValue,
      onSaved: (val) => loogBookModule.registrationOfAircraft=val,
    );
}
//////////////
Widget seme() { 
      return ListTile(
        leading: Switch(
           activeColor:Colors.blueAccent[400],
              value: selected_entryIid!=null? boolseme= loogBookModule.seMe=='true':boolseme,
            onChanged: (value) {
              setState(() {
                 boolseme=value;
              });
               loogBookModule.seMe=value.toString(); },),
        title: Text('SE/ME'),  // trailing: Icon(Icons.more_vert),
      );}
    
//   ////////////////////////
   Widget _departureout() {
    return    TextFormField(
                readOnly: true,
               decoration: new InputDecoration(
               suffixIcon : Icon(Icons.calendar_today),
                // hintText: 'Examination date',
              labelText: 'Time of Departure Out  *',
            ),
             controller: dtdepartureout,
            keyboardType: TextInputType.datetime,
             onSaved: (val) =>loogBookModule.timeOfDepartureOut=saveFormat.format(DateTime.parse(val)),//convertToDate(val).toString(),
            onTap:()async{ 
              // String zone = placesdatalistdemo[departZone]['placeCode'];
              print(departZone);
              setState(() {
                timeDepartureout=findLocationDatetime(departZone);
              });
               
           DateTime date=await showDatePicker(
                            context: context,
                            firstDate: DateTime(1960),
                            lastDate: DateTime(2100),
                            initialDate:timeDepartureout
                          );
                    if(date != null){
                  TimeOfDay timeval = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: timeDepartureout.hour,minute: timeDepartureout.minute) ,
                      // initialEntryMode: TimePickerEntryMode.input ,
                      initialEntryMode: TimePickerEntryMode.input ,
                      builder: (BuildContext context, Widget child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                      child: child,
                    ); }, );
                    if(timeval != null){
                     
                      pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
                 print(DateTime.now().timeZoneOffset);
                 Duration duration=pickedDate.timeZoneOffset;
                 DateTime result=pickedDate.add(Duration (minutes:duration.inMinutes));
                   result=result.toUtc();
              
                  // caldiff(pickedDate);
                  //  var diff= pickedDate.difference(timeDepartureout).inSeconds;
                      print('result $result');
                    //  DateTime zoneforutc =timeDepartureout.add(Duration (diff.inSeconds));
                        print(timeDepartureout.timeZoneName);
                        print(timeDepartureout.toUtc());
                     setState(() {
                       // var date = tz.TZDateTime(detroit, 2014, 11, 17,01,03,23);
                      dtdepartureoutUTC.text=pickedDate.toUtc().toString();
                       timeOfDepartureOutUTCfortimediff=pickedDate.toUtc();
                        dtdepartureout.text=pickedDate.toString();
                       
                        // print( dtdepartureout.text);
                      });
                      clacuatetimeDiff();
                       setState(() {}); }}
                  // validator: (val) =>
                  //  isValidDob(val) ? null : 'Not a valid date',
                 
             } );
  }
  caldiff(DateTime val){
  var diff= val.difference(timeDepartureout).inSeconds;
                      print('diff $diff');
  }
//   /////////////////////
       Widget _departureoutUTC() {
    return TextFormField(
            decoration: new InputDecoration(hintText: ' Select Date', labelText: ' Time of DepartureOut-UTC', ),
            readOnly :true,
            controller: dtdepartureoutUTC,
            keyboardType: TextInputType.datetime,
         // validator: (val) =>
         // isValidDob(val) ? null : 'Not a valid date',
         onSaved: (val) =>loogBookModule.timeOfDepartureOutUTC=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
          onTap:()async{ 
            
             DateTime date=   await showDatePicker(
                context: context,
                firstDate: firstdate,
                lastDate: lastDate,
                initialDate:utc
              );
              if(date != null){
                TimeOfDay timeval = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: utc.hour,minute: utc.minute) ,
                // initialEntryMode: TimePickerEntryMode.input ,
                initialEntryMode: TimePickerEntryMode.input ,
                builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                child: child,  ); },);
              if(timeval != null){
                pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
                 var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(pickedDate.toString(), true);
                 setState(() {
                    dtdepartureoutUTC.text=pickedDate.toString();
                    timeOfDepartureOutUTCfortimediff=utctolocal(dateTime, departZone);
                  dtdepartureout.text=timeOfDepartureOutUTCfortimediff.toString();
                });
                clacuatetimeDiff();
                 setState(() {});
                } } }  );
  }

 /////////////////
 
//   ////////////////////////
   Widget _departureoff() {
    return    TextFormField(
            readOnly: true,
            decoration: new InputDecoration( suffixIcon : Icon(Icons.calendar_today),labelText: 'Time of Departure off  *',  ),
            controller: dtdepartureoff,
            keyboardType: TextInputType.datetime,
           onSaved: (val) =>loogBookModule.timeOfDepartureOff=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
            onTap:()async{
              DateTime timeDepartureoff=findLocationDatetime(departZone);
              DateTime date=   await showDatePicker(
              context: context,
      firstDate:firstdate,
      lastDate:lastDate,
      initialDate:timeofDepartureOff
    );
    if(date != null){
   TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: timeDepartureoff.hour,minute: timeDepartureoff.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
       builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ); },
    );
    if(timeval != null)
      setState(() {
       pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
        print(pickedDate);
       dtdepartureoffUTC.text=pickedDate.toUtc().toString();
        dtdepartureoff.text=pickedDate.toString();}); }
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
          
             }  );
  }
//   /////////////////////
       Widget _departureoffUtc() {
    return    TextFormField(
                 decoration: new InputDecoration( labelText: ' Time of Departure Off -UTC',suffixIcon : Icon(Icons.calendar_today) ),
                readOnly :true,
                controller: dtdepartureoffUTC,
                keyboardType: TextInputType.datetime,
        
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>loogBookModule.timeOfDepartureOffUTC=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
          onTap:()async{ 
    DateTime date=   await showDatePicker(
      context: context,
      firstDate: firstdate,
      lastDate: lastDate,
      initialDate:utc
    );
    if(date != null){
      TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: utc.hour,minute: utc.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
      builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ); },
    );
    if(timeval != null)
     pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
                 var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(pickedDate.toString(), true);
      setState(() {
   dtdepartureoffUTC.text=pickedDate.toString();
        dtdepartureoff.text=utctolocal(dateTime, departZone).toString();
      }); }
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            // onSaved: (val) =>saveMedicalData.dtExam=val.toString(),//convertToDate(val).toString(),
             } 
          );
  }
 
 //   ////////////////////////
   Widget _arrivaliOn() {
    return    TextFormField(
                readOnly: true,
            decoration: new InputDecoration(
               suffixIcon : Icon(Icons.calendar_today),
                // hintText: 'Examination date',
              labelText: 'Time of Arrival On  *',
            ),
             controller: dtArrivalon,
            keyboardType: TextInputType.datetime,
             onSaved: (val) =>loogBookModule.timeOfArrivalOn=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
            onTap:()async{ 
              // String zone = placesdatalistdemo[departZone]['placeCode'];
              print(arrivalZone);
              DateTime timeDepartureon=findLocationDatetime(arrivalZone);
           DateTime date=   await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
      initialDate:timeDepartureon
    );
    if(date != null){
   TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: timeDepartureon.hour,minute: timeDepartureon.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
       builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,  ); },);
    if(timeval != null){
       pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
      //  print('UTC'+pickedDate.toUTC().toString());
       localtoUtc(pickedDate, arrivalZone);
      setState(() {
        // print(pickedDate);
        dtArrivalonUTC.text=pickedDate.toUtc().toString();
        dtArrivalon.text=pickedDate.toString();
                 }  );  } }
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
           
             } 
          // new IconButton(
          //   icon: const Icon(Icons.calendar_today),
          //   tooltip: 'Choose date',
          //   onPressed:_pickDate,
          // )
        );
  }
//   /////////////////////
       Widget _arrivalonUtc() {
    return    TextFormField(
            decoration: new InputDecoration(
                hintText: ' Select Date',
         labelText: ' Time of Arrival On-UTC',
            ),
                readOnly :true,
         controller: dtArrivalonUTC,
            keyboardType: TextInputType.datetime,
        
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>loogBookModule.timeOfArrivalOnUTC=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
          onTap:()async{ 
            
           DateTime date=   await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
      initialDate:utc
    );
    if(date != null){
      TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: utc.hour,minute: utc.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
      builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ); },
    );
    if(timeval != null){
        pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
         var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(pickedDate.toString(), true);
       setState(() {
        dtArrivalonUTC.text=pickedDate.toString();
        dtArrivalon.text=utctolocal(dateTime, arrivalZone).toString();
        });
        
         }}
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            // onSaved: (val) =>saveMedicalData.dtExam=val.toString(),//convertToDate(val).toString(),
             } 
          );
  }
 
//   ////////////////////////
   Widget _arrivalIn() {
    return    TextFormField(
            readOnly: true,
            decoration: new InputDecoration(
               suffixIcon : Icon(Icons.calendar_today),
               labelText: 'Time of Arrival In  *',  ),
            controller: dtArrivalIn,
            keyboardType: TextInputType.datetime,
             onSaved: (val) =>loogBookModule.timeOfArrivalIn=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
            onTap:()async{
               timeOfArrivalIn=findLocationDatetime(arrivalZone);
              DateTime date=   await showDatePicker(
              context: context,
      firstDate:firstdate,
      lastDate:lastDate,
      initialDate:timeOfArrivalIn
    );
    if(date != null){
   TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: timeOfArrivalIn.hour,minute: timeOfArrivalIn.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
       builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ); },
    );
    if(timeval != null){
      pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
        print(pickedDate);
        DateTime toutc=pickedDate.toUtc();
        print(toutc);
      var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(toutc.toString(), true);
      setState(() {
       
       dtArrivalInUTC.text=pickedDate.toUtc().toString();
        timeOfArrivalInUTCfortimediff=utctolocal(dateTime, arrivalZone);
        dtArrivalIn.text=pickedDate.toString();

        });
        clacuatetimeDiff();
        setState(() {});} }
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            // onSaved: (val) =>saveMedicalData.dtExam=val.toString(),//convertToDate(val).toString(),
             }  );
  }
//   /////////////////////
       Widget _arrivalInUtc() {
    return    TextFormField(
                 decoration: new InputDecoration( labelText: ' Time of Arrival In -UTC',suffixIcon : Icon(Icons.calendar_today) ),
                readOnly :true,
                controller: dtArrivalInUTC,
                keyboardType: TextInputType.datetime,
         onSaved: (val) =>loogBookModule.timeOfArrivalInUTC=saveFormat.format(DateTime.parse(val)).toString(),//convertToDate(val).toString(),
         // validator: (val) =>
         //     isValidDob(val) ? null : 'Not a valid date',
            // onSaved: (val) =>saveMedicalData.dtAudiogram=val.toString(),//convertToDate(val).toString(),
          onTap:()async{ 
    DateTime date=   await showDatePicker(
      context: context,
      firstDate: firstdate,
      lastDate: lastDate,
      initialDate:utc
    );
    if(date != null){
      TimeOfDay timeval = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: utc.hour,minute: utc.minute) ,
      // initialEntryMode: TimePickerEntryMode.input ,
      initialEntryMode: TimePickerEntryMode.input ,
      builder: (BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ); }, );
    if(timeval != null){
         pickedDate =date.add(Duration (hours:timeval.hour,minutes:timeval.minute));
         var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(pickedDate.toString(), true);
       setState(() {
         dtArrivalInUTC.text=pickedDate.toString();
         timeOfArrivalInUTCfortimediff=utctolocal(dateTime, arrivalZone);
         dtArrivalIn.text=timeOfArrivalInUTCfortimediff.toString();
        });

        clacuatetimeDiff();
        setState(() {});
        }}
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            // onSaved: (val) =>saveMedicalData.dtExam=val.toString(),//convertToDate(val).toString(),
             } 
          );
  }
  List <String> listLebal=[ 'SOLO ','Co-Pilot ','FE','MP','PIC','DUAL','NIGHT','PICUS','FL','IFR'];
  List <bool> listbool=[solo,copilot,fe,mp,pic,dual,night,picus,fl,ifr];
  List <dynamic> forsavedata=[loogBookModule.nameOfPic,loogBookModule.copilot,loogBookModule.fe,loogBookModule.mp,loogBookModule.pic,loogBookModule.dual,loogBookModule.night,loogBookModule.picus,loogBookModule.fl,loogBookModule.ifr];
//   /////create logboook object outside stful widget for listviewbuilder//////////
 Widget _additionalDetails(){
 return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:1.0),
            ExpansionTile(
              title: Text( "Additional Detail"),//, style: TextStyle( fontWeight: FontWeight.bold ),
              children: <Widget>[
    //            Container(height:200,child: ListView.builder(
    //               itemCount: listLebal.length,
    //               itemBuilder: (BuildContext ctxt, int index) {
    //                var vala=forsavedata[index];
    //               return Card(child:Container(height:90,
    //         child: Center(
    // child:  Row(
    // children: <Widget>[
    // Expanded(flex:3,child:     Column(
    //       children: <Widget>[
//             Container(height: 70, child:Switch( value: listbool[index],
//                 onChanged: (bool newValue) {
//                   print(initialVal);
//                     setState(() { 
//                       listbool[index]=newValue;}); }, ),),
//              Container(height: 20,child:Text(listLebal[index]),) ],),),
//     Expanded(flex:6,child:TextFormField(
//       enabled:listbool[index],
//       initialValue: initialtime.toString(),
//       keyboardType: TextInputType.phone,
//        onSaved:(val) =>vala=val.toString(),
//       decoration:  InputDecoration(labelText:listLebal[index]),
//       onChanged: (String newValue){
//         forsavedata[index]=newValue.toString();
//         print('${forsavedata[index]}:$newValue ');}
    
//     ) )]),),
// ),
// );}),),
                        _solo(),
                        _copilot(),
                        _fe(),
                        _mp(),
                        _sp(),
                        _spic(),
                        _dual(),
                        _night(),
                        _pic(),
                        _picus(),
                        _fl(),
                        _ifr()
                        ])]));}

Widget _copilot(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:4,child:     Column(
          children: <Widget>[
            Switch( value: copilot,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      copilot=newValue;}); }, ),
            Text("Co-Pilot"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:copilot,
      initialValue:selected_entryIid!=null?loogBookModule.copilot: initialtime,
      
      //:  loogBookModule.copilot,
      onSaved:(val) =>  loogBookModule.copilot=val.toString(),
      decoration: const InputDecoration(labelText: 'Co-Pilot'),
      onChanged: null//(String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _dual(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: dual,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      dual=newValue;}); }, ),
            Text("DUAL"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:dual,
       initialValue:selected_entryIid!=null?loogBookModule.dual: initialtime,
      onSaved:(val) =>  loogBookModule.dual=val.toString(),
      decoration: const InputDecoration(labelText: 'DUAL'),
      onChanged: (String newValue) {setState(() {copilotinitial=newValue; }); }
    ) )]),),
),);}
Widget _fe(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: fe,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      fe=newValue;}); }, ),
            Text("FE"), ],),),
    Expanded(flex:6,child:TextFormField(
      initialValue:selected_entryIid!=null?loogBookModule.fe: initialtime,
      enabled:fe,
      //:  loogBookModule.fe,
      onSaved:(val) =>  loogBookModule.fe=val.toString(),
      decoration: const InputDecoration(labelText: 'FE'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _fl(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: fl,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      fl=newValue;}); }, ),
            Text("FL"), ],),),
    Expanded(flex:6,child:TextFormField(
      initialValue:selected_entryIid!=null?loogBookModule.fl: initialtime,
      enabled:fl,
      //:  loogBookModule.fl,
      onSaved:(val) =>  loogBookModule.fl=val.toString(),
      decoration: const InputDecoration(labelText: 'FL'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _ifr(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: ifr,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      ifr=newValue;}); }, ),
            Text("IFR"), ],),),
    Expanded(flex:6,child:TextFormField(
      initialValue:selected_entryIid!=null?loogBookModule.ifr: initialtime,
      enabled:ifr,
      //:  loogBookModule.ifr,
      onSaved:(val) =>  loogBookModule.ifr=val.toString(),
      decoration: const InputDecoration(labelText: 'IFR'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _mp(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: mp,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      mp=newValue;}); }, ),
            Text("MP"), ],),),
    Expanded(flex:6,child:TextFormField(
      initialValue:selected_entryIid!=null?loogBookModule.mp: initialtime,
      enabled:mp,
      //:  loogBookModule.mp,
      onSaved:(val) =>  loogBookModule.mp=val.toString(),
      decoration: const InputDecoration(labelText: 'MP'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _night(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: night,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      night=newValue;}); }, ),
            Text("NIGHT"), ],),),
    Expanded(flex:6,child:TextFormField(
       initialValue:selected_entryIid!=null?loogBookModule.night: initialtime,
      enabled:night,
      //:  loogBookModule.night,
      onSaved:(val) =>  loogBookModule.night=val.toString(),
      decoration: const InputDecoration(labelText: 'NIGHT'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _pic(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: pic,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      pic=newValue;}); }, ),
            Text("PIC"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:pic,
       initialValue:selected_entryIid!=null?loogBookModule.pic: initialtime,
      //:  loogBookModule.pic,
      onSaved:(val) =>  loogBookModule.pic=val.toString(),
      decoration: const InputDecoration(labelText: 'PIC'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _picus(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: picus,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      picus=newValue;}); }, ),
            Text("PICUS"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:picus,
      // controller:init,
       initialValue:selected_entryIid!=null?loogBookModule.picus: initialtime,
      //:  loogBookModule.picus,
      onSaved:(val) =>  loogBookModule.picus=val.toString(),
      decoration: const InputDecoration(labelText: 'PICUS'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
var init=new TextEditingController();
Widget _solo(){
return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: solo,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      solo=newValue;}); }, ),
            Text("SOLO"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:solo,
       initialValue:selected_entryIid!=null?loogBookModule.solo: initialtime,
      //:  loogBookModule.solo,
      onSaved:(val) =>  loogBookModule.solo=val.toString(),
      decoration: const InputDecoration(labelText: 'SOLO'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _sp(){

return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: sp,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      sp=newValue;}); }, ),
            Text("SP"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:sp,
       initialValue:selected_entryIid!=null?loogBookModule.sp:initialtime,
      //:  loogBookModule.sp,
      onSaved:(val) =>  loogBookModule.sp=val.toString(),
      decoration: const InputDecoration(labelText: 'SP'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}
Widget _spic(){
 return Card(child:Container(height:70,
            child: Center(
    child:  Row(
    children: <Widget>[
    Expanded(flex:3,child:     Column(
          children: <Widget>[
            Switch( value: spic,
                onChanged: (bool newValue) {
                  print(initialVal);
                    setState(() { 
                      spic=newValue;}); }, ),
            Text("SPIC"), ],),),
    Expanded(flex:6,child:TextFormField(
      enabled:spic,
       initialValue:selected_entryIid!=null?loogBookModule.spic:initialtime,
      //:  loogBookModule.spic,
      onSaved:(val) =>  loogBookModule.spic=val.toString(),
      decoration: const InputDecoration(labelText: 'SPIC'),
      onChanged: (String newValue) =>initialVal=newValue,
    
    ) )]),),
),
);
}

  /////////////
  Widget _landing(){
    return ListTile(
            leading:Text('Landing'),
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[ landing!=0? new  IconButton(icon: new Icon(Icons.remove),
                                                     onPressed: ()=>setState(()=>landing--),
                                                    ):new Container(),  new Text(landing.toString()),
           new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>landing++)),],
        ), 
     
        );
  } 
  ////////////////
  Widget _takeOff(){
    return ListTile(
            leading:Text('Take Off'),
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[ takeOff!=0? new  IconButton(icon: new Icon(Icons.remove),
                                                     onPressed: ()=>setState(()=>takeOff--),
                                                    ):new Container(),  new Text(takeOff.toString()),
           new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>takeOff++)),],
        ), 
     
        );
  }
  
  ////////
Widget _remark(){
  return TextFormField(
        initialValue:selected_entryIid!=null?loogBookModule.remarks:'',
           decoration: InputDecoration(  hintText: 'Remark ',
           labelText: 'Remark '),
         // keyboardType: TextInputType.phone,
         // validator: licenceNumber,
          onChanged: (String value){loogBookModule.remarks=value;},
          onSaved: (val) =>  loogBookModule.remarks=val,
        );
}
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
  
  String licenceNumber(String value) {

  if(value == null) 
    return null;
 
  final n = num.tryParse(value);
  if(n == null) 
  return '"$value" is not a valid number';
 
  return null;
}
  
   bool isValidDob(String dat) {
    if (dat.isEmpty) return true;
     return false;
//  var d = convertToDate(dob);
 // return d != null && d.isBefore(new DateTime.now());
}

///////////////////
 
  /////////////////////////////////////////////////////////////////
   void reset() {
print(nowtz);
  //  _formKey.currentState.reset();
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    // loogBookModule.seMe='true';
    loogBookModule.landing=landing.toString();
    loogBookModule.takeOff=takeOff.toString();
    postdata();

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
    void postdata(){
      loogBookModule.userId=uuid;
      // loogBookModule.id=0;
   String jsons = loogBookModuleClassToJson(loogBookModule);
 print( jsons);
 sendRequest( jsons) ;
 }

 sendRequest( String data) async {
  print('    http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"},');
var url = 'http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$uuid';
print(url);
    http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      final String res = response.body;
print(response.body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      } else { print(json.decode(res)); }
    });

   
  }
    Future<int> getidloogbookdata(var id) async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$id/logBookEntryData",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
      //  List<dynamic>  logbookList=jsonDecode(response.body);
      //  print('get id 1 respone'+jsonDecode(response.body).toString());
       loogBookModule =LoogBookModuleClass.fromJson(json.decode(response.body));
        assignvaluetocontroller(response.body);
        return 1;
        //  assign(logbookList);
       }
    }
    assignvaluetocontroller(String val){
      final decoded=jsonDecode(val);
    dtdepartureout.text= decoded['timeOfArrivalIn'];
    dtArrivalIn.text= decoded['timeOfDepartureOut'];  
    dtArrivalInUTC.text= decoded['timeOfArrivalInUTC']; 
    dtArrivalon.text= decoded['timeOfArrivalOn'];  
    dtArrivalonUTC.text= decoded['timeOfArrivalOnUTC']; 
    dtdepartureoff.text= decoded['timeOfDepartureOff'];  
    dtdepartureoffUTC.text= decoded['timeOfDepartureOffUTC'];
    dtdepartureoutUTC.text= decoded['timeOfDepartureOutUTC'];
    takeOff=int.parse( decoded['takeOff']);
    landing=int.parse( decoded['landing']);
   
    }
 /////////////////////////////END///////////////////////////////////////////
}
///////////////

