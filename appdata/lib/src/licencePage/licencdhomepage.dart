


import 'package:appdata/src/licencePage/endorsementDetailsPage.dart';
import 'package:appdata/src/licencePage/examinardetailpage.dart';
import 'package:appdata/src/licencePage/instructorpage.dart';
import 'package:intl/intl.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class Licencepagehome extends StatefulWidget {
  @override
  _LicencepagehomeState createState() => _LicencepagehomeState();
}

class _LicencepagehomeState extends State<Licencepagehome> {
 
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                      bool _autoValidate = false;
                      bool checkboxValue=false;
                      String initialnumber;
                      String languageString;
                      var saveFormat = DateFormat('yyyy-MM-dd'); 
                      var showformmat = DateFormat("dd-MM-yyyy");
                       final dateFormat = DateFormat("dd-MM-yyyy");
                      Licenceclass saveLicenseData= new Licenceclass();
                     // Licenceclass apiLicencddata=new Licenceclass();//.fromJson(jsonstring);
                      LicenseDetail licenseDetail=new LicenseDetail(); 
                      LicenseDetail additionallicenseDetail=new LicenseDetail(); 
                      //final TextEditingController _controller = new TextEditingController();
                     // Licenceclass apiLicencddata=new Licenceclass(); UserClass userdata = UserClass.fromJson(jsonstring);
                        List<Examinerapi> examinerapiplist=[];
                        List examinerdatafrompage;
                        List<Instructorapi> instructorapiplist=[];
                        List instructordatafrompage;  
                        List<EndorsementAPI> endorsementApipList=[];
                        List endorsementDataFromPage;
                     // Personneldata personal=new Personneldata();
                      final dtirtest = new TextEditingController();
                      final dtissue = new TextEditingController();  
                      final dtratingtest = new TextEditingController(); 
                      final dtvalidity = new TextEditingController();    
                      String a;
                      String licencenumber='';
                      DateTime initialdateval;
                      Future<int>futureLicenceclass;
                      // Future<Album> futureAlbum;
                       Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
                  showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2200)
                            ).then((date) {
                            setState(() {
                            datecontroller.text= a =date.toString();
                      //new DateFormat.yMMMMd().format(date);
                     }); }); 
  }
bool visibilityTag=false;
  @override
  void initState() {
    super.initState();
  futureLicenceclass = getlicencddata();
 print(saveLicenseData.licenseNumber);
  }
var _valuedrop;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(title: new Text('Licence'),
       
       actions: <Widget>[_action(context), ]),
     
       body: Center(
          child: FutureBuilder<int>(
            future: futureLicenceclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
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
   ),
  ),
 );
 }


 /////////////////
   Widget formUI() {
       return  Column(
      children: <Widget>[
          _contries(), 
           _licenceCodeOptions(),
           _licenceNumber(),
           _licencetitleOptions(),
           _dateOfInitialIssue(),
           _countryCodes(),
           _dateofratingtest(),
           _dateofIRtest(),
           _validuntil(),
           SizedBox(height: 3, child: Container(color: Colors.grey[200],)),
          
           _examinerscertificatenumber(),
            _licenceCodeOptionsforExaminer(),
           SizedBox(height: 3, child: Container(color: Colors.grey[200],)),
           _classOptions(),
           _tpyeOptionData(),
           _ir(),
           _co_Pilot(),
           remarkAndRes(), SizedBox(height: 3, child: Container(color: Colors.grey[200],)),
           _additionalDetails(),
            SizedBox(height: 3, child: Container(color: Colors.grey[200],)),
           FlatButton(
                child: Text('Instructor          '),
                onPressed: () async {
                String inst = await Navigator.push( 
                context, MaterialPageRoute( builder: (context) =>Instructorpage(instructorapiplist), ), );
                if (inst != null) {
                   instructordatafrompage = jsonDecode(inst) as List;
                   instructorapiplist = instructordatafrompage.map((i)=>Instructorapi.fromJson(i)).toList();} }),
          FlatButton(
               child: Text('Examiner        '),
               onPressed: () async {
               String resevedExaminer = await Navigator.push( context, MaterialPageRoute( builder: (context) =>ExaminarPage (examinerapiplist), ),);
               if (resevedExaminer != null) {
                examinerdatafrompage = jsonDecode(resevedExaminer) as List;
                examinerapiplist = examinerdatafrompage.map((i)=>Examinerapi.fromJson(i)).toList();
              print(examinerapiplist);}}),
          FlatButton(
              //color:ment Colors.grey[300],
              child: Text('Endorsement          '),
              onPressed: () async {
              String endorsement = await Navigator.push( context, MaterialPageRoute( builder: (context) =>EndorsementPage(endorsementApipList), ), );
                if (endorsement != null) {
                endorsementDataFromPage = jsonDecode(endorsement) as List;
                endorsementApipList = endorsementDataFromPage.map((i)=>EndorsementAPI.fromJson(i)).toList();
              print(endorsementApipList);} },  ),
                visibilityTag ? _onDone(): new Container(color: Colors.blue[300],),
           showdata()
        
         ]
     );
     
   }
  
   Widget _contries()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' State of Issue * ',
      
      ),
      value: findval( saveLicenseData.stateId,1), //
       onChanged: (String newValue){saveLicenseData.countryId=saveLicenseData.stateId;
               saveLicenseData.stateId=saveLicenseData.stateId;
       },// => setState(() => contries = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.stateId = saveLicenseData.stateId,
        items: statedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['stateName']),
              value: item['stateName'].toString(),
               onTap: () {
            print( item['id']);
            saveLicenseData.stateId = item['id'];
          },
            );
          }).toList(),
    );
  }
  // 
  ///////////////
   Widget _licenceCodeOptions() { 
       return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: ' LicenceCode * ',
      
      ),
      value: findval( saveLicenseData.codeId,2), //
      onChanged: (String newValue){saveLicenseData.codeId=saveLicenseData.codeId;},// => setState(() => licenceCodeOptions = newValue),// => setState(() => licenceCodeOptions = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.codeId = saveLicenseData.codeId,
       items: licensecodesdatalist.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['code']),
          value: item['code'].toString(),
          onTap: () {
            print( item['id']);
            saveLicenseData.codeId = item['id'];
          },
        );
      }).toList(),
    );
  }
    
// //   ///////////////////
      Widget _licenceNumber() { 
      return TextFormField(
          initialValue:initialnumber??saveLicenseData.licenseNumber.toString(),
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
           onChanged: (String newValue) { saveLicenseData.licenseNumber=int.parse(newValue);},
          onSaved: (val) =>  saveLicenseData.licenseNumber=int.parse(val),
        );
}
////////////////
   Widget _licencetitleOptions() { 
       return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: ' Title of Lisence * ',),
      value: findval( saveLicenseData.titleId,8), //
      onChanged: (String newValue){saveLicenseData.titleId=saveLicenseData.titleId;},// => setState(() => licenceCodeOptions = newValue),// => setState(() => licenceCodeOptions = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.titleId = saveLicenseData.codeId,
       items: licensetitlesdatalist.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['title']),
          value: item['title'].toString(),
          onTap: () {
            print( item['id']);
            saveLicenseData.titleId = item['id'];
          },
        );
      }).toList(),
    );
  }
    
  /////////////
    Widget _dateOfInitialIssue() {
       return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of initial issue  *',
            suffixIcon : Icon(Icons.calendar_today),
           // hintText: '$dateOfInitialIssue'
           ),
            format: dateFormat,
            initialValue:dateOfInitialIssue,//DateTime.parse(saveLicenseData.dtIssue),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateOfInitialIssue = dt);
                        print('Selected date: $dateOfInitialIssue');},
            onSaved: (value) {saveLicenseData.dtIssue= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
       );
  }

 ////////////////
 /// 
//  ///  
 Widget _countryCodes() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Country Codes   ',
         hintText:'country Code',
       ),
              value: findval( saveLicenseData.countryId,3),
              onChanged: (String newValue) =>setState(() => countryCodes = newValue),
              validator: (value) => value == null ? 'field required' : null,
         //  onSaved: (val) =>  saveLicenseData.codeId=int.parse(val),
              items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryName']),
              value: item['countryName'].toString(),
              
            );
          }).toList(),
        );}
//   //////////////////////
   Widget _dateofratingtest () {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dateofratingtest,//DateTime.parse(saveLicenseData.dtRatingtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateofratingtest = dt);
                        print('Selected date: $dateofratingtest');},
            onSaved: (value) {saveLicenseData.dtRatingtest= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
   
  }
  
//   ////////////////
   Widget _dateofIRtest () {
      return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Date of date Of Rating Test',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:dateofIRtest,//DateTime.parse(saveLicenseData.dtIrtest),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => dateofIRtest = dt);
                        print('Selected date: $dateofIRtest');},
            onSaved: (value) {saveLicenseData.dtIrtest= saveFormat.format(dateofIRtest);value.toString();
              debugPrint(value.toString());},
      );
    
  }
//   //////////////////
   Widget _validuntil  () {
     return DateTimeField(
            //  dateOnly: true,
            decoration: InputDecoration(labelText: 'Valid upto',
            suffixIcon : Icon(Icons.calendar_today),),
           // hintText: '$dateOfInitialIssue'),
            format: dateFormat,
            initialValue:validuntil,//DateTime.parse(saveLicenseData.dtValidity),
            onShowPicker: (context, currentValue) {
                          return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:  DateTime.now(),
                          lastDate: DateTime(2100));
                    },
            validator: (val) {if (val != null) {return null; } else {return 'Date Field is Empty'; }},
            onChanged: (dt) { setState(() => validuntil = dt);
                        print('Selected date: $dateofratingtest');},
            onSaved: (value) {saveLicenseData.dtValidity= saveFormat.format(value);value.toString();
              debugPrint(value.toString());},
      );
    //
  }
  //////////////////////
  Widget _licenceCodeOptionsforExaminer(){
    return  DropdownButtonFormField<String>(
      decoration: InputDecoration(  labelText: ' Licence Code * ',),
      value: findval( saveLicenseData.examinerId,9), //
      onChanged: (String newValue){saveLicenseData.examinerId=saveLicenseData.examinerId;},// => setState(() => licenceCodeOptions = newValue),// => setState(() => licenceCodeOptions = newValue),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.examinerId = saveLicenseData.codeId,
       items: licensecodesdatalist.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['code']),
          value: item['code'].toString(),
          onTap: () {
            print( item['id']);
            saveLicenseData.examinerId = item['id'];
          },
        );
      }).toList(),
    );
  }
  
  /////////////////////
      Widget _examinerscertificatenumber() { 
      return TextFormField(
        initialValue:initialnumber??saveLicenseData.examinerNumber.toString(),// licencenumber.toString(),
           decoration: InputDecoration(  hintText: 'Enter Licence number',
           labelText: 'Examiners certificate number '),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onChanged: (String newValue){saveLicenseData.examinerNumber=int.parse(newValue);},
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
              value: findval( licenseDetail.classId,4),
              onChanged: (String newValue) =>licenseDetail.classId=licenseDetail.classId,//setState(() => classOptions = newValue),
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
              items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['className'].toString(),
               onTap: () {
                  print( item['id']);
                  licenseDetail.classId = item['id'];
               },
            );
          }).toList(),
        );}
  var tpyeOptionDataone;
///////////////////////////
    Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Type * ',
      hintText:'Select Type',
       ),
              value:findval( licenseDetail.typeId,10),// tpyeOptionDataone,
              onChanged: (String newValue) { licenseDetail.typeId  = licenseDetail.typeId ;},
              validator: (value) => value == null ? 'field required' : null,
            onSaved: (val) =>  licenseDetail.typeId  = licenseDetail.typeId ,
              items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['typeName'].toString(),
                onTap: () {
                  print( item['id']);
                  licenseDetail.typeId = item['id'];
               },
            );
          }).toList(),
        );
        }
  
 
//  /////////
  Widget _ir(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('IR'),
               controlAffinity: ListTileControlAffinity.leading,
              value: licenseDetail.ir,
              onChanged: (bool value) { 
              setState(() =>licenseDetail.ir= value);
               // licenseDetail.ir=value;
              },  
        
             
            );
  }
//  /////////
 // ignore: non_constant_identifier_names
 Widget _co_Pilot(){
    return CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Co_Pilot'),
               controlAffinity: ListTileControlAffinity.leading,
              value: licenseDetail.copilot,
              onChanged: (bool value) { 
               //
                
               setState(() =>licenseDetail.copilot= value);
             //   licenseDetail.copilot=value;
              },  
        
             
            );
  }
 Widget remarkAndRes(){  
   return TextFormField(
           initialValue:initialnumber??saveLicenseData.remarks,// licencenumber.toString(),
           decoration: InputDecoration(  hintText: 'Remark and restriction',
           labelText: 'Remark and restriction '),
         // keyboardType: TextInputType.phone,
         // validator: licenceNumber,
          onChanged: (String newValue){saveLicenseData.remarks=newValue;},
          onSaved: (val) =>  saveLicenseData.remarks=val,
        );
 }
  //////////////
  ///
  Widget _additionalDetails(){
 return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:1.0),
            ExpansionTile(
              title: Text( "Additional Detail"),//, style: TextStyle( fontWeight: FontWeight.bold ),
              children: <Widget>[
                DropdownButtonFormField<String>(
      decoration: InputDecoration(
       labelText:'Class  * ',
         hintText:'class Name',
       ),
              value: findval( additionallicenseDetail.classId,4),
              onChanged: (String newValue) {//setState(() => classOptions = newValue);
              additionallicenseDetail.additionalRating=true;
              additionallicenseDetail.classId =additionallicenseDetail.classId;},
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  additionallicenseDetail.classId=licenseDetail.classId,
              items: licenseclassdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['className']),
              value: item['className'].toString(),
               onTap: () {
                  print( item['id']);
                  additionallicenseDetail.classId = item['id'];
               },
            );
          }).toList(),
        ),
 DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:' Type * ',
      hintText:'Select Type',
       ),
              value: findval( additionallicenseDetail.typeId,10),
              onChanged: (String newValue) =>setState(() => additionallicenseDetail.typeId  = additionallicenseDetail.typeId ),
              validator: (value) => value == null ? 'field required' : null,
             onSaved: (val) =>  additionallicenseDetail.typeId=  additionallicenseDetail.typeId,
              items: licensetypedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['typeName']),
              value: item['typeName'].toString(),
                onTap: () {
                  print( item['id']);
                  additionallicenseDetail.typeId = item['id'];
               },
            );
          }).toList(),
        ),
   CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('IR'),
               controlAffinity: ListTileControlAffinity.leading,
              value: additionallicenseDetail.ir,
              onChanged: (bool value) { 
              setState(() =>additionallicenseDetail.ir= value);
                 },  ),
   CheckboxListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text('Co_Pilot'),
               controlAffinity: ListTileControlAffinity.leading,
              value: additionallicenseDetail.copilot,
              onChanged: (bool value) { 
                setState(() =>additionallicenseDetail.copilot= value);
              //  additionallicenseDetail.copilot=!additionallicenseDetail.copilot;
               },   ),
   TextFormField(
        initialValue:initialnumber??saveLicenseData.additionalRemarks,// licencenumber.toString(),
           decoration: InputDecoration(  hintText: 'Remark and restriction',
           labelText: 'Remark and restriction '),
         // keyboardType: TextInputType.phone,
         // validator: licenceNumber,
          onChanged: (String newValue){saveLicenseData.additionalRemarks=newValue;},
          onSaved: (val) =>  saveLicenseData.additionalRemarks=val,
        )
              ],
            ),
          ],
        ),
      
    );
  
  }
  /////////////////
   Widget _onDone() {
      return  TextField(
        
//obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Save successfully   ',
        
  ),
);}

  
  Widget showdata(){
    return Row(children: <Widget>[
      SizedBox(  height: 39, width: 3, ),
      RaisedButton(
              color:Colors.pink,
              onPressed:(){    print(endorsementDataFromPage);},//,
              child: new Text('get'),
              ),
      SizedBox( width: 3, ),
      RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child: new Text('Reset'),
          ),
         SizedBox( width: 3, ),
      RaisedButton(
         color:Colors.indigo[400],
          onPressed: _validateInputs,
          child: new Text('Save'),
          )
      ]
     );
  }
  
  //////////////////
  Widget _action(BuildContext context) {
  return PopupMenuButton(
    icon: Icon(Icons.more_vert),
    onSelected: (newValue)async {
       switch (newValue){
        case 0:{
        String resevedExaminer = await Navigator.push( context, MaterialPageRoute( builder: (context) =>ExaminarPage (examinerapiplist), ),);
               if (resevedExaminer != null) {
                examinerdatafrompage = jsonDecode(resevedExaminer) as List;
                examinerapiplist = examinerdatafrompage.map((i)=>Examinerapi.fromJson(i)).toList();
              print(examinerapiplist);}
      }break;
           case 1:{
        
                String inst = await Navigator.push( 
                context, MaterialPageRoute( builder: (context) =>Instructorpage(instructorapiplist), ), );
                if (inst != null) {
                   instructordatafrompage = jsonDecode(inst) as List;
                   instructorapiplist = instructordatafrompage.map((i)=>Instructorapi.fromJson(i)).toList();} }
      break;
        case 2:{
        String endorsement = await Navigator.push( context, MaterialPageRoute( builder: (context) =>EndorsementPage(endorsementApipList), ), );
                if (endorsement != null) {
                endorsementDataFromPage = jsonDecode(endorsement) as List;
                endorsementApipList = endorsementDataFromPage.map((i)=>EndorsementAPI.fromJson(i)).toList();
              print(endorsementApipList);} 
      }break;
      }// add this property
    },
    itemBuilder: (context) => [
      PopupMenuItem(
        child: Text("Examiner"),
        value: 0,
      ),
      PopupMenuItem(
        child: Text("Instructor"),
        value: 1,
      ),
      PopupMenuItem(
        child: Text("Endorsement"),
        value: 2,
      ),
    ],
  );
}


  ////////////////////////////////////////
  //validation
  ////////////////////////////
String licenceNumber(String value) {
  
  if(value == null)  return null;
  final n = num.tryParse(value);
  if(n == null)  return '"$value" is not a valid number';
  return null;
}
  
 bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
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
   
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    postdata( );
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}

 




 List<ExaminerDetail> playerExaminer = new List(20);
  int x=0;
   List<InstructorDetail> playerInstructor = new List(20);
    int z=0;
     List<EndorsementDetail> playerEndorsement = new List(20);
    int w=0;
addexaniner(int id ,String type,String remark){
  playerExaminer[x] = new ExaminerDetail() ; // add this to your code
  playerExaminer[x].remark =remark;
  playerExaminer[x].id =id;
  playerExaminer[x].examinerTypeId =int.parse(type);    
  saveLicenseData.examinerDetails.add(playerExaminer[x]);
  x++;
}
addinstructorr(int id ,String type,String remark){
  playerInstructor[z] = new InstructorDetail() ; // add this to your code
  playerInstructor[z].remark =remark;
  playerInstructor[z].id =id;
  playerInstructor[z].instructorTypeId =int.parse(type);    
  saveLicenseData.instructorDetails.add(playerInstructor[z]);
  z++;
}
addendorsement(int id ,String type){
  playerEndorsement[w] = new EndorsementDetail() ; // add this to your code
  playerEndorsement[w].id =id;
  playerEndorsement[w].endorsementTypeId =int.parse(type);    
  saveLicenseData.endorsementDetails.add(playerEndorsement[w]);
  w++;
}
void postdata(){
       saveLicenseData.instructorDetails = <InstructorDetail>[];
       saveLicenseData.examinerDetails = <ExaminerDetail>[];
       saveLicenseData.endorsementDetails = <EndorsementDetail>[];
    int dat;
    
  int count=endorsementDataFromPage.length;print(count);

  for(dat=0;dat<instructordatafrompage.length;dat++){ 
              String f= instructordatafrompage[dat]['instructorTypeId'];
              String r= instructordatafrompage[dat]['remark'];
              int b= instructordatafrompage[dat]['id'];
            //  print(b); print(r); print(f);
            addinstructorr(b,f,r);
    }
     for(dat=0;dat<examinerdatafrompage.length;dat++){ 
              String f= examinerdatafrompage[dat]['examinerTypeId'];
              String r= examinerdatafrompage[dat]['remark'];
              int b= examinerdatafrompage[dat]['id'];
            //  print(b); print(r); print(f);
             addexaniner(b,f,r); }
    for(dat=0;dat<count;dat++){ 
              String f= endorsementDataFromPage[dat]['endorsementTypeId'];
              int b= endorsementDataFromPage[dat]['id'];
            //  print(b); print(r); print(f);
            addendorsement(b,f); }

 saveLicenseData.userId=uuid.toString();
 saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 if(additionallicenseDetail.additionalRating)saveLicenseData.licenseDetails.add(additionallicenseDetail);
 String jsons = licenceclassToJson(saveLicenseData);
 print( jsons);
 sendRequest( jsons) ;

  
}


forLicenceid(var val)=> savelicencdId=val.toString();
    
 void   _onSuccessResponse(api ){
    endorsementDataFromPage=jsonDecode(api)['endorsementDetails']as List;
    print(endorsementDataFromPage);
      instructordatafrompage=jsonDecode(api)['instructorDetails']as List;
     print(instructordatafrompage);
    examinerdatafrompage=jsonDecode(api)['examinerDetails']as List;
     print(examinerdatafrompage);
  //   examinerapiplist=asdfg.map((i)=>Examinerapi.fromJson(i)).toList();
     List licenseDetaillist=jsonDecode(api)['licenseDetails']as List;
    print(licenseDetaillist);// licenceDetaillist(licenseDetaillist);
      dateOfInitialIssue= DateTime.parse(saveLicenseData.dtIssue);
      dateofratingtest= DateTime.parse(saveLicenseData.dtRatingtest);
      dateofIRtest= DateTime.parse(saveLicenseData.dtIrtest);
      validuntil= DateTime.parse(saveLicenseData.dtValidity);//contries=countriesdatalist[saveLicenseData.countryId]['countryCode'];
  }
    void licenceDetaillist( List detaillist){
      for (int dat = 0; dat < detaillist.length; dat++) {
      if (dat==0){
    licenseDetail.classId  =detaillist[dat]['classId'];
    licenseDetail.copilot  =detaillist[dat]['copilot'];
    // licenseDetail.id=detaillist[dat]['id'];
    licenseDetail.ir=detaillist[dat]['ir'];
    licenseDetail.typeId=detaillist[dat]['typeId'];
    print((detaillist[dat].id));}else{
     additionallicenseDetail.classId  =detaillist[dat]['classId'];
    additionallicenseDetail.copilot  =detaillist[dat]['copilot'];
    // additionallicenseDetail.id=detaillist[dat]['id'];
    additionallicenseDetail.ir=detaillist[dat]['ir'];
    additionallicenseDetail.typeId=detaillist[dat]['typeId'];
    print((detaillist[dat].id));
    }
    }
    }


















//////////Post////////////////////

sendRequest( String data) async {
 var url = 'http://$ipAddress:8080/dLicence/api/license/v1';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      final forLicenceid = jsonDecode(response.body);
          forLicenceid(  forLicenceid['id']);
       
    });  
}


////////////
///get
//////////////////

    Future<int> getlicencddata() async {
      var urlLicence='http://$ipAddress:8080/dLicence/api/license/v1/$uuid';
     print(urlLicence);
     final response = await http.get(urlLicence);
     print(response.statusCode);
     if (response.statusCode == 200) {
         print(json.decode(response.body));
         String api=response.body;
         saveLicenseData =Licenceclass.fromJson(json.decode(response.body));
        forLicenceid(saveLicenseData.id);print(saveLicenseData.id);
         _onSuccessResponse(api);
         return 1; }  
     else if  (response.statusCode == 500){initialnumber='';return 1;}
     else{throw Exception('check network connecion');}
    }





///////////////////////////
//end
//////////////////
}