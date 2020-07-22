

import 'modal.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:appdata/src/models/masterdata.dart';

class MedicalPage extends StatefulWidget {
  @override
  _MedicalPage createState() => new _MedicalPage();
  }
class _MedicalPage extends State<MedicalPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool _autoValidate = false;
 String languageString;
  var dtAudiogram = new TextEditingController();  
  var dtEcg = new TextEditingController(); 
  var dtExam = new TextEditingController();  
  var dtExpPrevcert = new TextEditingController(); 
  var dtExpiryC1 = new TextEditingController();  
  var dtExpiryC1Sp = new TextEditingController(); 
  var dtExpiryC2 = new TextEditingController();  
  var dtExpiryC3 = new TextEditingController();
  var dtExpiryClapl = new TextEditingController();  
  var dtIssue = new TextEditingController(); 
  bool visibilityclass1 = false;
 bool visibilityclass3=false;
  DateTime date;
  String niveaulevel=''; 
  int nilevel;
  String levelvalueanswer;
  String fromjsondata;
  
 
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
 //nal TextEditingController _controller = new TextEditingController();
 Medical saveMedicalData=new Medical();
   Medical user=new Medical();
 String a;
 bool checkboxValue=false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
      home: new Scaffold(
        
        appBar: new AppBar(
          
          title: new Text('    Medical'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              
              autovalidate: _autoValidate,
              
        
            child:  formUI(),
     
            ),
         
        ),
      ),
        ),
    );
  }
   Widget formUI() {
       return  Column(
      children:[
          _tpyeOptionData(),
          _contries(), 
         _licenceNumber(),
          _limitations(),
         visibilityclass1 ? _dtExpiryC1Sp() : new Container(),
         visibilityclass1 ? _dtExpiryC1() : new Container(),
         visibilityclass1 ? _dtExpiryC2() : new Container(),
         visibilityclass1 ? _dtExpiryClapl() : new Container(),
         visibilityclass3 ? _dtExpiryC3() : new Container(),
       //   _expirydateofthiscertificate(),
         _dateOfInitialIssue(),
           _examinationdate(),
           _expirydateofpreviousMedicalCertificate(), 
        _electrocardiogram(),
           _audiogram(),
          _comments(),
//       
        showdata()
        
        
        
   
      ]
     );
     
   }
  //////////////////
     Widget _tpyeOptionData() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:' Type  ',
      hintText:'Select Type',
       ),
              value: tpyeOptionDatamed,
              onChanged: (String newValue) {
        
               _changed(newValue);
              
                setState(() => tpyeOptionDatamed = newValue);
              },
              validator: (value) => value == null ? 'field required' : null,
        //  onSaved: (val) =>  saveMedicalData.licenseId=int.parse(val),
              items: medicaltpedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['type']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}
  
 /////////////////////
   Widget _contries() {
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText:'State of issue * ',
      hintText:'Select State',
       ),
              value: contriesmed,
              onChanged: (String newValue) =>setState(() => contries = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveMedicalData.stateId=int.parse(val),
              items: statedatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['stateName']),
              value: item['id'].toString(),
            );
          }).toList(),
        );
     }  
  //////////////////////
    Widget _licenceNumber() { 
      return TextFormField(
          decoration: const InputDecoration(labelText: 'Certificate Number'),
          keyboardType: TextInputType.phone,
          validator: licenceNumber,
          onSaved: (val) =>  saveMedicalData.licenseNumber=int.parse(val),
        );
}
  
  
  ///////////////
    Widget _limitations() { 
      return DropdownButtonFormField<String>(
      decoration: InputDecoration(
     labelText:'Limitations ',
       //hintText:'Select LicenceCode',
       ),
              value: limitations,
              onChanged: (String newValue) =>setState(() => limitations = newValue),
              validator: (value) => value == null ? 'field required' : null,
               onSaved: (val) =>  saveMedicalData.limitationId=int.parse(val),
              items: limitationdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['limitation']),
              value: item['id'].toString(),
            );
          }).toList(),
        );}

  /////////////
    Widget _dtExpiryC1Sp() {
     return TextFormField(
      controller: dtExpiryC1Sp,
      onTap : ()=>_selectDate(context,dtC1Sp,dtExpiryC1Sp),
  onSaved:(val) => saveMedicalData.dtExpiryC1Sp= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Expiry date of Class 1(SP) *',
         hintText: ' $dtC1Sp',
      ),
    );
 }
  
// //   }
// //   ///////////////////
    Widget _dtExpiryC1() {
     return TextFormField(
      controller: dtExpiryC1,
      onTap : ()=>_selectDate(context,dtC1,dtExpiryC1),
     onSaved:(val) => saveMedicalData.dtExpiryC1= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Expiry date of Class 1 *',
         hintText: ' $dtC1',
      ),
    );
 }
  
//   }
// //   ///////////////////
    Widget _dtExpiryC2() {
     return TextFormField(
      controller: dtExpiryC2,
      onTap : ()=>_selectDate(context,dtC2,dtExpiryC2),
   onSaved:(val) => saveMedicalData.dtExpiryC2= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Expiry date of Class 2 *',
         hintText: ' $dtC2',
      ),
    );
 }
  
//   }
      Widget _dtExpiryC3() {
     return TextFormField(
      controller: dtExpiryC3,
      onTap : ()=>_selectDate(context,dtC3,dtExpiryC3),
   onSaved:(val) => saveMedicalData.dtExpiryC3= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Expiry date of Class 3 *',
         hintText: ' $dtC3',
      ),
    );
 }
  
//   ///////////////////
    Widget _dtExpiryClapl() {
     return TextFormField(
      controller: dtExpiryClapl,
      onTap : ()=>_selectDate(context,expirydateofthiscertificate,dtExpPrevcert),
   onSaved:(val) => saveMedicalData.dtExpiryClapl= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Expiry date of LAPL *',
         hintText: ' $expirydateofthiscertificate',
      ),
    );
 }
  
//   ///////////////////
       Widget _dateOfInitialIssue() {
     return TextFormField(
      controller: dtIssue,
      onTap : ()=>_selectDate(context,dateOfInitialIssuemed,dtIssue),
      onSaved:(val) => saveMedicalData.dtIssue= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Date Of Initial Issue',
         hintText: ' $dateOfInitialIssuemed',
      ),
    );
 
 
  }
//   ////////////////////////
   Widget _examinationdate () {
       return TextFormField(
      controller: dtExam,
      onTap : ()=>_selectDate(context,examinationdate,dtExam),
      onSaved:(val) => saveMedicalData.dtExam= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Examination date',
         hintText: ' $examinationdate',
      ),
    );
//   
  }
  
//   ////////////////
   Widget _expirydateofpreviousMedicalCertificate () {
       return TextFormField(
      controller: dtExpPrevcert,
      onTap : ()=>_selectDate(context,expirydateofpreviousMedicalCertificate,dtExpPrevcert),
      onSaved:(val) => saveMedicalData.dtExpPrevcert= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Epiry date previous Medical Certificate',
         hintText: ' $expirydateofpreviousMedicalCertificate',
      ),
    );
  }
//   //////////////////
   Widget _electrocardiogram  () {
         return TextFormField(
      controller: dtEcg,
      onTap : ()=>_selectDate(context,electrocardiogram,dtEcg),
      onSaved:(val) => saveMedicalData.dtEcg= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Electrocardiogram',
         hintText: ' $electrocardiogram',
      ),
    );
   }

//   /////////////////////
  
       Widget _audiogram  () {
              return TextFormField(
      controller: dtAudiogram,
      onTap : ()=>_selectDate(context,audiogram,dtAudiogram),
      onSaved:(val) => saveMedicalData.dtAudiogram= val.toString(),
      decoration: InputDecoration(
         suffixIcon : Icon(Icons.calendar_today),
         //   border: OutlineInputBorder(),
         labelText: 'Audiogram',
         hintText: ' $audiogram',
      ),
    );
   }

  //////////////
     Widget _comments() { 
      return TextFormField(
           decoration: InputDecoration(  hintText: 'Enter  Comments Here',
           labelText: 'Comments '),
      
          onSaved: (val) =>  saveMedicalData.comments=val,
        );
}

  
  
  
  ///////////////
    
  Widget showdata(){
    return Row(children: <Widget>[
          Expanded(
            
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
         
            ),
      
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
  
   bool isValidDob(String dat) {
    if (dat.isEmpty) return true;
     return false;
//  var d = convertToDate(dob);
 // return d != null && d.isBefore(new DateTime.now());
}




//   DateTime convertToDate(String input) {
//     try 
//     {
//       var d = new DateFormat.yMd().parseStrict(input);
//       return d;
//     } catch (e) {
//       return null;
//     }    
//   }
  
  /////////////////////////////////////////////////////////////////
  // All function
  /////////////////////////////////////////////////////////////////
  getmedicaldata(){
    
     user = welcomeFromJson(fromjsondata);
 //   Map<String, dynamic> data = jsonDecode(fromjsondata);
  print(  user.dtAudiogram);
    electrocardiogram=user.dtAudiogram;
    
  }
   void reset() {

   _formKey.currentState.reset();
     
}
  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    shoe(  saveMedicalData                 );

  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
  

  ///////////////////
  shoe(
 Medical saveMedicalData){
// LicenseDetail licenseDetail,
//Personnel personal){
// saveLicenseData.personnel = <Personnel>[personal];
// saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String json = welcomeToJson(saveMedicalData);
   fromjsondata= json;
 print( json);

}
  
  
  
        
 
  void _changed( String field) {
    switch(field){
   case "1": { visibilityclass1=true;  visibilityclass3=false;}
  break;
    case "2":{ visibilityclass3=true;  visibilityclass1=false;}
       break;
      
   default: { 
      visibilityclass1=false;
     visibilityclass3=false;
   }
   break; 
} 
       }
 ////////////////////////////////////////////////////////////////////////
}
///////////////























////////////////////////////////


