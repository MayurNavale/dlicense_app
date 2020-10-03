import 'package:appdata/src/applyEnroll/airline.dart';
import 'package:appdata/src/applyEnroll/doctor.dart';
import 'package:appdata/src/applyEnroll/institution.dart';
import 'package:appdata/src/applyEnroll/school.dart';
import 'package:appdata/src/logbookModule/logbookModulePage.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/trainingList/flightData.dart';
import 'package:appdata/src/trainingList/trainingListPage.dart';
import 'package:appdata/src/trainingList/trainingSyllabus.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'modal.dart';
import 'package:intl/intl.dart';
class StartSession extends StatefulWidget {
  @override
  _StartSessionState createState() => _StartSessionState();
}
class _StartSessionState extends State<StartSession>   {
  // ApplyEnrollClass applyEnrollClass=new ApplyEnrollClass();
  List<DataRow> _rowList = []; 
  Future <int> uplidesucess;
List<dynamic> ministryList=[];
var flightData=LoogBookModuleClass();
  Future<int >futuregetlogbookIdvalue;
bool _autoValidate = false,readOnlytrue=false;
 final _scaffoldKey = GlobalKey<ScaffoldState>();
var text=AllTexttoShow();
final showformmat = DateFormat("dd-MM-yyyy"),
dateFormat = DateFormat("dd-MM-yyyy HH:mm"),
formattime = DateFormat("dd-MM-yyyy HH:mm");
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool uplodesucess;
  int x;
  var saveformmat = DateFormat("yyyy-MM-dd");
    void initState() {
    super.initState();

futuregetlogbookIdvalue=defaultvalue();
}


Future<int> defaultvalue()async{ return 1;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Start Session'),
      ),
      body:SafeArea(child:
      DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            semanticContainer: false,
            elevation: 3,
            child:  Container(
              constraints: BoxConstraints.expand(height: 60),
              child: TabBar(
                indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                 tabs: [
                  Tab(   text: text.tabHeadet[0] ),
                  Tab(   text:  text.tabHeadet[1] ),
                  Tab(   text: text.tabHeadet[2] ),
                ]
              ),
            ),
          ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: TabBarView(children: [
              
              flightDatatab(),
             TrainingSyllabus(),
              FlightHour()
                ]),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
  Widget flightDatatab(){
    return  Center(
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
    );
  }
  // List <Widge> widger=[asd,asd];
 
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
          registrationofAircraft(),
          sizebox,
          seme(),
//           sizeboxblur,
//           _departureout(),
//           _departureoutUTC(),
//           sizebox,
//          _departureoff(),
//          _departureoffUtc(),
//          sizeboxblur,
//          _arrivaliOn(),
//          _arrivalonUtc(),
//          sizebox,
//          _arrivalIn(),
//          _arrivalInUtc(),
//          sizeboxblur,
//            sizebox,
//          _takeOffDay(),
//          sizebox,
//          _landingDay(),
//          sizebox,
//          _landingNight(),
//          sizebox,
//          _takeOffNight(),
//          sizebox,
//          _remark(),
//           // _cardDepartureout(),
//           // _cardDepartureoff(),
//           // _cardArivalOn(),
//           // _cardArivalIn(),
//           _additionalDetails(),
      
//         //  _licenceNumber(),
        
          
// //       
        showdata() 
        ]
     );
     
   }
   
  //////////////////////
  Widget _dateOfFlight() {
       return DateTimeField(
         initialValue:flightData.dtOfFlight!=null? DateTime.parse(flightData.dtOfFlight):null,
        //  controller: dtdepartureout,
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of Flight  *',
            suffixIcon : Icon(Icons.calendar_today),
           // hintText: '$dateOfInitialIssue'
           ),
            format: showformmat,
            //:dateOfInitialIssue,//DateTime.parse(flightData.dtdepartureout),
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
            onSaved: (value) {flightData.dtOfFlight= saveformmat.format(value);value.toString();
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
      value:flightData.placeOfDeparture!=null? flightData.placeOfDeparture:null,
       onChanged: (String newValue){flightData.placeOfArrival=newValue;
              //  flightData.placeOfDeparture=flightData.placeOfDeparture;
       },// => setState(() => contries = newValue),
      // validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => flightData.placeOfArrival = val,
        items: placesdatalistdemo.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
               onTap: () {
            print( item['id']);
           

            // flightData.placeOfDeparture = item['id'];
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
       value:flightData.placeOfArrival!=null? flightData.placeOfArrival:null,
      // value: findval( flightData.placeOfDeparture,1), //
       onChanged: (String newValue){flightData.placeOfDeparture=newValue;
              //  flightData.placeOfDeparture=flightData.placeOfDeparture;
       },// => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => flightData.placeOfDeparture = val,
        items: placesdatalistdemo.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['placeName']),
              value: item['placeName'].toString(),
               onTap: () {
            print( item['id']);
            // setState(() {
            //    arrivalZone = item['placeCode'].toString();
            // }); 
            }, );
          }).toList(),
    );
  }
  ///////

Widget _makeModel()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: ' Make/Model * ', ),
      value:flightData.makemodel!=null? flightData.makemodel:null,
       onChanged: (String newValue){flightData.makemodel=newValue.toString();},
      // validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => flightData.makemodel = val,
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
  Widget registrationofAircraft() { 
  return  TextFormField(
  
    initialValue: flightData.registrationOfAircraft!=null? flightData.registrationOfAircraft:'',
      decoration: const InputDecoration(labelText: 'Registration of aircraft:'),
      // keyboardType: TextInputType.phone,
      // validator: licenceNumber,
        onChanged: (String newValue) => flightData.registrationOfAircraft=newValue,
      onSaved: (val) => flightData.registrationOfAircraft=val,
    );
}

//////////////
Widget seme() { 
      return ListTile(
        leading: Switch(
           activeColor:Colors.blueAccent[400],
              value:  flightData.seMe!=null? boolseme= flightData.seMe=='true':boolseme,
            onChanged: (value) {
              setState(() {   boolseme=value; });
               flightData.seMe=value.toString(); },),
        title: Text('SE/ME'),  // trailing: Icon(Icons.more_vert),
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

   _formKey.currentState.reset();
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    // postdata();

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
    
}