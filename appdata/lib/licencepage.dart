

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'ratingCertificateEndorsementOptions.dart';


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected option"),
      ),
      body: Container(
        padding: new EdgeInsets.all(10.0),

        child: ListView(
          children:[
            Text('State of issue: $contries'),
            Text('Licence code : $licenceCodeOptions'),
            Text('Licence numbe:  $licence_Number'),
            Text('Title of licence: $titleOfLicenceOptions'),
            Text('Date of Initial Issue:  $dateOfInitialIssue'),
            Text('Issued By(Countr code: $countryCodes'),
           // Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
            Text('Date of rating test:  $dateofratingtest'),
            Text('Date of IR test:  $dateofIRtest'),
            Text('Valid until  :  $validuntil'),
            Text('Examiners certificate number : $examinerscertificatenumber'),
            Text('Class:$classOptions'),
            Text('Type :$tpyeOptionData'),
            Text('IR :$ir'),Text('Co-Pilot :$co_Pilot'),
            Text('--------------------'),
            Text('Additional Ratings'),
            Text('Class :$addtiionalratingclassOptions'),
            Text('Type:$additionalratingtpyeOptionData'),
            Text('IR :$additionalratingIR'),
            Text('Co-Pilot :$additionalratingcoPilot'),
            Text('Remarks and Restrictions :$remarksandRestrictions'),
            Text('-----------------'),
            Text('Instructor'),
            Text('Instructor :$instructorsOptions'),
            Text('Remarks and Restrictions :$instructorremarksandRestrictions'),
            Text('---------------'),
            Text('Examiners :'),Text('Examiners :$examiners'),Text('Remarks and Restrictions :$examinarRemarksandRestrictions'),
            Text('---------------'),
            Text('Rating certificate endorsement :$ratingcertificateendorsement'),



            FlatButton(
              color:Colors.yellow,
              child: Text('Done'),
              textColor:Colors.black,
              onPressed: () {

              },

            ),


          ],
        ),
      ),

    );
  }
}

class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
}

bool additionalratingIR=false;
// stores ExpansionPanel state information
Color c1 = const Color(0xCFCFCF);
var dateOfInitialIssue;
var dateofIRtest;
String contries;
String licenceCodeOptions;
String titleOfLicenceOptions;
var dateofratingtest;

String licence_Number;
String countryCodes;
//ring examinerscertificatenumber;
String _class;
String tpyeOptionData;
bool ir = false;
bool co_Pilot = false;
bool additionalratingcoPilot=false;
String licenceNumber;
String classOptions;
var additionalLicenceNumber;
var validuntil;
var examinerscertificatenumber;
var instructorsOptions;
var remarksandRestrictions;
String examinarRemarksandRestrictions;
var examiners;
String ratingcertificateendorsement;
String addtiionalratingclassOptions;
String additionalratingtpyeOptionData;
String instructorremarksandRestrictions;
DateTime _dateTime;

class MyItem {
  MyItem({this.isExpanded: false, this.header, this.ir, this.co_Pilot});

  bool isExpanded;
  final String header;
  bool ir = false;
  bool co_Pilot = false;
}

class _Licencepage extends State<Licencepage> {
  List<MyItem> _items = <MyItem>[new MyItem(header: ' Additional Ratings')];
  List<MyItem> _insts = <MyItem>[new MyItem(header: ' Instructors')];
  List<MyItem> _examiner = <MyItem>[new MyItem(header: ' Examiners')];
  List<MyItem> _rating = <MyItem>[
    new MyItem(header: ' Rating certificate endorsement')
  ];
  List<String> _classoptiondata =
  <String>[
    'SEP (land)',
    'SEP (sea)',
    'MEP (land)',
    'MEP (sea)',
  ];
  @override
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text('Licence'),
        ),
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return ListView(

                padding: new EdgeInsets.all(2.0),
                children: [
                  Container(
                    child: _contries(),
                  ),
                  Container(
                    child: _licenceCodeOptions(),
                  ),
                  Container(
                    child: _licenceNumber(),
                  ),
                  Container(
                    child: _titleOfLicenceOptions(),
                  ),
                  Container(
                    child: _dateOfInitialIssue(),
                  ),
                  Container(
                    child: _countryCodes(),
                  ),
                  Container(
                    child: _dateofratingtest(),
                  ),
                  Container(
                    child: _dateofIRtest(),
                  ),
                  Container(
                    child: _validuntil(),
                  ),
                  Container(
                    child: _examinerscertificatenumber(),
                  ),
                  Container(child: _classOptions(),
                  ),
                  Container(
                    child: _tpyeOptionData(),
                  ),
                  Container(
                    child: _ir(),
                  ),
                  Container(
                    child: _coPilot(),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _items[index].isExpanded = !_items[index].isExpanded;
                      });
                    },
                    children: _items.map((MyItem item) {
                      return new ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return new Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(item.header),
                          );
                        },
                        isExpanded: item.isExpanded,
                        body: Container(
                          height: 260.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: _addtiionalratingclassOptions(),
                              ),Expanded(child:_additionalratingtpyeOptionData()),
                              Expanded(
                                child: _additionalratingIR(),
                              ),
                              Expanded(
                                child: _additionalratingcoPilot(),
                              ),
                              Expanded(
                                child: _remarksandRestrictions(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {

                        _insts[index].isExpanded = !_insts[index].isExpanded;
                      });
                    },
                    children: _insts.map((MyItem item) {
                      return new ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return new Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(item.header),
                          );
                        },
                        isExpanded: item.isExpanded,
                        body: Container(
                          height:150.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: _instructorsOptions(),
                              ),
                              Expanded(
                                child: _instructorremarksandRestrictions(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _examiner[index].isExpanded = !_examiner[index].isExpanded;
                      });
                    },
                    children: _examiner.map((MyItem item) {
                      return new ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return new Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(item.header),
                          );
                        },
                        isExpanded: item.isExpanded,
                        body: Container(
                          height: 160.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: _examiners(),
                              ),
                              Expanded(
                                child: _examinarRemarksandRestrictions(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _rating[index].isExpanded = !_rating[index].isExpanded;
                      });
                    },
                    children: _rating.map((MyItem item) {
                      return new ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return new Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(item.header),
                          );
                        },
                        isExpanded: item.isExpanded,
                        body: Container(
                          height: 60.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: _ratingcertificateendorsement(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),  FlatButton(
                    color:Colors.yellow,
                    child: Text('Save'),
                    textColor:Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>SecondRoute()),
                      );
                    },

                  ),
                ],
              );
            },
          ),)
    );
  }
  Widget _ratingcertificateendorsement() {
    return ListTile(

      leading: Text('Rating :'),
      title: DropdownButton<String>(
        hint: Text('Rating certificate endorsementr:'),
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            ratingcertificateendorsement = newValue;
          });
        },
        items: <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: ratingcertificateendorsement,
      ),
    );
  }
  Widget _classOptions() {
    return ListTile(
      trailing: Icon(Icons.delete),
      leading: Text('Class'),
      title: DropdownButton<String>(
        hint: Text('Class Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            classOptions = newValue;
          });
        },
        items:_classoptiondata.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: classOptions,
      ),
    );
  }
  Widget _addtiionalratingclassOptions() {
    return ListTile(
      trailing: Icon(Icons.delete),
      leading: Text('Class'),
      title: DropdownButton<String>(
        hint: Text('Options'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            addtiionalratingclassOptions = newValue;
          });
        },
        items:_classoptiondata.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: addtiionalratingclassOptions,
      ),
    );
  }
  Widget _ir() {
    return ListTile(
      leading: Checkbox(
        //checkColor :Colors.deepPurpleAccent,
        hoverColor: Colors.deepPurpleAccent,
        value: ir,
        onChanged: (bool newValue) {
          setState(() { ir = newValue;});
        },
      ),
      title: Text('IR'),
    );}
  Widget _additionalratingIR() {
    return ListTile(
      leading: Checkbox(
        //checkColor :Colors.deepPurpleAccent,
        hoverColor: Colors.deepPurpleAccent,
        value: additionalratingIR,
        onChanged: (bool newValue) {
          setState(() { additionalratingIR = newValue;});
        },
      ),
      title: Text('IR'),
    );}
  Widget _coPilot(){
    return ListTile(
      leading: Checkbox(
        //checkColor :Colors.deepPurpleAccent,
        hoverColor: Colors.deepPurpleAccent,
        value: co_Pilot,
        onChanged: (bool newValue) {
          setState(() {
            co_Pilot = newValue;
          });
        },
      ),
      title: Text('Co_Pilot'),
    );
  }
  Widget _additionalratingcoPilot(){
    return ListTile(
      leading: Checkbox(
        //checkColor :Colors.deepPurpleAccent,
        hoverColor: Colors.deepPurpleAccent,
        value: additionalratingcoPilot,
        onChanged: (bool newValue) {
          setState(() {
            additionalratingcoPilot = newValue;
          });
        },
      ),
      title: Text('Co_Pilot'),
    );
  }
  Widget _examiners() {
    return ListTile(
      trailing: Icon(Icons.delete),
      leading: Text('Examiners'),
      title: DropdownButton<String>(
        hint: Text('Options'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            examiners = newValue;
          });
        },
        items: <String>[
          'SEP (land)',
          'SEP (sea)',
          'MEP (land)',
          'MEP (sea)',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: examiners,
      ),
    );
  }
  Widget additionalLicenceNumberdata() {
    return ListTile(
        //autofocus: true,
        leading: Text('Licence number  :'),
        title: TextField(
          decoration: InputDecoration(hintText: 'Licence number:'),
          onSubmitted: (String newValue) {
            setState(() {
              additionalLicenceNumber = newValue;
            });
          },
        ));
  }
  Widget _remarksandRestrictions() {
    return ListTile(
        //autofocus: true,
        leading: Text('Remarks and\n Restrictions :'),
        title: TextField(
          decoration: InputDecoration(hintText: 'Remarks and Restrictions:'),
          onSubmitted: (String newValue) {
            setState(() {
              remarksandRestrictions = newValue;
            });
          },
        ));
  }
  Widget _instructorremarksandRestrictions() {
    return ListTile(
       // autofocus: true,
        leading: Text('Remarks and \nRestrictions :'),
        title: TextField(
          decoration: InputDecoration(hintText: 'Remarks and Restrictions:'),
          onSubmitted: (String newValue) {
            setState(() {
              instructorremarksandRestrictions = newValue;
            });
          },
        ));
  }
  Widget _contries() {
    return ListTile(
        //autofocus: true,
        leading: Text('State of issue  :'),
        title: DropdownButton<String>(
          hint: Text('State '),
          icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              contries = newValue;
            });
          },
          items: <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: contries,
        ));
  }
  Widget _licenceCodeOptions() {
    return ListTile(
      //autofocus: true,
      leading: Text('LicenceCode  :'),
      title: DropdownButton<String>(
        hint: Text('licence code'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            licenceCodeOptions = newValue;
          });
        },
        items: <String>[
          'AD.FCL.'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: licenceCodeOptions,
      ),
    );
  }
  Widget _examinarRemarksandRestrictions() {
    return ListTile(
        //autofocus: true,
        leading: Icon(IconData(59702, fontFamily: 'MaterialIcons')),
        title: TextField(
          decoration: InputDecoration(hintText: 'Remarks and Restrictions:'),
          onSubmitted: (String newValue) {
            setState(() {
              examinarRemarksandRestrictions = newValue;
            });
          },
        ));
  }

  Widget _licenceNumber() {
    return ListTile(
        //autofocus: true,
        leading: Text('Licence number  :'),
        title: TextField(
          decoration: InputDecoration(hintText: 'Licence number:'),
          onSubmitted: (String newValue) {
            setState(() {
              licence_Number = newValue;
            });
          },
        ));
  }

  Widget _examinerscertificatenumber() {
    return ListTile(
        //autofocus: true,
        leading: Text('Examiners certificate number :'),
        title: TextField(
          decoration: InputDecoration(hintText: 'Licence number:'),
          onSubmitted: (String newValue) {
            setState(() {
              examinerscertificatenumber = newValue;
            });
          },
        ));
  }

  Widget _titleOfLicenceOptions() {
    return ListTile(
      leading: Text('Title of licence  :'),
      title: DropdownButton<String>(
        hint: Text('Title'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            titleOfLicenceOptions = newValue;
          });
        },
        items: <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: titleOfLicenceOptions,
      ),
    );
  }

  Widget _dateOfInitialIssue() {
    return ListTile(
      leading: Text('Date of initial issue : '),

      title: Container(
        child: Row(
          children: [
            Expanded(child:  Text(dateOfInitialIssue == null ? 'Pick' :dateOfInitialIssue.toString()),),
            IconButton(

              icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
              color: Colors.deepPurple,
              onPressed: () {
                showDatePicker(

                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                    dateOfInitialIssue =  new DateFormat.yMMMMd().format(date);
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateofratingtest() {
    return ListTile(
      leading: Text('date Of Rating Test'),
      title: Container(
        child: Row(
          children: [
            Expanded(child:    Text(dateofratingtest == null ? 'pick' : dateofratingtest.toString()),),
            IconButton(
              icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
              color: Colors.deepPurple,
              onPressed: () {

                showDatePicker(

                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                    dateofratingtest =  new DateFormat.yMMMMd().format(date);
                  });
                });              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateofIRtest() {
    return ListTile(
      leading: Text('Date of IR Test : '),
      title: Container(
        child: Row(
          children: [
            Expanded(child:  Text(dateofIRtest == null ? 'Pick' : dateofIRtest.toString()),),
            IconButton(
              icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
              color: Colors.deepPurple,
              onPressed: () {
                showDatePicker(

                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {

                    dateofIRtest = new DateFormat.yMMMMd().format(date);
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _validuntil() {
    return ListTile(
      leading: Text('Date of initial issue : '),
      title: Container(
        child: Row(
          children: [
            Expanded(child:  Text(validuntil == null ? 'Pick' : validuntil.toString()),),
            IconButton(
              icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
              color: Colors.deepPurple,
              onPressed: () {

                showDatePicker(

                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                    validuntil =  new DateFormat.yMMMMd().format(date);
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _countryCodes() {
    return ListTile(
      leading: Text('Issued by :   '),
      title: DropdownButton<String>(
        hint: Text('country code'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            countryCodes = newValue;
          });
        },
        items:  <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: countryCodes,
      ),
    );
  }

  Widget _tpyeOptionData() {
    return ListTile(
      leading: Text('Type'),
      title: DropdownButton<String>(
        hint: Text('Option'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            tpyeOptionData = newValue;
          });
        },
        items: <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: tpyeOptionData,
      ),
    );
  }
  Widget _additionalratingtpyeOptionData() {
    return ListTile(
      leading: Text('Type'),
      title: DropdownButton<String>(
        hint: Text('Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            additionalratingtpyeOptionData = newValue;
          });
        },
        items: <String>[
          'LAPL(A)',
          'LAPL(H)',
      
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: additionalratingtpyeOptionData,
      ),
    );
  }

  Widget _instructorsOptions() {
    return ListTile(
      leading: Text('Instructors :'),
      title: DropdownButton<String>(
        hint: Text('Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            instructorsOptions = newValue;
          });
        },
        items: <String>[
          'FI(A)',
          'FTI',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: instructorsOptions,
      ),
    );
  }





}

