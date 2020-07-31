import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'model.dart';
class EndorsementPage extends StatefulWidget {
    List<EndorsementAPI>  userdata;
   EndorsementPage(this.userdata);
   @override
   State<StatefulWidget> createState() { return _EndorsementPage(this.userdata);}
 }

  class _EndorsementPage extends State<EndorsementPage> {
  List<EndorsementAPI>  userdata;
  _EndorsementPage(this.userdata);
  var id = <int>[];
  var endorsementlist = <TextEditingController>[];
 
  var cards = <Card>[];
//var examinerType;
  Card createCard(int endorsementapiId) {

     var typeId =TextEditingController();
    typeId.text=endorsementapiId.toString();
   
    endorsementlist.add(typeId);
   
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Endorsement ${cards.length + 1}'),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: ' Endorsement * ',
              hintText: 'Select Endorsement',
            ),
            value:  findval(endorsementapiId,7), //
            onChanged: (String newValue) => typeId.text = typeId.text,
            validator: (value) => value == null ? 'field required' : null,
            //  onSaved: (val) =>endorsementController=1,//  saveUserData.nationality=val,
            items: endorsementdatalist.map((item) {
              return new DropdownMenuItem(
                child: new Text(item['endorsementType']),
                value: item['endorsementType'].toString(),
                onTap: () {
                 // print(item['id']);
                  typeId.text = item['id'].toString();
             //     print(endorsementapiId);
                },
              );
            }).toList(),
          ),
         
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    intidata();
  }
  intidata() {
   
//   int count=apilist.length;
//      for(int dat=0;dat<count;dat++){
//   String f= apilist[dat]['EndorsementTypeId'];
//  String r= apilist[dat]['remark'];
//    int b= apilist[dat]['id'];
//    print(b); print(r); print(f);
// // addinstructorr(b,f,r);
//     }
    int count = userdata.length;
    if (count == 0) {
      cards.add(createCard(0));
    }
    for (int dat = 0; dat < count; dat++) {
      int apiEndorsement = int.parse( userdata[dat].endorsementTypeId);
     
      // remarklist.add( apilist[dat]['remark']);
      cards.add(createCard(apiEndorsement));
    }
  }

  _onDone() {
    List<EndorsementAPI> entries = [];
  
       for (int i = 0; i < cards.length; i++) {
      var idval = 0;
      var endorsementIdval = endorsementlist[i].text;
      entries.add(EndorsementAPI(endorsementIdval, idval));
    }
  
    String jsonTags = jsonEncode(entries);

 
    Navigator.pop(context, jsonTags);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
          
          title: new Text(' Endorsement'),
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
              onPressed: () => setState(() => cards.add(createCard(0))),
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
class EndorsementAPI {
  final String endorsementTypeId;
  final int id;


  EndorsementAPI(this.endorsementTypeId, this.id);

  String toString() {
    return 'endorsementTypeId= $endorsementTypeId, id= $id';
  }
 factory EndorsementAPI.fromJson(dynamic json) {
    return EndorsementAPI(json['endorsementTypeId'] as String, json['id'] as int);
  }
  Map<String, dynamic> toJson() => {
        "endorsementTypeId": endorsementTypeId,
        "id": id,
       
      };
}



//   var id = <int>[];
//   var examinarlist = <TextEditingController>[];
//   var remarklist = <TextEditingController>[];
//   var cards = <Card>[];
// var EndorsementAPIAPIType;
//   Card createCard() {
  
//     var examinarController=TextEditingController();
//     var remarkandRes = TextEditingController();

//     examinarlist.add(examinarController);
//     remarklist.add(remarkandRes);
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('EndorsementAPIAPI ${cards.length + 1}'),
//           DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText:' EndorsementAPI * ',
//     //  hintText:'Select Nationality',
//        ),
//            value:EndorsementAPIType,
//               onChanged: (String newValue) =>setState(() => examinarController.text = newValue),
//               validator: (value) => value == null ? 'field required' : null,
//          //      onSaved: (val) =>examinarlist.text=val,//  saveUserData.nationality=val,
//               items: EndorsementAPIdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['EndorsementAPIType']),
//               value: item['EndorsementAPIType'].toString(),
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
          
//           title: new Text(' Endorsement'),
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
//   final String endorsementTypeId;
//   final int id;
//   final String remark;

//   PersonEntry(this.endorsementTypeId, this.id, this.remark);
//   @override
//   //String toRawJson() => json.encode(toJson());
//   String toString() {
//     return 'name= $endorsementTypeId, remark= $id, study job= $remark';
//   }

//   Map<String, dynamic> toJson() => {
//         "endorsementTypeId": endorsementTypeId,
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