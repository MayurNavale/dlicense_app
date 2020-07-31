// import 'package:flutter/material.dart';
// import 'dart:convert';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Licencepagehome(),
//     );
//   }
// }

// var contries;
// List instructordatafrompage;

// class Licencepagehome extends StatefulWidget {
//   @override
//   _LicencepagehomeState createState() => _LicencepagehomeState();
// }

// class _LicencepagehomeState extends State<Licencepagehome> {
//   Welcome userdata = Welcome();//.fromJson(jsonstring);
//   var firstNameController = TextEditingController(text: "Your initial value");
//  String gh='';
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text(' Dlicence'),
//       ),
//       body: Column(
//         children: [
//           TextFormField(
//             //controller: TextEditingController(text:(userdata.examinerNumber).toString()??''.toString()),
//             initialValue:gh ??userdata.examinerNumber.toString(),
//             decoration: InputDecoration(
//               labelText: "Enter Name",
//               fillColor: Colors.white,
//               hintStyle: TextStyle(
//                   color: Color.fromRGBO(0, 0, 0, 1.0),
//                   fontFamily: "SFProText-Regular"),
//             ),
//             // validator: validatingName,
//           ),
//           DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               labelText: ' Type * ',
//             ),
//             value:contries,// findval(userdata.countryId, 1), //
//             onChanged: (String newValue) {
//               contries = newValue;
//             },
//             validator: (value) => value == null ? 'field required' : null,
//             onSaved: (val) => userdata.countryId = userdata.countryId,
//             items: countriesdatalist.map((item) {
//               return new DropdownMenuItem(
//                 child: new Text(item['type']),
//                 value: item['type'].toString(),
//                 onTap: () {
//                   userdata.countryId = item['id'];
//                   print(userdata.codeId);
//                 },
//               );
//             }).toList(),
//           ),
//           FlatButton(child: Text('Examiner'), onPressed: () async {}),
//         ],
//       ),
//     );
//   }
// }

// double discretevalue = 2.0;
// double hospitaldiscretevalue = 25.0;
// var instructorsOptions;
// var nationality;

// Map<String, dynamic> jsonstring = {
//   "additionalRemarks": "string",
//   "codeId": 0,
//   "countryId": 0,
//   "dtIrtest": "2020-07-01 00:00:00.000",
//   "dtIssue": "2020-07-01 00:00:00.000",
//   "dtRatingtest": "2020-07-01 00:00:00.000",
//   "dtValidity": "2020-07-01 00:00:00.000",
//   "endorsementDetails": [
//     {"endorsementTypeId": 1, "id": 0}
//   ],
//   "examinerDetails": [
//     {"examinerTypeId": 1, "id": 0, "remark": "string"}
//   ],
//   "examinerId": 1,
//   "examinerNumber": 0,
//   "id": 0,
//   "instructorDetails": [
//     {"id": 0, "instructorTypeId": 1, "remark": "string"}
//   ],
//   "licenseDetails": [
//     {
//       "additionalRating": true,
//       "classId": 1,
//       "copilot": true,
//       "id": 0,
//       "ir": true,
//       "typeId": 1
//     }
//   ],
//   "licenseNumber": 123,
//   "ratingCertId": "string",
//   "remarks": "string",
//   "stateId": 1,
//   "titleId": 1,
//   "userId": "string"
// };

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//   Welcome({
//     this.additionalRemarks,
//     this.codeId,
//     this.countryId,
//     this.dtIrtest,
//     this.dtIssue,
//     this.dtRatingtest,
//     this.dtValidity,
//     this.endorsementDetails,
//     this.examinerDetails,
//     this.examinerId,
//     this.examinerNumber,
//     this.id,
//     this.instructorDetails,
//     this.licenseDetails,
//     this.licenseNumber,
//     this.ratingCertId,
//     this.remarks,
//     this.stateId,
//     this.titleId,
//     this.userId,
//   });

//   String additionalRemarks;
//   int codeId;
//   int countryId;
//   String dtIrtest;
//   String dtIssue;
//   String dtRatingtest;
//   String dtValidity;
//   List<EndorsementDetail> endorsementDetails;
//   List<ExaminerDetail> examinerDetails;
//   int examinerId;
//   int examinerNumber;
//   int id;
//   List<InstructorDetail> instructorDetails;
//   List<LicenseDetail> licenseDetails;
//   int licenseNumber;
//   String ratingCertId;
//   String remarks;
//   int stateId;
//   int titleId;
//   String userId;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         additionalRemarks: json["additionalRemarks"] == null
//             ? null
//             : json["additionalRemarks"],
//         codeId: json["codeId"] == null ? null : json["codeId"],
//         countryId: json["countryId"] == null ? null : json["countryId"],
//         dtIrtest: json["dtIrtest"] == null ? null : json["dtIrtest"],
//         dtIssue: json["dtIssue"] == null ? null : json["dtIssue"],
//         dtRatingtest:
//             json["dtRatingtest"] == null ? null : json["dtRatingtest"],
//         dtValidity: json["dtValidity"] == null ? null : json["dtValidity"],
//         endorsementDetails: json["endorsementDetails"] == null
//             ? null
//             : List<EndorsementDetail>.from(json["endorsementDetails"]
//                 .map((x) => EndorsementDetail.fromJson(x))),
//         examinerDetails: json["examinerDetails"] == null
//             ? null
//             : List<ExaminerDetail>.from(
//                 json["examinerDetails"].map((x) => ExaminerDetail.fromJson(x))),
//         examinerId: json["examinerId"] == null ? null : json["examinerId"],
//         examinerNumber:
//             json["examinerNumber"] == null ? null : json["examinerNumber"],
//         id: json["id"] == null ? null : json["id"],
//         instructorDetails: json["instructorDetails"] == null
//             ? null
//             : List<InstructorDetail>.from(json["instructorDetails"]
//                 .map((x) => InstructorDetail.fromJson(x))),
//         licenseDetails: json["licenseDetails"] == null
//             ? null
//             : List<LicenseDetail>.from(
//                 json["licenseDetails"].map((x) => LicenseDetail.fromJson(x))),
//         licenseNumber:
//             json["licenseNumber"] == null ? null : json["licenseNumber"],
//         ratingCertId:
//             json["ratingCertId"] == null ? null : json["ratingCertId"],
//         remarks: json["remarks"] == null ? null : json["remarks"],
//         stateId: json["stateId"] == null ? null : json["stateId"],
//         titleId: json["titleId"] == null ? null : json["titleId"],
//         userId: json["userId"] == null ? null : json["userId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "additionalRemarks": additionalRemarks == null ? '' : additionalRemarks,
//         "codeId": codeId == null ? null : codeId,
//         "countryId": countryId == null ? null : countryId,
//         "dtIrtest": dtIrtest == null ? null : dtIrtest,
//         "dtIssue": dtIssue == null ? null : dtIssue,
//         "dtRatingtest": dtRatingtest == null ? null : dtRatingtest,
//         "dtValidity": dtValidity == null ? null : dtValidity,
//         "endorsementDetails": endorsementDetails == null
//             ? null
//             : List<dynamic>.from(endorsementDetails.map((x) => x.toJson())),
//         "examinerDetails": examinerDetails == null
//             ? null
//             : List<dynamic>.from(examinerDetails.map((x) => x.toJson())),
//         "examinerId": examinerId == null ? null : examinerId,
//         "examinerNumber": examinerNumber == null ? null : examinerNumber,
//         "id": id == null ? null : id,
//         "instructorDetails": instructorDetails == null
//             ? null
//             : List<dynamic>.from(instructorDetails.map((x) => x.toJson())),
//         "licenseDetails": licenseDetails == null
//             ? null
//             : List<dynamic>.from(licenseDetails.map((x) => x.toJson())),
//         "licenseNumber": licenseNumber == null ? null : licenseNumber,
//         "ratingCertId": ratingCertId == null ? null : ratingCertId,
//         "remarks": remarks == null ? null : remarks,
//         "stateId": stateId == null ? null : stateId,
//         "titleId": titleId == null ? null : titleId,
//         "userId": userId == null ? null : userId,
//       };
// }

// class EndorsementDetail {
//   EndorsementDetail({
//     this.endorsementTypeId,
//     this.id,
//   });

//   int endorsementTypeId;
//   int id;

//   factory EndorsementDetail.fromJson(Map<String, dynamic> json) =>
//       EndorsementDetail(
//         endorsementTypeId: json["endorsementTypeId"] == null
//             ? null
//             : json["endorsementTypeId"],
//         id: json["id"] == null ? null : json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "endorsementTypeId":
//             endorsementTypeId == null ? null : endorsementTypeId,
//         "id": id == null ? null : id,
//       };
// }

// class ExaminerDetail {
//   ExaminerDetail({
//     this.examinerTypeId,
//     this.id,
//     this.remark,
//   });

//   int examinerTypeId;
//   int id;
//   String remark;

//   factory ExaminerDetail.fromJson(Map<String, dynamic> json) => ExaminerDetail(
//         examinerTypeId:
//             json["examinerTypeId"] == null ? null : json["examinerTypeId"],
//         id: json["id"] == null ? null : json["id"],
//         remark: json["remark"] == null ? null : json["remark"],
//       );

//   Map<String, dynamic> toJson() => {
//         "examinerTypeId": examinerTypeId == null ? null : examinerTypeId,
//         "id": id == null ? null : id,
//         "remark": remark == null ? null : remark,
//       };
// }

// class InstructorDetail {
//   InstructorDetail({
//     this.id,
//     this.instructorTypeId,
//     this.remark,
//   });

//   int id;
//   int instructorTypeId;
//   String remark;

//   factory InstructorDetail.fromJson(Map<String, dynamic> json) =>
//       InstructorDetail(
//         id: json["id"] == null ? null : json["id"],
//         instructorTypeId:
//             json["instructorTypeId"] == null ? null : json["instructorTypeId"],
//         remark: json["remark"] == null ? null : json["remark"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "instructorTypeId": instructorTypeId == null ? null : instructorTypeId,
//         "remark": remark == null ? null : remark,
//       };
// }

// class LicenseDetail {
//   LicenseDetail({
//     this.additionalRating,
//     this.classId,
//     this.copilot,
//     this.id,
//     this.ir,
//     this.typeId,
//   });

//   bool additionalRating;
//   int classId;
//   bool copilot;
//   int id;
//   bool ir;
//   int typeId;

//   factory LicenseDetail.fromJson(Map<String, dynamic> json) => LicenseDetail(
//         additionalRating:
//             json["additionalRating"] == null ? null : json["additionalRating"],
//         classId: json["classId"] == null ? null : json["classId"],
//         copilot: json["copilot"] == null ? null : json["copilot"],
//         id: json["id"] == null ? null : json["id"],
//         ir: json["ir"] == null ? null : json["ir"],
//         typeId: json["typeId"] == null ? null : json["typeId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "additionalRating": additionalRating == null ? null : additionalRating,
//         "classId": classId == null ? null : classId,
//         "copilot": copilot == null ? null : copilot,
//         "id": id == null ? null : id,
//         "ir": ir == null ? null : ir,
//         "typeId": typeId == null ? null : typeId,
//       };
// }

// List<Map<String, dynamic>> countriesdatalist = [
//   {"id": 1, "type": " FI(A)"},
//   {"id": 2, "type": " FI(As)"},

// ];
// String findval(int a, int casevalue) {
//   switch (casevalue) {
//     case 1:
//       {
//         int val = a;
//         val--;
       
//         for (int dat = 0; dat <= countriesdatalist.length; dat++) {
//           if (dat == val) {
//             print(countriesdatalist[dat]['type']);
//             return countriesdatalist[dat]['type'];
          
//         }
//         }
//       }

//       break;

//     case 2:
//       {}
//       break;

//     //  levelvaluedata=levelvalue(2);

//     case 3:
//       {
//         //valuedata=levelvalue(3);
//       }
//       break;
//     case 4:
//       {}
//       break;
//     case 5:
//       {
//         //  levelvaluedata= sixear.toString();
//       }
//       break;
//     case 6:
//       {
//         //  levelvaluedata= levelvalue(6);
//       }
//       break;

//     default:
//       {
//         return null; //statements;
//       }
//       break;
//   }
// }
