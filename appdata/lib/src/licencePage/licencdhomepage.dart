


import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'model.dart';


class Licencepagehome extends StatefulWidget {
  @override
  _LicencepagehomeState createState() => _LicencepagehomeState();
}

class _LicencepagehomeState extends State<Licencepagehome> {
 
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                      bool _autoValidate = false;
                      var myFormat = DateFormat('yyyy-MM-dd'); 
                      var myFormadme = DateFormat('dd-MM-yyyy');
                      String languageString;
                      final TextEditingController _controller = new TextEditingController();
                      Welcome saveLicenseData=new Welcome();
                      LicenseDetail licenseDetail=new LicenseDetail(); 
                     // Personneldata personal=new Personneldata();
                      final dtirtest = new TextEditingController();
                      final dtissue = new TextEditingController();  
                      final dtratingtest = new TextEditingController(); 
                      final dtvalidity = new TextEditingController();    
                      String a;
                      bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
        appBar: new AppBar(
          
          title: new Text('    Language'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child:formUI(),
            ),
          ),
        ),
      ),
    );
  }
   Widget formUI() {
       return  Column(
      children: <Widget>[
            _contries(), 
         _licenceCodeOptions(),
          _licenceNumber(),
         _dateOfInitialIssue(),
          _countryCodes(),
          _dateofratingtest(),
           _dateofIRtest(),
           _validuntil(),
           _examinerscertificatenumber(),
           _classOptions(),
           _tpyeOptionData(),
           _ir(),
          _co_Pilot(),
                  
        
        showdata()
        
        
        
   
      ]
     );
     
   }
  
   Widget _contries() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'State of issue * ',
      hintText:'Select State',
       ),
              value: contries,
              onChanged: (String newValue) =>setState(() => contries = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveLicenseData.countryId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['id'].toString(),
            );
          }).toList(),
        );
     }  
  
  ///////////////
    Widget _licenceCodeOptions() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:'LicenceCode * ',
         hintText:'Select LicenceCode',
       ),
              value: licenceCodeOptions,
              onChanged: (String newValue) =>setState(() => licenceCodeOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) { saveLicenseData.codeId=int.parse(val);
               saveLicenseData.stateId=int.parse(val);
               saveLicenseData.titleId=int.parse(val);
               saveLicenseData.ratingCertId=val.toString();
               saveLicenseData.examinerId=int.parse(val);},
              items: licensecodesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['code']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  ///////////////////
      Widget _licenceNumber() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  saveLicenseData.licenseNumber=int.parse(val),
        );
}
  
  /////////////
    Widget _dateOfInitialIssue() {
     return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
               hintText: ' Select Date of initial issue :',
 labelText: 'Date of initial issue :',
            ),
            controller: dtissue,
            keyboardType: TextInputType.datetime,
            // validator: (val) =>
            //  isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>saveLicenseData.dtIssue =dateOfInitialIssue.toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
              showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                    ).then((date) {
                  setState(() {
                    dateOfInitialIssue= myFormat.format(date);
                  dtissue.text = myFormadme.format(date); 
          //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }

 ////////////////
 /// 
 ///  
 Widget _countryCodes() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Country Codes   ',
         hintText:'country Code',
       ),
              value: countryCodes,
              onChanged: (String newValue) =>setState(() => countryCodes = newValue),
              validator: (value) => value == null ? 'field required' : null,
           onSaved: (val) =>  saveLicenseData.codeId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryName']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  //////////////////////
   Widget _dateofratingtest () {
    return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                 hintText: ' Selectdate Of Rating Test ',
              labelText: 'Date of date Of Rating Test :',
            ),
         controller: dtratingtest,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>saveLicenseData.dtRatingtest=dateofratingtest.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
              showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtratingtest.text=   myFormadme.format(date);
                  dateofratingtest = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  
  ////////////////
   Widget _dateofIRtest () {
    return    Row(
      children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                      hintText: ' Select Date of IR Test ',
         labelText: 'Date of IR Test ',
            ),
         controller: dtirtest,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>saveLicenseData.dtIrtest=dateofIRtest.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
               showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtirtest.text=  myFormadme.format(date);
                  dateofIRtest = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  //////////////////
   Widget _validuntil  () {
    return   new Row(children: <Widget>[
          new Expanded(
              child: new TextFormField(
            decoration: new InputDecoration(
                hintText: ' Select Date',
         labelText: 'Valid upto ',
            ),
         controller: dtvalidity,
            keyboardType: TextInputType.datetime,
        //  validator: (val) =>
        //      isValidDob(val) ? null : 'Not a valid date',
            onSaved: (val) =>saveLicenseData.dtValidity=validuntil.toString(),//convertToDate(val).toString(),
          )),
          new IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Choose date',
            onPressed: (() {
               showDatePicker(

                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2200)
                ).then((date) {
                  setState(() {
                  dtvalidity.text=  myFormadme.format(date); 
                  validuntil = myFormat.format(date);

            //new DateFormat.yMMMMd().format(date);
                  });
                }); 
            }),
          )
        ]);
  }
  
  /////////////////////
     Widget _examinerscertificatenumber() { 
      return TextFormField(
           decoration: InputDecoration(  hintText: 'Enter Licence number',
           labelText: 'Examiners certificate number '),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  saveLicenseData.examinerNumber=int.parse(val),
        );
}
  
//   ///////////////
  
    Widget _classOptions() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Class  * ',
         hintText:'class Name',
       ),
              value: classOptions,
              onChanged: (String newValue) =>setState(() => classOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  licenseDetail.classId=int.parse(val),
              items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  
//   /////////////////////////
    Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:' Type * ',
      hintText:'Select Type',
       ),
              value: tpyeOptionData,
              onChanged: (String newValue) =>setState(() => tpyeOptionData = newValue),
              validator: (value) => value == null ? 'field required' : null,
          onSaved: (val) =>  licenseDetail.typeId=int.parse(val),
              items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  
 
//  /////////
  Widget _ir(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('IR'),
               controlAffinity: ListTileControlAffinity.leading,
              value: ir,
              onChanged: (bool value) { 
                setState(() =>ir= value);
                licenseDetail.ir=ir;
              },  
        
             
            );
  }
//  /////////
 Widget _co_Pilot(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Co_Pilot'),
               controlAffinity: ListTileControlAffinity.leading,
              value: co_Pilot,
              onChanged: (bool value) { 
                setState(() =>co_Pilot= value);
                licenseDetail.copilot=ir;
              },  
        
             
            );
  }
  //////////////
  
  
  
  
  
  
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
  
  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
}


  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
var initialDate =convertToDate(initialDateString) ?? now;
  //initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2060));
    if (result == null) return;

    setState(() {
      _controller.text =DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try 
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }
  
  /////////////////////////////////////////////////////////////////
   void reset() {

   _formKey.currentState.reset();
}
  void _validateInputs() {
    print(licensecodesdatalist);
    print(countriesdatalist);
    print(airlinedatalist);
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//     postdata(  saveLicenseData,licenseDetail);
//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
}
}