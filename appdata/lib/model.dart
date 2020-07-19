
import 'dart:convert';
import 'showselecteddata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  List countriesdata = [];
    List licenseclassdata=[];
  List licensecodesdata=[];
  List licensetitlesdata=[];
  List licensetypedata=[];
  List statedata=[];

  List apidata = [];
  //String classOptions;
   List classdata = [];
  List<Map<String, dynamic>> planet ;
  List planetX = [];List planetB = [];
  List filteredCountries = [];
  //List planetList = ["planet", "Venus", "Earth"];

  List urls=[
  'http://192.168.43.246:8080/dLicence/api/countries/v1',
  'http://192.168.43.246:8080/dLicence/api/licenseclass/v1',
  'http://192.168.43.246:8080/dLicence/api/licensecodes/v1',
  'http://192.168.43.246:8080/dLicence/api/licensetitles/v1',
  'http://192.168.43.246:8080/dLicence/api/licensetype/v1',
  'http://192.168.43.246:8080/dLicence/api/states/v1'];

 
  List<Map<String, dynamic>> countriesdatalist=[];
  List<Map<String, dynamic>> licenseclassdatalist=[]; 
  List<Map<String, dynamic>> licensecodesdatalist=[];
  List<Map<String, dynamic>> licensetitlesdatalist=[];
  List<Map<String, dynamic>> licensetypedatalist=[];
  List<Map<String, dynamic>> statedatalist=[];
 


    int licenceNumber;
     int licenceCodeOptionsid; 

    bool ir = false;
    bool co_Pilot = false;
    bool additionalratingcoPilot=false;
    bool additionalratingIR=false;
    bool loaded=false;

    String dt_irtest;
    String licence_Number;
    String countryCodes;
    String _class;
    String tpyeOptionData;
    String classOptions;
    String examinarRemarksandRestrictions;
    String ratingcertificateendorsement;
    String additionalratingtpyeOptionData;
    String instructorremarksandRestrictions;
   
    var contries;
    var licenceCodeOptions;
    var titleOfLicenceOptions;
    var dateofratingtest;
    var dateOfInitialIssue;
    var dateofIRtest;
    var examiners;
    var additionalLicenceNumber;
    var validuntil;
    var examinerscertificatenumber;
    var instructorsOptions;
    var remarksandRestrictions; 
    var addtiionalratingclassOptions;

class ClassModal extends StatefulWidget {
  @override
  _ClassModalState createState() => _ClassModalState();
}

class _ClassModalState extends State<ClassModal> {

  String a;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter listview with json'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                RaisedButton(
                  child: Text('showvalue',style: TextStyle(fontSize: 20),),
                  onPressed: () {Navigator.push
                  (context, MaterialPageRoute(builder: (context) => ShowSelectedData()),
              );},
                ),

                RaisedButton(
                  child: Text('query', style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    a = 'd';
                    shoe();
                  },
                ),
//                 
               ],
           )
      );
  }
}

class Licence {
  String additionalRemarks;
  int codeId;
  String dt_irtest;
  String dt_issue;
  String dt_ratingtest;
  String dt_validity;
  int examinerCodeId;
  int examinerNumber;
  int id;
  int issuedBy;
  List<LicenseDetails> licenseDetails;
  int licenseNumber;
 // List<Personnel> personnel;
  String ratingCertId;
  String remarks;
  int stateId;
  int titleId;
  Licence(
      this.additionalRemarks,
      this.codeId,
      this.dt_irtest,
      this.dt_issue,
      this.dt_ratingtest,
      this.dt_validity,
      this.examinerCodeId,
      this.examinerNumber,
      this.id,
      this.issuedBy,
      this.licenseDetails,
      this.licenseNumber,
     // this.personnel,
      this.ratingCertId,
      this.remarks,
      this.stateId,
      this.titleId);
  Map toJson() {
    List<Map> licenseDetails = this.licenseDetails != null
        ? this.licenseDetails.map((i) => i.toJson()).toList()
        : null;

    // List<Map> personnel = this.personnel != null
    //     ? this.personnel.map((i) => i.toJson()).toList()
    //     : null;

    return {
      "additionalRemarks": additionalRemarks,
      "codeId": codeId,
      "dt_irtest": dt_irtest,
      "dt_issue": dt_issue,
      "dt_ratingtest": dt_ratingtest,
      "dt_validity": dt_validity,
      "examinerCodeId": examinerCodeId,
      "examinerNumber": examinerNumber,
      "id": id,
      "issuedBy": issuedBy,
      'licenseDetails': licenseDetails,
      "licenseNumber": licenseNumber,
    // "personnel" : personnel,
      "ratingCertId": ratingCertId,
      "remarks": remarks,
      "stateId": stateId,
      "titleId": titleId
    };
  }
}

class LicenseDetails {
  bool additionalRating;
  int classId;
  bool copilot;
  int id;
  bool ir;
  int typeId;

  LicenseDetails(this.additionalRating, this.classId, this.copilot, this.id,
      this.ir, this.typeId);

  Map toJson() => {
        "additionalRating": additionalRating,
        "classId": classId,
        "copilot": copilot,
        "id": id,
        "ir": ir,
        "typeId": typeId
      };
}

class Personnel {
  int id;
  String idUser;
  String personnelType;
  String remarks;

  Personnel(this.id, this.idUser, this.personnelType, this.remarks);

  Personnel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['idUser'];
    personnelType = json['personnelType'];
    remarks = json['remarks'];
  }

  Map toJson() => {
        "id": id,
        "idUser": idUser,
        "personnelType": personnelType,
        "remarks": remarks,
      };
}

String dt='2019-07-19'.toString();
 String userid='123e4567-e89b-12d3-a456-426655440000';
int a =2;
int b = 2;
bool v = true;
String m = 'rowdata';
String n = 'rowDataB';
String s = 'rowDataC';

shoe() {
 

//   List<LicenseDetails> licenseDetails = [
    // LicenseDetails,
    // addtiionalratingclassOptions,
    // additionalratingcoPilot,
    // a,
    // additionalratingIR,
    // a)
    // ];
//   List<Personnel> personnel = [Personnel(1, m, n, s)];
      //// {int id;      String idUser;   String personnelType;      String remarks;}
//   Licence licence = Licence(
//       m,                          //String additionalRemarks;
        // licenceCodeOptions,      // int codeId;
        // dateofIRtest,             //String dt_irtest;
        // dateOfInitialIssue,       //String dt_issue;
        //  dateofratingtest,         //String dt_ratingtest;
        //  validuntil,               //String dt_validity;
        //  a,                          // int examinerCodeId;
        //  b,                         //  int examinerNumber;
        //  a,                           //int id;
        //  validuntil,                 // int issuedBy;
        //  licenseDetails,             
        //  licenceNumber,                   // int licenseNumber;
        //  personnel,                   
        //  ratingcertificateendorsement,   //String ratingCertId;
        //  remarksandRestrictions,        //String remarks;
        //  a,                          //int stateId;
        //  titleOfLicenceOptions);          //  int titleId;
//   String jsonTutorial = jsonEncode(licence);
//   print(jsonTutorial);
//    sendRequest( jsonTutorial) ;
// }

  //=alldetail;

  List<LicenseDetails> licenseDetails = [LicenseDetails(v, a, v, null, v, a)];
  //List<Personnel> personnel = [Personnel(34,  userid,  n,  n)];

  Licence licence = Licence(
      m, 1, dt, dt, dt, dt, a, b, a, b, licenseDetails, a, m, n, a, 2);
  String jsonTutorial = jsonEncode(licence);
  print(jsonTutorial);

   sendRequest( jsonTutorial) ;
}
 sendRequest( String data) async {

 

    var url = 'http://192.168.43.246:8080/dLicence/api/license/v1';
    http.post(url, headers: {"Content-Type": "application/json"}, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });  
  }