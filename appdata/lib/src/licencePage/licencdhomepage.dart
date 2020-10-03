


import 'package:appdata/src/licencePage/demo.dart';
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
                      Licenceclass saveLicenseData=  Licenceclass();
                     // Licenceclass apiLicencddata= Licenceclass();//.fromJson(jsonstring);
                      LicenseDetail licenseDetail= LicenseDetail(); 
                      LicenseDetail additionallicenseDetail= LicenseDetail(); 
                      //final TextEditingController _controller =  TextEditingController();
                     // Licenceclass apiLicencddata= Licenceclass(); UserClass userdata = UserClass.fromJson(jsonstring);
                        List<Examinerapi> examinerapiplist=[];
                        List examinerdatafrompage;
                        List<Instructorapi> instructorapiplist=[];
                        List instructordatafrompage;  
                        List<EndorsementAPI> endorsementApipList=[];
                        List endorsementDataFromPage;
                     // Personneldata personal= Personneldata();
                      final dtirtest =  TextEditingController();
                      final dtissue =  TextEditingController();  
                      final dtratingtest =  TextEditingController(); 
                      final dtvalidity =  TextEditingController();    
                      String a;
                      String licencenumber='';
                      DateTime initialdateval;
                      Future<int>futureLicenceclass;
                      final _scaffoldKey = GlobalKey<ScaffoldState>();
                      // Future<Album> futureAlbum;
                      //  Future<void> _selectDate(BuildContext context,var a,TextEditingController datecontroller ) async {
  //                 showDatePicker(
  //                           context: context,
  //                           initialDate: DateTime.now(),
  //                           firstDate: DateTime(1950),
  //                           lastDate: DateTime(2200)
  //                           ).then((date) {
  //                           setState(() {
  //                           datecontroller.text= a =date.toString();
  //                     // DateFormat.yMMMMd().format(date);
  //                    }); }); 
  // }
bool visibilityTag=false;
  @override
  void initState() {
    super.initState();
      dateOfInitialIssue=null;
      dateofratingtest=null;
      dateofIRtest=null;
      validuntil=null;
     
  futureLicenceclass = getlicencddata();
 print(saveLicenseData.licenseNumber);
  }
// var _valuedrop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      appBar:  AppBar(title:  Text('Licence'),
       
       actions: <Widget>[_action(context), ]),
      key:_scaffoldKey ,
       body: Center(
          child: FutureBuilder<int>(
            future: futureLicenceclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   SingleChildScrollView(
           child:  Container(
            margin:  EdgeInsets.all(15.0),
            child:  Form(
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
          //  FlatButton(
          //       child: Text('Instructor          '),
          //       onPressed: () async {
          //       String inst = await Navigator.push( 
          //       context, MaterialPageRoute( builder: (context) =>Instructorpage(instructorapiplist), ), );
          //       if (inst != null) {
          //          instructordatafrompage = jsonDecode(inst) as List;
          //          instructorapiplist = instructordatafrompage.map((i)=>Instructorapi.fromJson(i)).toList();} }),
          // FlatButton(
          //      child: Text('Examiner 2       '),
          //      onPressed: () async {
          //        await Navigator.push( context, MaterialPageRoute( builder: (context) =>DynamicFieldsPage(), ),);
              //  if (resevedExaminer != null) {
              // List<Map>  examinerdatafrompagedemo = jsonDecode(resevedExaminer) as List;
              //   // examinerapiplist = examinerdatafrompagedemo.map((i)=>Examinerapi.fromJson(i)).toList();
              // print(examinerdatafrompagedemo);}
              // }),
          // FlatButton(
          //     //color:ment Colors.grey[300],
          //     child: Text('Endorsement          '),
          //     onPressed: () async {
          //     String endorsement = await Navigator.push( context, MaterialPageRoute( builder: (context) =>EndorsementPage(endorsementApipList), ), );
          //       if (endorsement != null) {
          //       endorsementDataFromPage = jsonDecode(endorsement) as List;
          //       endorsementApipList = endorsementDataFromPage.map((i)=>EndorsementAPI.fromJson(i)).toList();
          //     print(endorsementApipList);} },  ),
          //       visibilityTag ? _onDone():  Container(color: Colors.blue[300],),
           showdata()
        
         ]
     );
     
   }
  
   Widget _contries()  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: ' State of Issue * ',
       ),
      value: findval( saveLicenseData.stateId,1), //
       onChanged: (String value){saveLicenseData.countryId=saveLicenseData.stateId;
               saveLicenseData.stateId=saveLicenseData.stateId;
       },// => setState(() => contries = Value),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.stateId = saveLicenseData.stateId,
        items: statedatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['stateName']),
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
      onChanged: (String value){saveLicenseData.codeId=saveLicenseData.codeId;},// => setState(() => licenceCodeOptions = Value),// => setState(() => licenceCodeOptions = Value),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.codeId = saveLicenseData.codeId,
       items: licensecodesdatalist.map((item) {
        return  DropdownMenuItem(
          child:  Text(item['code']),
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
           onChanged: (String value) { saveLicenseData.licenseNumber=int.parse(value);},
          onSaved: (val) =>  saveLicenseData.licenseNumber=int.parse(val),
        );
}
////////////////
   Widget _licencetitleOptions() { 
       return DropdownButtonFormField<String>(
      decoration: InputDecoration( labelText: ' Title of Lisence * ',),
      value: findval( saveLicenseData.titleId,8), //
      onChanged: (String value){saveLicenseData.titleId=saveLicenseData.titleId;},// => setState(() => licenceCodeOptions = Value),// => setState(() => licenceCodeOptions = Value),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.titleId = saveLicenseData.codeId,
       items: licensetitlesdatalist.map((item) {
        return  DropdownMenuItem(
          child:  Text(item['title']),
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
              onChanged: (String value) =>setState(() => countryCodes = value),
              validator: (value) => value == null ? 'field required' : null,
         //  onSaved: (val) =>  saveLicenseData.codeId=int.parse(val),
              items: countriesdatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['countryName']),
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
      onChanged: (String value){saveLicenseData.examinerId=saveLicenseData.examinerId;},// => setState(() => licenceCodeOptions = Value),// => setState(() => licenceCodeOptions = Value),
      validator: (value) => value == null ? 'field required' : null,
      onSaved: (val) => saveLicenseData.examinerId = saveLicenseData.codeId,
       items: licensecodesdatalist.map((item) {
        return  DropdownMenuItem(
          child:  Text(item['code']),
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
          onChanged: (String value){saveLicenseData.examinerNumber=int.parse(value);},
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
              onChanged: (String value) =>licenseDetail.classId=licenseDetail.classId,//setState(() => classOptions = value),
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  licenseDetail.classId=licenseDetail.classId,
              items: licenseclassdatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['className']),
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
              onChanged: (String value) { licenseDetail.typeId  = licenseDetail.typeId ;},
              validator: (value) => value == null ? 'field required' : null,
            onSaved: (val) =>  licenseDetail.typeId  = licenseDetail.typeId ,
              items: licensetypedatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['typeName']),
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
          onChanged: (String value){saveLicenseData.remarks=value;},
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
              onChanged: (String value) {//setState(() => classOptions = Value);
              additionallicenseDetail.additionalRating=true;
              additionallicenseDetail.classId =additionallicenseDetail.classId;},
              validator: (value) => value == null ? 'field required' : null,
       onSaved: (val) =>  additionallicenseDetail.classId=licenseDetail.classId,
              items: licenseclassdatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['className']),
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
              onChanged: (String value) =>setState(() => additionallicenseDetail.typeId  = additionallicenseDetail.typeId ),
              validator: (value) => value == null ? 'field required' : null,
             onSaved: (val) =>  additionallicenseDetail.typeId=  additionallicenseDetail.typeId,
              items: licensetypedatalist.map((item) {
            return  DropdownMenuItem(
              child:  Text(item['typeName']),
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
          onChanged: (String value){saveLicenseData.additionalRemarks=value;},
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
      SizedBox(  height: 39, width: 63, ),
      // RaisedButton(
      //         color:Colors.pink,
      //         onPressed:(){    print(endorsementDataFromPage);},//,
      //         child:  Text('get'),
      //         ),
      SizedBox( width: 31, ),
      RaisedButton(
       color:Colors.pink,
          onPressed:reset,
          child:  Text('Reset'),
          ),
         SizedBox( width: 3, ),
      RaisedButton(
         color:Colors.indigo[400],
          onPressed: _validateInputs,
          child:  Text('Save'),
          )
      ]
     );
  }
  
  //////////////////
  Widget _action(BuildContext context) {
  return PopupMenuButton(
    icon: Icon(Icons.more_vert),
    onSelected: (value)async {
       switch (value){
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

 




 List<ExaminerDetail> playerExaminer =  List(20);
  int x=0;
   List<InstructorDetail> playerInstructor =  List(20);
    int z=0;
     List<EndorsementDetail> playerEndorsement =  List(20);
    int w=0;
addexaniner(int id ,String type,String remark){
  playerExaminer[x] =  ExaminerDetail() ; // add this to your code
  playerExaminer[x].remark =remark;
  playerExaminer[x].id =id;
  playerExaminer[x].examinerTypeId =int.parse(type);    
  saveLicenseData.examinerDetails.add(playerExaminer[x]);
  x++;
}
addinstructorr(int id ,String type,String remark){
  playerInstructor[z] =  InstructorDetail() ; // add this to your code
  playerInstructor[z].remark =remark;
  playerInstructor[z].id =id;
  playerInstructor[z].instructorTypeId =int.parse(type);    
  saveLicenseData.instructorDetails.add(playerInstructor[z]);
  z++;
}
addendorsement(int id ,String type){
  playerEndorsement[w] =  EndorsementDetail() ; // add this to your code
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


forLicenceidassign(var val)=>setState(() => savelicencdId=val.toString());
    
 void   _onSuccessResponse(api ){
    endorsementDataFromPage=jsonDecode(api)['endorsementDetails']as List;
    print(endorsementDataFromPage);
      instructordatafrompage=jsonDecode(api)['instructorDetails']as List;
     print(instructordatafrompage);
    examinerdatafrompage=jsonDecode(api)['examinerDetails']as List;
     print(examinerdatafrompage);
  //   examinerapiplist=asdfg.map((i)=>Examinerapi.fromJson(i)).toList();
    List<dynamic>  licenseDetaillist=jsonDecode(api)['licenseDetails']as List;
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
    http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
        .then((response) {
          if(response.statusCode==200||response.statusCode==201){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      final forLicenceid = jsonDecode(response.body);
          forLicenceidassign(forLicenceid['id']);
       print(savelicencdId);
       onsucesses('Save successfully');
          }
    });  
}


////////////
///get
//////////////////

    Future<int> getlicencddata() async {
      var urlLicence='http://$ipAddress:8080/dLicence/api/license/v1/$uuid';
     print(urlLicence);
     final response = await http.get(urlLicence, headers: {"Authorization":"$token"},);
     print(response.statusCode);
     if (response.statusCode == 200) {
         print(json.decode(response.body));
         String api=response.body;
         saveLicenseData =Licenceclass.fromJson(json.decode(response.body));
        forLicenceidassign(saveLicenseData.id);print(saveLicenseData.id);
         _onSuccessResponse(api);
         return 1; }  
     else if  (response.statusCode == 500){initialnumber='';return 1;}
     else{initialnumber='';return 1;//throw Exception('check network connecion');
     }
    }



   
onsucesses(String val){
   _scaffoldKey.currentState.showSnackBar(
        SnackBar(elevation: 6.0,
  backgroundColor: Colors.blue,
  behavior: SnackBarBehavior.floating,
        content:  Text(val,
       textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: 
       FontWeight.bold),),
        duration: Duration(seconds: 3))
);

}
///////////////////////////
//end
//////////////////
}