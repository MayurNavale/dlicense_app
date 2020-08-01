import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'model.dart';
class Instructorpage extends StatefulWidget {
    List<Instructorapi>  userdata;
   Instructorpage(this.userdata);
   @override
   State<StatefulWidget> createState() { return _Instructorpage(this.userdata);}
 }

  class _Instructorpage extends State<Instructorpage> {
  List<Instructorapi>  userdata;
  _Instructorpage(this.userdata);
// 
  var id = <int>[];
  var instlist = <TextEditingController>[];
  var remarklist = <TextEditingController>[];
  var cards = <Card>[];
var InstructorType;
  Card createCard(int inst_Id, String remarkapi) {
  var remarkandRes =TextEditingController();
     var typeId =TextEditingController();
    typeId.text=inst_Id.toString();
    remarkandRes.text=remarkapi;
    instlist.add(typeId);
    remarklist.add(remarkandRes);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Instructor ${cards.length + 1}'),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: ' Instructor * ',
              hintText: 'Select Instructor',
            ),
            value:  findval(inst_Id,6), //
            onChanged: (String newValue) => typeId.text = typeId.text,
            validator: (value) => value == null ? 'field required' : null,
            //  onSaved: (val) =>examinarController=1,//  saveUserData.nationality=val,
            items: instructordatalist.map((item) {
              return new DropdownMenuItem(
                child: new Text(item['instructorType']),
                value: item['instructorType'].toString(),
                onTap: () {
                 // print(item['id']);
                  typeId.text = item['id'].toString();
             //     print(examinarapiId);
                },
              );
            }).toList(),
          ),
          new TextFormField(
            initialValue: remarkapi,
            decoration:
                const InputDecoration(labelText: 'Remark and restriction'),
            keyboardType: TextInputType.text,
            onChanged: (String newValue) =>
                setState(() => remarkandRes.text = newValue),
            //controller: remarkandRes.text=remarkapi,
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
    intidata();
  }
  intidata() {
   int count = userdata.length;
    if (count == 0) {
      cards.add(createCard(0, ''));
    }
    for (int dat = 0; dat < count; dat++) {
      int apiexaminer = int.parse( userdata[dat].instructorTypeId);
      String apiremark = userdata[dat].remark;
      // remarklist.add( apilist[dat]['remark']);
      cards.add(createCard(apiexaminer, apiremark));
    }
  }

  _onDone() {
    List<Instructorapi> entries = [];
  
       for (int i = 0; i < cards.length; i++) {
      var idval = 0;
      var instructorval =instlist[i].text;
      var job = remarklist[i].text;
      entries.add(Instructorapi(instructorval, idval, job));
    }
  
    String jsonTags = jsonEncode(entries);

 
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
              onPressed: () => setState(() => cards.add(createCard(0,''))),
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
class Instructorapi {
  final String instructorTypeId;
  final int id;
  final String remark;

  Instructorapi(this.instructorTypeId, this.id, this.remark);

 factory Instructorapi.fromJson(dynamic json) {
    return Instructorapi(json['instructorTypeId'] as String, json['id'] as int,json['remark'] as String,);
  }
  Map<String, dynamic> toJson() => {
        "instructorTypeId": instructorTypeId,
        "id": id,
        "remark": remark,
      };
}

