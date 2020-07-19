
import 'uplodedata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'ratingCertificateEndorsementOptions.dart';
import 'package:appdata/licencePage/model.dart';
import 'model.dart';
import 'package:flutter/services.dart';
 class MyItem {
  bool isExpanded;
  final String header;
  bool ir = false;
  bool co_Pilot = false;
  MyItem({this.isExpanded: false, this.header, this.ir, this.co_Pilot});
  }
Color c1 = const Color(0xCFCFCF);
  DateTime _dateTime;
  bool additionalratingIR=false;
 class Licencepage extends StatefulWidget {
  @override
  _Licencepage createState() => new _Licencepage();
  }
class _Licencepage extends State<Licencepage> {
   final TextEditingController _controller = new TextEditingController();
    Welcome saveLicenseData=new Welcome();
 LicenseDetail licenseDetail=new LicenseDetail(); 
 Personneldata personal=new Personneldata();
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
String a;
            bool checkboxValue=false;
  List<MyItem> _items = <MyItem>[new MyItem(header: ' Additional Ratings')];
  List<MyItem> _insts = <MyItem>[new MyItem(header: ' Instructors')];
  List<MyItem> _examiner = <MyItem>[new MyItem(header: ' Examiners')];
  List<MyItem> _rating = <MyItem>[new MyItem(header: ' Rating certificate endorsement')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text('Licence Detail',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  
                   _contries(), 
                  
                   _licenceCodeOptions(),
               
                  // _licenceNumber(),
                  // _titleOfLicenceOptions(),
                  //  _dateOfInitialIssue(),
                  //  _countryCodes(),
                  //  _dateofratingtest(),
                  //  _dateofIRtest(),
                  //  _validuntil(),
                  //  _examinerscertificatenumber(),
                  //  _classOptions(),
                  //  _tpyeOptionData(),
                  //  _ir(),
                  //  _coPilot(),
                  // ExpansionPanelList(
                  //   expansionCallback: (int index, bool isExpanded) {
                  //     setState(() {
                  //       _items[index].isExpanded = !_items[index].isExpanded;
                  //     });
                  //   },
                  //   children: _items.map((MyItem item) {
                  //     return new ExpansionPanel(
                  //       headerBuilder: (BuildContext context, bool isExpanded) {
                  //         return new Container(
                  //           margin: EdgeInsets.all(10),
                  //           padding: EdgeInsets.all(10),
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(item.header),
                  //         );
                  //       },
                  //       isExpanded: item.isExpanded,
                  //       body: Container(
                  //         height: 260.0,
                  //           child: Column(
                  //           children: [
                  //             Expanded( child: _addtiionalratingclassOptions(), ),
                  //             Expanded(child:_additionalratingtpyeOptionData()),
                  //             Expanded( child: _additionalratingIR(), ),
                  //             Expanded( child: _additionalratingcoPilot(), ),
                  //             Expanded( child: _remarksandRestrictions(), ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // ExpansionPanelList(
                  //   expansionCallback: (int index, bool isExpanded) {
                  //     setState(() { _insts[index].isExpanded = !_insts[index].isExpanded;});
                  //   },
                  //   children: _insts.map((MyItem item) {
                  //     return new ExpansionPanel(
                  //       headerBuilder: (BuildContext context, bool isExpanded) {
                  //         return new Container(
                  //           margin: EdgeInsets.all(10),
                  //           padding: EdgeInsets.all(10),
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(item.header),
                  //         );
                  //       },
                  //       isExpanded: item.isExpanded,
                  //       body: Container(
                  //         height:150.0,
                  //         decoration: new BoxDecoration(
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Expanded(child: _instructorsOptions(), ),
                  //             Expanded(child: _instructorremarksandRestrictions(), ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // ExpansionPanelList(
                  //   expansionCallback: (int index, bool isExpanded) {
                  //     setState(() {
                  //       _examiner[index].isExpanded = !_examiner[index].isExpanded;
                  //     });
                  //   },
                  //   children: _examiner.map((MyItem item) {
                  //     return new ExpansionPanel(
                  //       headerBuilder: (BuildContext context, bool isExpanded) {
                  //         return new Container(
                  //           margin: EdgeInsets.all(10),
                  //           padding: EdgeInsets.all(10),
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(item.header),
                  //         );
                  //       },
                  //       isExpanded: item.isExpanded,
                  //       body: Container(
                  //         height: 160.0,
                  //         decoration: new BoxDecoration(
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Expanded( child: _examiners(), ),
                  //             Expanded( child: _examinarRemarksandRestrictions(), ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // ExpansionPanelList(
                  //   expansionCallback: (int index, bool isExpanded) {
                  //     setState(() {
                  //       _rating[index].isExpanded = !_rating[index].isExpanded;
                  //     });
                  //   },
                  //   children: _rating.map((MyItem item) {
                  //     return new ExpansionPanel(
                  //       headerBuilder: (BuildContext context, bool isExpanded) {
                  //         return new Container(
                  //           margin: EdgeInsets.all(10),
                  //           padding: EdgeInsets.all(10),
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(item.header),
                  //         );
                  //       },
                  //       isExpanded: item.isExpanded,
                  //       body: Container(
                  //         height: 60.0,
                  //         decoration: new BoxDecoration(
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Expanded(child: _ratingcertificateendorsement(),  ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),  
                   Container(
            padding: const EdgeInsets.only(left: 40.0, top: 20.0),
            child: new RaisedButton(
              child: const Text('Submit'),
              onPressed: _submitForm,
            )),
                ],
              ),
              ),
        ),
             );
            }
//  // Widget _ratingcertificateendorsement() {
//    return FormField<String>(
//   //builder: (FormFieldState<String> state) {
//     return InputDecorator(
//       decoration: InputDecoration(
//         //icon: const Icon(Icons.color_lens),
//         labelText:'Class type * ',
//         hintText:'Select Class',
//         errorText: state.hasError ? state.errorText : null,
//       ),
//       isEmpty:  saveLicenseData.dtValidity == null,
//       child: new DropdownButtonHideUnderline(
//         child: new DropdownButton<String>(
//           value: ratingcertificateendorsement, 
//           //saveLicenseData.dtValidity,
//           isDense: true,
//           onChanged: (String newValue) {
//             setState(() {
//               ratingcertificateendorsement= newValue;
//                //saveLicenseData.dtValidity = newValue;
//               state.didChange(newValue);
              
//             });
//           },
//           items: licensetitlesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['title']),
//               value: item['id'].toString(),);
//         }).toList(),
//         ),
//       ),
//     );
//   },
//   validator: (val) {
//     return val != '' ? null : 'Please select State ';
//   },
// );
    
//   }
//   Widget _classOptions() { 
//     return FormField<String>(
//   builder: (FormFieldState<String> state) {
//     return InputDecorator(
//       decoration: InputDecoration(
//         //icon: const Icon(Icons.color_lens),
//         labelText:'Class type * ',
//         hintText:'Select Class',
//         errorText: state.hasError ? state.errorText : null,
//       ),
//       isEmpty:  saveLicenseData.dtValidity == null,
//       child: new DropdownButtonHideUnderline(
//         child: new DropdownButton<String>(
//           value:contries, // saveLicenseData.dtValidity,
//           isDense: true,
//           onChanged: (String newValue) {
//             setState(() {
//               contries= newValue;
//                //saveLicenseData.dtValidity = newValue;
//               state.didChange(newValue);
              
//             });
//           },
//           items: licenseclassdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['className']),
//               value: item['id'].toString(),
//           );
//           }).toList(),
//         ),
//       ),
//     );
//   },
//   validator: (val) {
//     return val != '' ? null : 'Please select State ';
//   },
// );
  
//   }
//   Widget _addtiionalratingclassOptions() {
//      return   FormField<String>(
//   builder: (FormFieldState<String> state) {
//     return InputDecorator(
//       decoration: InputDecoration(
//         //icon: const Icon(Icons.color_lens),
//         labelText:'Class Options * ',
//         hintText:'Select Class Options',
//         errorText: state.hasError ? state.errorText : null,
//       ),
//       isEmpty:  saveLicenseData.dtValidity == null,
//       child: new DropdownButtonHideUnderline(
//         child: new DropdownButton<String>(
//           value: addtiionalratingclassOptions, 
//           //saveLicenseData.dtValidity,
//           isDense: true,
//           onChanged: (String newValue) {
//             setState(() {
//               addtiionalratingclassOptions= newValue;
//                //saveLicenseData.dtValidity = newValue;
//               state.didChange(newValue);
              
//             });
//           },
//            items:licenseclassdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['className']),
//               value: item['id'].toString(),
//           );
//         }).toList(),
//         ),
//       ),
//     );
//   },
//   validator: (val) {
//     return val != '' ? null : 'Please select State ';
//   },
// );
//    }
//   Widget _ir() {
    
//      return  CheckboxListTile(
//   value: ir,
//   onChanged: (val) {
//     if (ir == false) {
//       setState(() {
//      ir = true;
//       });
//     } else if (ir == true) {
//       setState(() {
//         ir = false;
//       });
//     }
//   },
// //   subtitle: !checkboxValue
// //       ? Text(
// //           '',
// //           style: TextStyle(color: Colors.red),
// //         )
// //       : null,
//   title: new Text(
//     'IR',
//     style: TextStyle(fontSize: 14.0),
//      ),);
  
// }
//   Widget _additionalratingIR() {
     
//      return  CheckboxListTile(
//   value:additionalratingIR,
//   onChanged: (val) {
//     if (additionalratingIR == false) {
//       setState(() {
//      //  licenseDetail. ir 
//      additionalratingIR= true;
//       });
//     } else if (ir == true) {
//       setState(() {
//         //licenseDetail.ir
//         additionalratingIR = false;
//       });
//     }
//   },
// //   subtitle: !checkboxValue
// //       ? Text(
// //           '',
// //           style: TextStyle(color: Colors.red),
// //         )
// //       : null,
//   title: new Text(
//     'IR',
//     style: TextStyle(fontSize: 14.0),
//      ),);
//   }
//   Widget _coPilot(){
//       return  CheckboxListTile(
//   value:co_Pilot,
//   onChanged: (val) {
//     if (co_Pilot == false) {
//       setState(() {
//      //  licenseDetail. ir 
//      co_Pilot= true;
//       });
//     } else if (ir == true) {
//       setState(() {
//        co_Pilot = false;
//       });
//     }
//   },
// //   subtitle: !checkboxValue
// //       ? Text(
// //           '',
// //           style: TextStyle(color: Colors.red),
// //         )
// //       : null,
//   title: new Text(
//     'Co_Pilot',
//     style: TextStyle(fontSize: 14.0),
//      ),);
//   }
//   Widget _additionalratingcoPilot(){
//        return  CheckboxListTile(
//   value:additionalratingcoPilot,
//   onChanged: (val) {
//     if (additionalratingcoPilot == false) {
//       setState(() {
//      //  licenseDetail. ir 
//      //licenseDetail.copilot
//      additionalratingcoPilot= true;
//       });
//     } else if (ir == true) {
//       setState(() {
//         //licenseDetail.copilot
//         additionalratingcoPilot = false;
//       });
//     }
//   },
// //   subtitle: !checkboxValue
// //       ? Text(
// //           '',
// //           style: TextStyle(color: Colors.red),
// //         )
// //       : null,
//   title: new Text(
//     'Co_Pilot',
//     style: TextStyle(fontSize: 14.0),
//      ),);   
//   }
//   Widget _examiners() {
//      return   FormField<String>(
//   builder: (FormFieldState<String> state) {
//     return InputDecorator(
//       decoration: InputDecoration(
//         //icon: const Icon(Icons.color_lens),
//         labelText:'Examiners ',
//         hintText:'Select Examiners Options',
//         errorText: state.hasError ? state.errorText : null,
//       ),
//       isEmpty:  saveLicenseData.dtValidity == null,
//       child: new DropdownButtonHideUnderline(
//         child: new DropdownButton<String>(
//           value: examiners, 
//           //saveLicenseData.dtValidity,
//           isDense: true,
//           onChanged: (String newValue) {
//             setState(() {
//               examiners= newValue;
//                //saveLicenseData.dtValidity = newValue;
//               state.didChange(newValue);              
//             });
//           },
//           items: licenseclassdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['className']),
//               value: item['id'].toString(),
//             );
//         }).toList(),
//         ),
//       ),
//     );
//   },
//   validator: (val) {
//     return val != '' ? null : 'Please select State ';
//   },
// );  
//   }
//   Widget additionalLicenceNumberdata() {
//       return TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.phone),
//             hintText: 'EnterLicence number',
//             labelText: 'Licence number',
//           ),
//           keyboardType: TextInputType.phone,        
//           validator: (val){ return val != '' 
//               ? null
//               : 'Enter  Licence number  ';},
//           onSaved: (val) =>additionalLicenceNumber = val,
//           );
//   }
//   Widget _remarksandRestrictions() {
//     return   TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.person),
//             hintText: 'Enter your Remarks and Restrictions :',
//             labelText: 'Remarks and Restrictions :',
//           ),
//          // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
//           //validator: (val) => val.isEmpty ? 'Remarksis required' : null,
//           onSaved: (val) => personal.remarks= val,
//         );

//   }
//   Widget _instructorremarksandRestrictions() {
//      return   TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.person),
//             hintText: 'Enter your Remarks and Restrictions :',
//             labelText: 'Remarks and Restrictions :',
//           ),
//          // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
//           //validator: (val) => val.isEmpty ? 'Remarksis required' : null,
//           onSaved: (val) => instructorremarksandRestrictions= val,
//         );
//   }
  Widget _contries() {
   return  FormField<String>(
  builder: (FormFieldState<String> state) {
    return InputDecorator(  
      decoration: InputDecoration(
        //icon: const Icon(Icons.color_lens),
        labelText:'State of issue * ',
        hintText:'Select State',
        errorText: state.hasError ? state.errorText : null,
      ),
      isEmpty: countriesdatalist == [],
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value:  contries,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              contries= newValue;
              print(newValue);
               saveLicenseData.countryId = int.parse(newValue);
              state.didChange(newValue);
              print(saveLicenseData.countryId);
              
            });
          },
         
          items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['countryCode']),
              value: item['id'].toString(),
            );
          }).toList(),
        ),
      ),
    );
  },
  validator: (val) {
    return val != null? null : 'Please select State ';
  },
);
     
  }
  Widget _licenceCodeOptions() {
     return  FormField<String>(
  builder: (FormFieldState<String> state) {
    return InputDecorator(
      decoration: InputDecoration(
        //icon: const Icon(Icons.color_lens),
        labelText:'LicenceCode * ',
         hintText:'Select LicenceCode',
        errorText: state.hasError ? state.errorText : null,
      ),
      isEmpty: countriesdatalist==[],
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value:  licenceCodeOptions,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
            licenceCodeOptions= newValue;
               saveLicenseData.codeId = int.parse(newValue);
              state.didChange(newValue);
              
            });
          },
          items: countriesdatalist.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['code']),
              value: item['id'].toString(),
            );
          }).toList(),
        ),
      ),
    );
  },
  validator: (val) {
    return val != null ? null : 'Please select ';
  },
);
  } 
//   Widget _examinarRemarksandRestrictions() {
//      return   TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.person),
//             hintText: 'Enter your Remarks and Restrictions :',
//             labelText: 'Remarks and Restrictions :',
//           ),
//          // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
//           //validator: (val) => val.isEmpty ? 'Remarksis required' : null,
//           onSaved: (val) => examinarRemarksandRestrictions= val,
//         );
//     // 
//   }
//   Widget _licenceNumber() {
//      return TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.phone),
//             hintText: 'Enter Licence number',
//             labelText: 'Licence number',
//           ),
//           keyboardType: TextInputType.phone,
         
//           validator: (val){ return val != '' 
//               ? null
//               : 'Enter  Licence number  ';},
//           onSaved: (val) =>saveLicenseData.licenseNumber = val,
//           );
   
//   }
//   Widget _examinerscertificatenumber() {
    
//        return TextFormField(
//           decoration: const InputDecoration(
//             icon: const Icon(Icons.phone),
//             hintText: 'Enter Licence number',
//             labelText: 'Examiners certificate number ',
//           ),
//           keyboardType: TextInputType.phone,
         
//           validator: (val){ return val != '' 
//               ? null
//               : 'Enter  Licence number  ';},
//           onSaved: (val) =>examinerscertificatenumber = val,
//           );
   
//   }
//   Widget _titleOfLicenceOptions() {
//      return  FormField<String>(
//   builder: (FormFieldState<String> state) {
//     return InputDecorator(
//       decoration: InputDecoration(
//         //icon: const Icon(Icons.color_lens),
//         labelText:'Title of licence * ',
//          hintText:'Title of licence',
//         errorText: state.hasError ? state.errorText : null,
//       ),
//       isEmpty:  saveLicenseData.dtValidity == null,
//       child: new DropdownButtonHideUnderline(
//         child: new DropdownButton<String>(
//           value: titleOfLicenceOptions,// saveLicenseData.dtValidity,
//           isDense: true,
//           onChanged: (String newValue) {
//             setState(() {
//               titleOfLicenceOptions= newValue;
//                //saveLicenseData.dtValidity = newValue;
//               state.didChange(newValue);
              
//             });
//           },
//            items: licensetitlesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['title']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   },
//   validator: (val) {
//     return val != '' ? null : 'Please select ';
//   },
// );
//     // return ListTile(
//     //   leading: Text('Title of licence  :'),
//     //   title: DropdownButton<String>(
//     //     hint: Text('Title'),
//     //     icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
//     //     iconSize: 24,
//     //     elevation: 16,
//     //     style: TextStyle(color: Colors.deepPurple),
//     //     underline: Container(
//     //       height: 2,
//     //       color: Colors.deepPurpleAccent,
//     //     ),
//     //     onChanged: (String newValue) {
//     //       setState(() {
//     //         titleOfLicenceOptions = newValue;
//     //       print('titleOfLicenceOptions$titleOfLicenceOptions');});
//     //     },
//     //     items: licensetitlesdatalist.map((item) {
//     //         return new DropdownMenuItem(
//     //           child: new Text(item['title']),
//     //           value: item['id'].toString(),
//     //         );
//     //     }).toList(),
//     //     value: titleOfLicenceOptions,
//     //   ),
//     // );
//   }
//   Widget _dateOfInitialIssue() {
//    return TextFormField(
//              decoration: new InputDecoration(
//               icon: const Icon(Icons.calendar_today),
//               hintText: ' Select Date of initial issue :',
//               labelText: 'Date of initial issue :',
//             ),
//           //  controller: _controller,
//             keyboardType: TextInputType.datetime,
//            // validator: (val) =>
//            //     isValidDob(val) ? null : 'Not a valid date',
//             //onSaved: (val) => newContact.dob = convertToDate(val),
//           );
//     // return ListTile(
//     //   leading: Text('Date of initial issue : '),

//     //   title: Container(
//     //     child: Row(
//     //       children: [
//     //         Expanded(child:  Text(dateOfInitialIssue == null ? 'Pick' :dateOfInitialIssue.toString()),),
//     //         IconButton(

//     //           icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
//     //           color: Colors.deepPurple,
//     //           onPressed: () {
//     //             showDatePicker(

//     //                 context: context,
//     //                 initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//     //                 firstDate: DateTime(1950),
//     //                 lastDate: DateTime(2200)
//     //             ).then((date) {
//     //               setState(() {
//     //                 dateOfInitialIssue =  new DateFormat.yMMMMd().format(date);
//     //               });
//     //             });
//     //           },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//   Widget _dateofratingtest() {
//    return TextFormField(
//             decoration: new InputDecoration(
//               icon: const Icon(Icons.calendar_today),
//               hintText: ' Selectdate Of Rating Test :',
//               labelText: 'Date of date Of Rating Test :',
//             ),
//           //  controller: _controller,
//             keyboardType: TextInputType.datetime,
//            // validator: (val) =>
//            //     isValidDob(val) ? null : 'Not a valid date',
//             //onSaved: (val) => newContact.dob = convertToDate(val),
//           );
//     // return ListTile(
//     //   leading: Text('date Of Rating Test'),
//     //   title: Container(
//     //     child: Row(
//     //       children: [
//     //         Expanded(child:    Text(dateofratingtest == null ? 'pick' : dateofratingtest.toString()),),
//     //         IconButton(
//     //           icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
//     //           color: Colors.deepPurple,
//     //           onPressed: () {

//     //             showDatePicker(

//     //                 context: context,
//     //                 initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//     //                 firstDate: DateTime(1950),
//     //                 lastDate: DateTime(2200)
//     //             ).then((date) {
//     //               setState(() {
//     //                 dateofratingtest =  new DateFormat.yMMMMd().format(date);
//     //               });
//     //             });              },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//   Widget _dateofIRtest() {
//       return TextFormField(
//             decoration: new InputDecoration(
//               icon: const Icon(Icons.calendar_today),
//               hintText: ' Select Date of IR Test : :',
//               labelText: 'Date of IR Test ',
//             ),
//           //  controller: _controller,
//             keyboardType: TextInputType.datetime,
//            // validator: (val) =>
//            //     isValidDob(val) ? null : 'Not a valid date',
//             //onSaved: (val) => newContact.dob = convertToDate(val),
//           );
//     // return ListTile(
//     //   leading: Text('Date of IR Test : '),
//     //   title: Container(
//     //     child: Row(
//     //       children: [
//     //         Expanded(child:  Text(dateofIRtest == null ? 'Pick' : dateofIRtest.toString()),),
//     //         IconButton(
//     //           icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
//     //           color: Colors.deepPurple,
//     //           onPressed: () {
//     //             showDatePicker(

//     //                 context: context,
//     //                 initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//     //                 firstDate: DateTime(1950),
//     //                 lastDate: DateTime(2200)
//     //             ).then((date) {
//     //               setState(() {

//     //                 dateofIRtest = new DateFormat.yMMMMd().format(date);
//     //               dt_irtest=dateofIRtest.toString();
//     //               });
//     //             });
//     //           },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//   Widget _validuntil() {
//       return TextFormField(
//             decoration: new InputDecoration(
//               icon: const Icon(Icons.calendar_today),
//               hintText: ' Select Date',
//               labelText: 'Date of valid upto ',
//             ),
//           //  controller: _controller,
//             keyboardType: TextInputType.datetime,
//            // validator: (val) =>
//            //     isValidDob(val) ? null : 'Not a valid date',
//             //onSaved: (val) => newContact.dob = convertToDate(val),
//           );
//     // return ListTile(
//     //   leading: Text('Date of initial issue : '),
//     //   title: Container(
//     //     child: Row(
//     //       children: [
//     //         Expanded(child:  Text(validuntil == null ? 'Pick' : validuntil.toString()),),
//     //         IconButton(
//     //           icon: Icon(IconData(59701, fontFamily: 'MaterialIcons')),
//     //           color: Colors.deepPurple,
//     //           onPressed: () {

//     //             showDatePicker(

//     //                 context: context,
//     //                 initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//     //                 firstDate: DateTime(1950),
//     //                 lastDate: DateTime(2200)
//     //             ).then((date) {
//     //               setState(() {
//     //                 validuntil =  new DateFormat.yMMMMd().format(date);
//     //               });
//     //             });
//     //           },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//   Widget _countryCodes() {
//     return ListTile(
//       leading: Text('Issued by :   '),
//       title: DropdownButton<String>(
//         hint: Text('country code'),
//         icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(color: Colors.deepPurple),
//         underline: Container(
//           height: 2,
//           color: Colors.deepPurpleAccent,
//         ),
//         onChanged: (String newValue) {
//           setState(() {
//             countryCodes = newValue;print('countryCodes$countryCodes');
//           });
//         },
//         items:countriesdatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['countryName']),
//               value: item['id'].toString(),
//             );
//         }).toList(),
//         value: countryCodes,
//       ),
//     );
//   }
//   Widget _tpyeOptionData() {
//     return ListTile(
//       leading: Text('Type'),
//       title: DropdownButton<String>(
//         hint: Text('Option'),
//         icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(color: Colors.deepPurple),
//         underline: Container(
//           height: 2,
//           color: Colors.deepPurpleAccent,
//         ),
//         onChanged: (String newValue) {
//           setState(() {
//             tpyeOptionData = newValue;print('tpyeOptionData $tpyeOptionData');
//           });
//         },
//         items: licensetypedatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['typeName']),
//               value: item['id'].toString(),
//             );
//         }).toList(),
//         value: tpyeOptionData,
//       ),
//     );}
//   Widget _additionalratingtpyeOptionData() {
//     return ListTile(
//         leading: Text('Type'),
//         title: DropdownButton<String>(
//         hint: Text('Type'),
//         icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(color: Colors.deepPurple),
//         underline: Container( height: 2,color: Colors.deepPurpleAccent, ),
//         onChanged: (String newValue) {
//           setState(() {
//             additionalratingtpyeOptionData = newValue;
//      print('additionalratingtpyeOptionData $additionalratingtpyeOptionData'); });
//         },
//         items:licensetypedatalist.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['typeName']),
//               value: item['id'].toString(),
//             );
//         }).toList(),
//         value: additionalratingtpyeOptionData,
//       ),
//     );}
//   Widget _instructorsOptions() {
//     return ListTile(
//         leading: Text('Instructors :'),
//         title: DropdownButton<String>(
//         hint: Text('Type'),
//         icon: Icon(IconData(58131, fontFamily: 'MaterialIcons')),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(color: Colors.deepPurple),
//         underline: Container(height: 2, color: Colors.deepPurpleAccent,),
//         onChanged: (String newValue) {
//            setState(() {
//             instructorsOptions = newValue;
//             print('instructorsOptions $instructorsOptions'); });
//            },
//         items: <String>[
//            'FE(A)',
//             'FE(H)',
//             'FE(As)',
//             'FE(S)',
//             'FE(B)',
//             'TRE(A)',
//             'TRE(PL)',
//             'TRE(H)',
//             'CRE',
//             'IRE(A)',
//             'IRE(H)',
//             'IRE(As)',
//             'SFE(A)',
//             'SFE(PL)',
//             'SFE(H)',
//             'FIE(A)',
//             'FIE(H)',
//             'FIE(As)',
//             'FIE(S)',
//             'FIE(B)'
//         ].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         value: instructorsOptions,
//       ),
//     );
 // }

 void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
 //shoe(  saveLicenseData,licenseDetail,personal);
      print('Form save called, newContact is now up to date...');
      print('Email: ${saveLicenseData.dtValidity}');
//       print('Dob: ${newContact.dob}');
//       print('Phone: ${newContact.phone}');
//       print('Email: ${newContact.email}');
//       print('Favorite Color: ${newContact.favoriteColor}');
//       print('========================================');
      print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
    }
  }
    void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
