import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';

class Instructorpage extends StatefulWidget {
  @override
  _InstructorpageState createState() => _InstructorpageState();
}

class _InstructorpageState extends State<Instructorpage> {

  var id = <int>[];
  var examinarlist = <TextEditingController>[];
  var remarklist = <TextEditingController>[];
  var cards = <Card>[];
var instructorType;
  Card createCard() {
  
    var examinarController=TextEditingController();
    var remarkandRes = TextEditingController();

    examinarlist.add(examinarController);
    remarklist.add(remarkandRes);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Instructor ${cards.length + 1}'),
          DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Instructor * ',
    //  hintText:'Select Nationality',
       ),
         //  value:instructorType,
              onChanged: (String newValue) =>setState(() => examinarController.text = newValue),
              validator: (value) => value == null ? 'field required' : null,
         //      onSaved: (val) =>examinarlist.text=val,//  saveUserData.nationality=val,
              items: instructordatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['instructorType']),
              value: item['id'].toString(),
            );
          }).toList(),
        ),
//           TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Full Name')),
        
          new TextFormField(
            // initialValue:userdata.email,
            decoration:
                const InputDecoration(labelText: 'Remark and restriction'),
            keyboardType: TextInputType.text,
            controller: remarkandRes,
            // validator: validateEmail,
            //  onSaved: (String val)  =>saveUserData.email=val.toString(),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
  
    for (int i = 0; i < cards.length; i++) {
      var idval = i+1;
      var examniaridval = examinarlist[i].text;
      var job = remarklist[i].text;
     // addinstructor(idval,age,job);
     entries.add( PersonEntry(examniaridval, idval, job));
//       String jsonUser = jsonEncode(personEntry);
      
//       entries.add(jsonUser);
    }
    String jsonTags = jsonEncode(entries);
  print(jsonTags);
    Navigator.pop(context, jsonTags);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
          
          title: new Text(' Instructor'),
        ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
         Row(
        children: <Widget>[  Padding(
            padding: const EdgeInsets.all(6.0),
            child: RaisedButton(
              child: Text('add new'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RaisedButton(
              child: Text('remove '),
              onPressed: () => setState(() => cards.remove(--cards.length)),
            ),
          )]),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class PersonEntry {
  final String examinerTypeId;
  final int id;
  final String remark;

  PersonEntry(this.examinerTypeId, this.id, this.remark);
  @override
  //String toRawJson() => json.encode(toJson());
  String toString() {
    return 'name= $examinerTypeId, remark= $id, study job= $remark';
  }

  Map<String, dynamic> toJson() => {
        "examinerTypeId": examinerTypeId,
        "id": id,
        "remark": remark,
      };
}

double discretevalue = 2.0;
double hospitaldiscretevalue = 25.0;
var instructorsOptions;var nationality;
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//import 'dart:convert';


addinstructor(){
   
//  instructorDetail.id=id;
//   instructorDetail.instructorTypeId=type;
//   instructorDetail.remark=remark;
  
  //saveLicenseData.personnel = <Personneldata>[personal];

}
//   var id = <int>[];
//   var examinarlist = <TextEditingController>[];
//   var remarklist = <TextEditingController>[];
//   var cards = <Card>[];
// var instructorType;
//   Card createCard() {
  
//     var examinarController=TextEditingController();
//     var remarkandRes = TextEditingController();

//     examinarlist.add(examinarController);
//     remarklist.add(remarkandRes);
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Instructor ${cards.length + 1}'),
//           DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:' Instructor * ',
//     //  hintText:'Select Nationality',
//        ),
//            value:instructorType,
//               onChanged: (String newValue) =>setState(() => examinarController.text = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//          //      onSaved: (val) =>examinarlist.text=val,//  saveUserData.nationality=val,
//               items: instructordatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['instructorType']),
//               value: item['instructorType'].toString(),
//             );
//           }).toList(),
//         ),
// //           TextField(
// //               controller: nameController,
// //               decoration: InputDecoration(labelText: 'Full Name')),
        
//           new TextFormField(
//             // initialValue:userdata.email,
//             decoration:
//                 const InputDecoration(labelText: 'Remark and restriction'),
//             keyboardType: TextInputType.text,
//             controller: remarkandRes,
//             // validator: validateEmail,
//             //  onSaved: (String val)  =>saveUserData.email=val.toString(),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     cards.add(createCard());
//   }

//   _onDone() {
//     List<PersonEntry> entries = [];
  
//     for (int i = 0; i < cards.length; i++) {
//       var idval = i+1;
//       var examniaridval = examinarlist[i].text;
//       var job = remarklist[i].text;
//      // addinstructor(idval,age,job);
//      entries.add( PersonEntry(examniaridval, idval, job));
// //       String jsonUser = jsonEncode(personEntry);
      
// //       entries.add(jsonUser);
//     }
//     String jsonTags = jsonEncode(entries);
//  //   print(jsonTags);
//     Navigator.pop(context, jsonTags);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: new AppBar(
          
//           title: new Text(' Instructor'),
//         ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: cards.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return cards[index];
//               },
//             ),
//           ),
//          Row(
//         children: <Widget>[  Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: RaisedButton(
//               child: Text('add new'),
//               onPressed: () => setState(() => cards.add(createCard())),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: RaisedButton(
//               child: Text('remove '),
//               onPressed: () => setState(() => cards.remove(--cards.length)),
//             ),
//           )]),
//         ],
//       ),
//       floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
//     );
//   }
// }

// class PersonEntry {
//   final String examinerTypeId;
//   final int id;
//   final String remark;

//   PersonEntry(this.examinerTypeId, this.id, this.remark);
//   @override
//   //String toRawJson() => json.encode(toJson());
//   String toString() {
//     return 'name= $examinerTypeId, remark= $id, study job= $remark';
//   }

//   Map<String, dynamic> toJson() => {
//         "examinerTypeId": examinerTypeId,
//         "id": id,
//         "remark": remark,
//       };
// }

// double discretevalue = 2.0;
// double hospitaldiscretevalue = 25.0;
// var instructorsOptions;var nationality;
// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// //import 'dart:convert';


// addinstructor(){
   
// //  instructorDetail.id=id;
// //   instructorDetail.instructorTypeId=type;
// //   instructorDetail.remark=remark;
  
//   //saveLicenseData.personnel = <Personneldata>[personal];

// }