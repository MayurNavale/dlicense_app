import 'package:json_table/json_table.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
class CustomDataTable extends StatefulWidget {
  @override
  _CustomDataTableState createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
 
  @override
  void initState() {
    super.initState();
    decodejson();
    // _subject.add(_controller.text);
    // _controller.addListener(() {
    //   _subject.add(_controller.text);
    // });
  }
  decodejson(){ json = jsonDecode(jsonSample);}
final String jsonSample=' [{"dtOfFlight":"2020-02-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-03-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-04-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-06-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-07-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-08-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-09-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"},{"dtOfFlight":"2020-10-11","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"655","timeOfDepartureOutUTC":"2020-08-29","timeOfDepartureOut":"2020-08-29","timeOfDepartureOffUTC":"2020-08-29","timeOfDepartureOff":"2020-08-29","timeOfArrivalOnUTC":"2020-08-30","timeOfArrivalOn":"2020-08-30","timeOfArrivalInUTC":"2020-08-30","timeOfArrivalIn":"2020-08-30","seMe":"true","takeOff":"1","landing":"2","nameOfPic":"uggg","sp":"1:1:1","mp":"1:1:1","pic":"1:1:1","solo":"1:1:1","spic":"1:1:1","picus":"1:1:1","copilot":"1:1:7","dual":"1:1:1","fl":"1:1:1","fe":"1:1:1","night":"1:1:1","ifr":"1:1:1","remarks":"hyy"}]';
var json;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child :Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "Apply & Enroll",
        ),
         bottom: TabBar(
            tabs: <Widget>[
            
              Tab(
                text: "Ministry",
              ),
              Tab(
                text: "Airline",
              ),
              Tab(
                text: "School",
              ),
              Tab(
                text: "Institution",
              ),
            ],
          ),
        ),
      body:
      TabBarView(
          children: [
         Ministr(),
         Ministr(),
         Ministr(),
         Ministr(),   ],
        ), 
      ),
     );
   }
}
 class Ministr extends StatefulWidget {
   @override
   _MinistrState createState() => _MinistrState();
 }
 
 class _MinistrState extends State<Ministr> {
   @override
     Widget build(BuildContext context) {
       return Text(
         'Ministr',
         textAlign: TextAlign.center,
        //  style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w700, fontSize: 14.0,color: Colors.black87),
       );
     }
   }


 



