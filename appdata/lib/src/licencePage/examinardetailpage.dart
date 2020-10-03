import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'model.dart';
class ExaminarPage extends StatefulWidget {
    List<Examinerapi>  userdata;
   ExaminarPage(this.userdata);
   @override
   State<StatefulWidget> createState() { return _ExaminarPage(this.userdata);}
 }

  class _ExaminarPage extends State<ExaminarPage> {
  List<Examinerapi>  userdata;
  _ExaminarPage(this.userdata);
  var id = <int>[];
  var examinarlist = <TextEditingController>[];
  var remarklist = <TextEditingController>[];
  var cards = <Card>[];
var examinerType;
  Card createCard(int examinarapiId, String remarkapi) {
  var remarkandRes =TextEditingController();
     var typeId =TextEditingController();
    typeId.text=examinarapiId.toString();
    remarkandRes.text=remarkapi;
    examinarlist.add(typeId);
    remarklist.add(remarkandRes);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            alignment:Alignment.center ,
            children: <Widget>[
            Container(
            alignment:Alignment.topRight ,
             height: 40,
            color: Colors.grey[300],
            child:GestureDetector(child: Icon(Icons.delete, color: Colors.black45, size: 30.0,),
                 onTap:()=> setState(() => cards.remove(--cards.length)), 
              ), ),
              Text('Examiner'),
              ]),
          
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: ' Examiner * ',
              hintText: 'Select Examiner',
            ),
            value:  findval(examinarapiId,5), //
            onChanged: (String newValue) => typeId.text = typeId.text,
            validator: (value) => value == null ? 'field required' : null,
            //  onSaved: (val) =>examinarController=1,//  saveUserData.nationality=val,
            items: examinerdatalist.map((item) {
              return new DropdownMenuItem(
                child: new Text(item['examinerType']),
                value: item['examinerType'].toString(),
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
   
//   int count=apilist.length;
//      for(int dat=0;dat<count;dat++){
//   String f= apilist[dat]['examinerTypeId'];
//  String r= apilist[dat]['remark'];
//    int b= apilist[dat]['id'];
//    print(b); print(r); print(f);
// // addinstructorr(b,f,r);
//     }
    int count = userdata.length;
    if (count == 0) {
      cards.add(createCard(0, ''));
    }
    for (int dat = 0; dat < count; dat++) {
      int apiexaminer = int.parse( userdata[dat].examinerTypeId);
      String apiremark = userdata[dat].remark;
      // remarklist.add( apilist[dat]['remark']);
      cards.add(createCard(apiexaminer, apiremark));
    }
  }

  _onDone() {
    List<Examinerapi> entries = [];
  
       for (int i = 0; i < cards.length; i++) {
      var idval = 0;
      var examniaridval = examinarlist[i].text;
      var job = remarklist[i].text;
      entries.add(Examinerapi(examniaridval, idval, job));
    }
  
    String jsonTags = jsonEncode(entries);

 
    Navigator.pop(context, jsonTags);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
          title: new Text(' Examiner'),
           actions: [
            GestureDetector(child: CircleAvatar( radius: 26.0,  backgroundColor: Colors.red, child: Icon(Icons.plus_one, color: Colors.white),),
           onTap:  () => setState(() => cards.add(createCard(0,''))),
            )
          ],
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
        //  Row(
        // children: <Widget>[  Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: RaisedButton(
        //       child: Text('add new'),
        //       onPressed: () => setState(() => cards.add(createCard(0,''))),
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: RaisedButton(
        //       child: Text('remove '),
        //       onPressed: () => setState(() => cards.remove(--cards.length)),
        //     ),
        //   )]),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}
class Examinerapi {
  final String examinerTypeId;
  final int id;
  final String remark;

  Examinerapi(this.examinerTypeId, this.id, this.remark);

  String toString() {
    return 'examinerTypeId= $examinerTypeId, id= $id, remark= $remark';
  }
 factory Examinerapi.fromJson(dynamic json) {
    return Examinerapi(json['examinerTypeId'] as String, json['id'] as int,json['remark'] as String,);
  }
  Map<String, dynamic> toJson() => {
        "examinerTypeId": examinerTypeId,
        "id": id,
        "remark": remark,
      };
}


