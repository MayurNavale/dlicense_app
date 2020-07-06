
import 'uplodedata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'ratingCertificateEndorsementOptions.dart';
import 'model.dart';
 class MyItem {
  bool isExpanded;
  final String header;
  bool ir = false;
  bool co_Pilot = false;
  MyItem({this.isExpanded: false, this.header, this.ir, this.co_Pilot});
  }
class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
  }
  Color c1 = const Color(0xCFCFCF);
  DateTime _dateTime;
  bool additionalratingIR=false;
 
class _Licencepage extends State<Licencepage> {
  List<MyItem> _items = <MyItem>[new MyItem(header: ' Additional Ratings')];
  List<MyItem> _insts = <MyItem>[new MyItem(header: ' Instructors')];
  List<MyItem> _examiner = <MyItem>[new MyItem(header: ' Examiners')];
  List<MyItem> _rating = <MyItem>[new MyItem(header: ' Rating certificate endorsement')];
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
                   _contries(), 
                   _licenceCodeOptions(),
                   _licenceNumber(),
                   _titleOfLicenceOptions(),
                   _dateOfInitialIssue(),
                   _countryCodes(),
                   _dateofratingtest(),
                   _dateofIRtest(),
                   _validuntil(),
                   _examinerscertificatenumber(),
                   _classOptions(),
                   _tpyeOptionData(),
                   _ir(),
                   _coPilot(),
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
                            child: Column(
                            children: [
                              Expanded( child: _addtiionalratingclassOptions(), ),
                              Expanded(child:_additionalratingtpyeOptionData()),
                              Expanded( child: _additionalratingIR(), ),
                              Expanded( child: _additionalratingcoPilot(), ),
                              Expanded( child: _remarksandRestrictions(), ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() { _insts[index].isExpanded = !_insts[index].isExpanded;});
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
                              Expanded(child: _instructorsOptions(), ),
                              Expanded(child: _instructorremarksandRestrictions(), ),
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
                              Expanded( child: _examiners(), ),
                              Expanded( child: _examinarRemarksandRestrictions(), ),
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
                              Expanded(child: _ratingcertificateendorsement(),  ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),  
                  FlatButton(
                    color:Colors.yellow,
                    child: Text('Save'),
                    textColor:Colors.black,
                    onPressed: () { Navigator.push(
                context,MaterialPageRoute(builder: (context) => ClassModal()),
                  );} 
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
        underline: Container(height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {
            ratingcertificateendorsement = newValue;
            print('  $ratingcertificateendorsement');
          });
        },
         items: licensetitlesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['title']),
              value: item['id'].toString(),);
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
            print('classOptions  $classOptions');
          });
        },
        items:licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
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
            print('addtiionalratingclassOptions$addtiionalratingclassOptions');
          });
        },
        items:licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
          );
        }).toList(),
        value: addtiionalratingclassOptions,
      ),
    );
  }
  Widget _ir() {
    return ListTile(
      leading: Checkbox(
        hoverColor: Colors.deepPurpleAccent,
        value: ir,
        onChanged: (bool newValue) { setState(() { ir = newValue;}); },
      ),
      title: Text('IR'),
    );}
  Widget _additionalratingIR() {
    return ListTile(
        leading: Checkbox(
        hoverColor: Colors.deepPurpleAccent,
        value: additionalratingIR,
        onChanged: (bool newValue) {setState(() { additionalratingIR = newValue;});},
      ),
      title: Text('IR'),
    );}
  Widget _coPilot(){
    return ListTile(
        leading: Checkbox(hoverColor: Colors.deepPurpleAccent,
        value: co_Pilot,
        onChanged: (bool newValue) { setState(() { co_Pilot = newValue; }); },
      ),
      title: Text('Co_Pilot'),
    );
  }
  Widget _additionalratingcoPilot(){
    return ListTile(
      leading: Checkbox(
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
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {
            examiners = newValue;
            print(' examiners  $examiners');
          });
        },
        items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
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
              print('contries  $contries');
            });
          },
          items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['id'].toString(),
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
       
          print('licenceCodeOptions $licenceCodeOptions');});
        },
        items: licensecodesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['code']),
              value: item['id'].toString(),
            
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
          print('titleOfLicenceOptions$titleOfLicenceOptions');});
        },
        items: licensetitlesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['title']),
              value: item['id'].toString(),
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
                  dt_irtest=dateofIRtest.toString();
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
            countryCodes = newValue;print('countryCodes$countryCodes');
          });
        },
        items:countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryName']),
              value: item['id'].toString(),
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
            tpyeOptionData = newValue;print('tpyeOptionData $tpyeOptionData');
          });
        },
        items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['id'].toString(),
            );
        }).toList(),
        value: tpyeOptionData,
      ),
    );}
  Widget _additionalratingtpyeOptionData() {
    return ListTile(
        leading: Text('Type'),
        title: DropdownButton<String>(
        hint: Text('Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container( height: 2,color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {
            additionalratingtpyeOptionData = newValue;
     print('additionalratingtpyeOptionData $additionalratingtpyeOptionData'); });
        },
        items:licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['id'].toString(),
            );
        }).toList(),
        value: additionalratingtpyeOptionData,
      ),
    );}
  Widget _instructorsOptions() {
    return ListTile(
        leading: Text('Instructors :'),
        title: DropdownButton<String>(
        hint: Text('Type'),
        icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(height: 2, color: Colors.deepPurpleAccent,),
        onChanged: (String newValue) {
           setState(() {
            instructorsOptions = newValue;
            print('instructorsOptions $instructorsOptions'); });
           },
        items: <String>[
           'FE(A)',
            'FE(H)',
            'FE(As)',
            'FE(S)',
            'FE(B)',
            'TRE(A)',
            'TRE(PL)',
            'TRE(H)',
            'CRE',
            'IRE(A)',
            'IRE(H)',
            'IRE(As)',
            'SFE(A)',
            'SFE(PL)',
            'SFE(H)',
            'FIE(A)',
            'FIE(H)',
            'FIE(As)',
            'FIE(S)',
            'FIE(B)'
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

