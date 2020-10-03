import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() { return _CalendarScreenState();
  }
}
class _CalendarScreenState extends State<CalendarScreen> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [ {'name': '', 'isDone': true},];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2020, 5, 7): [
      {'name': '1', 'isDone': true},
    ],
    DateTime(2020, 5, 9): [
      {'name': 'event A', 'isDone': true},     
    ],
    DateTime(2020, 5, 10): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 5, 13): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 5, 25): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 6, 6): [
      {'name': 'Event A', 'isDone': false},
    ],
  };
  
  Future<int> futuregettrainingdata;
 final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
      futuregettrainingdata =  gettrainingdata();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  AppBar(title:  Text('Training List'),
      ),
      key:_scaffoldKey ,
        body: SafeArea(
          child:Center(
          child: FutureBuilder<int>(
            future: futuregettrainingdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child:  Padding(
            padding:  EdgeInsets.all(15.0),
            child: widgets() ),
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
      Widget widgets(){
        return Column(
          children: <Widget>[
            _examiner(),
            _instructor(),
            SizedBox(height :20,child:Container(color : Colors.pink)),
            Container(
              height: 300,
              child: Calendar(
                isExpanded: true,
                hideBottomBar : true,
                startOnMonday: true,
                weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                events: _events,
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.yellow,
                eventColor: Colors.grey,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
            _buildEventList(),
            SizedBox(height :20,child:Container(color : Colors.pink)),
            savebutton()
          ],
        );
  }

  Widget _buildEventList() {
    return Container(
      height: 200,
      child:Column( children :[
        Expanded(child:  ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child : Column( children :[ 
            
            ListTile(
              trailing: GestureDetector(child:Icon(Icons.add), onTap: _addvent,),
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          )]
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
        ),
      ]
      ),
    );
  }

String typeId;
  Widget _examiner(){
    return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: ' Examiner * ',
              hintText: 'Select Examiner',
            ),
            value:typeId,//  findval(examinarapiId,5), //
            onChanged: (String newValue) => typeId= typeId,
            validator: (value) => value == null ? 'field required' : null,
            //  onSaved: (val) =>examinarController=1,//  saveUserData.nationality=val,
            items: examinerdatalist.map((item) {
              return new DropdownMenuItem(
                child: new Text(item['examinerType']),
                value: item['examinerType'].toString(),
                onTap: () {
                 // print(item['id']);
                  // typeId.text = item['id'].toString();
             //     print(examinarapiId);
                },
              );
            }).toList(),
          );
  }
  String typeIdinst;
  //////////////
  Widget _instructor(){
    return  DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: ' Instructor * ',
              hintText: 'Select Instructor',
            ),
            value:  typeIdinst, //
            onChanged: (String newValue) => typeIdinst = typeIdinst,
            validator: (value) => value == null ? 'field required' : null,
            //  onSaved: (val) =>examinarController=1,//  saveUserData.nationality=val,
            items: instructordatalist.map((item) {
              return new DropdownMenuItem(
                child: new Text(item['instructorType']),
                value: item['instructorType'].toString(),
                onTap: () {
                 // print(item['id']);
                  // typeId.text = item['id'].toString();
             //     print(examinarapiId);
                },
              );
            }).toList(),
          );
  }


  
  ///////
  Widget savebutton(){
    return Align(
      alignment : Alignment.centerRight,
      child : Row(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue[600],
            child: Text('Save'),
            onPressed: null),
            RaisedButton(
            color: Colors.red[600],
            child: Text('Cancle'),
            onPressed: null),
            RaisedButton(
            color: Colors.pink[600],
            child: Text('Next'),
            onPressed: null)
        ],

      )
    );
  }
 void _addvent(){
setState(() {
  _selectedEvents.add({'name': 'Event A', 'isDone': true});
});
 }
 
Future<int> gettrainingdata() async {
  // final response = await http.get('http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$id/logBookEntryData',
  //  headers: {"Authorization":"$token"},);
  // if (response.statusCode == 200||response.statusCode == 201) {
  // return 1; } 
  // else if  (response.statusCode == 500){initialnumdata=''; return 1;}
  // else{ initialnumdata=''; return 1;}
return 1;
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
