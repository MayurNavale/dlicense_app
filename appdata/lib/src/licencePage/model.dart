
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';

String initialnumber;
Map<String, dynamic> jsonstring ={
  "additionalRemarks": "string",
  "codeId": 1,
  "countryId": 1,
  "dtIrtest": "2020-07-01",
  "dtIssue": "2020-07-02",
  "dtRatingtest": "2020-07-03",
  "dtValidity": "2020-07-04",
  "endorsementDetails": [
    {
      "endorsementTypeId": 1,
      "id": 0
    }
  ],
  "examinerDetails": [
    {
      "examinerTypeId": 1,
      "id": 0,
      "remark": "string"
    }
  ],
  "examinerId": 1,
  "examinerNumber": 1,
  "id": 0,
  "instructorDetails": [
    {
      "id": 0,
      "instructorTypeId": 1,
      "remark": "string"
    }
  ],
  "licenseDetails": [
    {
      "additionalRating": true,
      "classId": 1,
      "copilot": true,
      "id": 0,
      "ir": true,
      "typeId": 1
    }
  ],
  "licenseNumber": 123,
  "ratingCertId": "string",
  "remarks": "string",
  "stateId": 1,
  "titleId": 1,
  "userId": "string"
};
Licenceclass licenceclassFromJson(String str) => Licenceclass.fromJson(json.decode(str));
String licenceclassToJson(Licenceclass data) => json.encode(data.toJson());

class Licenceclass {
  Licenceclass({
    this.additionalRemarks,
    this.codeId=0,
    this.countryId=0,
    this.dtIrtest,
    this.dtIssue,
    this.dtRatingtest,
    this.dtValidity,
    this.endorsementDetails,
    this.examinerDetails,
    this.examinerId=0,
    this.examinerNumber,
    this.id=0,
    this.instructorDetails,
    this.licenseDetails,
    this.licenseNumber,
    this.ratingCertId='',
    this.remarks,
    this.stateId=0,
    this.titleId=0,
    this.userId,
  });

  String additionalRemarks;
  int codeId;
  int countryId;
  String dtIrtest;
  String dtIssue;
  String dtRatingtest;
  String dtValidity;
  List<EndorsementDetail> endorsementDetails;
  List<ExaminerDetail> examinerDetails;
  int examinerId;
  int examinerNumber;
  int id;
  List<InstructorDetail> instructorDetails;
  List<LicenseDetail> licenseDetails;
  int licenseNumber;
  String ratingCertId;
  String remarks;
  int stateId;
  int titleId;
  String userId;

  factory Licenceclass.fromJson(Map<String, dynamic> json) => Licenceclass(
        additionalRemarks: json["additionalRemarks"] == null
            ? null
            : json["additionalRemarks"],
        codeId: json["codeId"] == null ? null : json["codeId"],
        countryId: json["countryId"] == null ? null : json["countryId"],
        dtIrtest: json["dtIrtest"] == null ? null : json["dtIrtest"],
        dtIssue: json["dtIssue"] == null ? null : json["dtIssue"],
        dtRatingtest:
            json["dtRatingtest"] == null ? null : json["dtRatingtest"],
        dtValidity: json["dtValidity"] == null ? null : json["dtValidity"],
        endorsementDetails: json["endorsementDetails"] == null
            ? null
            : List<EndorsementDetail>.from(json["endorsementDetails"]
                .map((x) => EndorsementDetail.fromJson(x))),
        examinerDetails: json["examinerDetails"] == null
            ? null
            : List<ExaminerDetail>.from(
                json["examinerDetails"].map((x) => ExaminerDetail.fromJson(x))),
        examinerId: json["examinerId"] == null ? null : json["examinerId"],
        examinerNumber:
            json["examinerNumber"] == null ? null : json["examinerNumber"],
        id: json["id"] == null ? null : json["id"],
        instructorDetails: json["instructorDetails"] == null
            ? null
            : List<InstructorDetail>.from(json["instructorDetails"]
                .map((x) => InstructorDetail.fromJson(x))),
        licenseDetails: json["licenseDetails"] == null
            ? null
            : List<LicenseDetail>.from(
                json["licenseDetails"].map((x) => LicenseDetail.fromJson(x))),
        licenseNumber:
            json["licenseNumber"] == null ? null : json["licenseNumber"],
        ratingCertId:
            json["ratingCertId"] == null ? null : json["ratingCertId"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        stateId: json["stateId"] == null ? null : json["stateId"],
        titleId: json["titleId"] == null ? null : json["titleId"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "additionalRemarks":
            additionalRemarks == null ? '' : additionalRemarks,
        "codeId": codeId == null ? null : codeId,
        "countryId": countryId == null ? null : countryId,
        "dtIrtest": dtIrtest == null ? null : dtIrtest,
        "dtIssue": dtIssue == null ? null : dtIssue,
        "dtRatingtest": dtRatingtest == null ? null : dtRatingtest,
        "dtValidity": dtValidity == null ? null : dtValidity,
        "endorsementDetails": endorsementDetails == null
            ? null
            : List<dynamic>.from(endorsementDetails.map((x) => x.toJson())),
        "examinerDetails": examinerDetails == null
            ? null
            : List<dynamic>.from(examinerDetails.map((x) => x.toJson())),
        "examinerId": examinerId == null ? null : examinerId,
        "examinerNumber": examinerNumber == null ? null : examinerNumber,
        "id": id == null ? null : id,
        "instructorDetails": instructorDetails == null
            ? null
            : List<dynamic>.from(instructorDetails.map((x) => x.toJson())),
        "licenseDetails": licenseDetails == null
            ? null
            : List<dynamic>.from(licenseDetails.map((x) => x.toJson())),
        "licenseNumber": licenseNumber == null ? null : licenseNumber,
        "ratingCertId": ratingCertId == null ? null : ratingCertId,
        "remarks": remarks == null ? null : remarks,
        "stateId": stateId == null ? null : stateId,
        "titleId": titleId == null ? null : titleId,
        "userId": userId == null ? null : userId,
      };
}

class EndorsementDetail {
  EndorsementDetail({
    this.endorsementTypeId=0,
    this.id=0,
  });

  int endorsementTypeId;
  int id;

  factory EndorsementDetail.fromJson(Map<String, dynamic> json) =>
      EndorsementDetail(
        endorsementTypeId: json["endorsementTypeId"] == null
            ? null
            : json["endorsementTypeId"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "endorsementTypeId":
            endorsementTypeId == null ? null : endorsementTypeId,
        "id": id == null ? null : id,
      };
}

class ExaminerDetail {
  ExaminerDetail({
    this.examinerTypeId,
    this.id=0,
    this.remark,
  });

  int examinerTypeId;
  int id;
  String remark;

  factory ExaminerDetail.fromJson(Map<String, dynamic> json) => ExaminerDetail(
        examinerTypeId:
            json["examinerTypeId"] == null ? null : json["examinerTypeId"],
        id: json["id"] == null ? null : json["id"],
        remark: json["remark"] == null ? null : json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "examinerTypeId": examinerTypeId == null ? null : examinerTypeId,
        "id": id == null ? null : id,
        "remark": remark == null ? null : remark,
      };
}

class InstructorDetail {
  InstructorDetail({
    this.id=0,
    this.instructorTypeId,
    this.remark,
  });

  int id;
  int instructorTypeId;
  String remark;

  factory InstructorDetail.fromJson(Map<String, dynamic> json) =>
      InstructorDetail(
        id: json["id"] == null ? null : json["id"],
        instructorTypeId:
            json["instructorTypeId"] == null ? null : json["instructorTypeId"],
        remark: json["remark"] == null ? null : json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "instructorTypeId": instructorTypeId == null ? null : instructorTypeId,
        "remark": remark == null ? null : remark,
      };
}

class LicenseDetail {
  LicenseDetail({
    this.additionalRating=false,
    this.classId=0,
    this.copilot=false,
    this.id=0,
    this.ir=false,
    this.typeId=0,
  });

  bool additionalRating;
  int classId;
  bool copilot;
  int id;
  bool ir;
  int typeId;

  factory LicenseDetail.fromJson(Map<String, dynamic> json) => LicenseDetail(
        additionalRating:
            json["additionalRating"] == null ? null : json["additionalRating"],
        classId: json["classId"] == null ? null : json["classId"],
        copilot: json["copilot"] == null ? null : json["copilot"],
        id: json["id"] == null ? null : json["id"],
        ir: json["ir"] == null ? null : json["ir"],
        typeId: json["typeId"] == null ? null : json["typeId"],
      );

  Map<String, dynamic> toJson() => {
        "additionalRating": additionalRating == null ? null : additionalRating,
        "classId": classId == null ? null : classId,
        "copilot": copilot == null ? null : copilot,
        "id": id == null ? null : id,
        "ir": ir == null ? null : ir,
        "typeId": typeId == null ? null : typeId,
      };
}

int val;
     
  String findval(int a, int casevalue) {
    switch (casevalue) {
      case 1:
        {
           val = a;
          val--;
          if(a==0)return contries;
          else return statedatalist[val]['stateName'];
    }
        break;

      case 2:
        {
           val = a;
          val--;
          if(a==0){return contries;}
          else  return licensecodesdatalist[val]['code'];
         }
        break;

        //  levelvaluedata=levelvalue(2);

        
      case 3:
        {
           val = a;
          val--;
           if(a==0){return contries;}
           else return countriesdatalist[val]['countryName'];
      }
        break;
      case 4:
        {
           int val = a;
          val--;
           if(a==0){return contries;}
           else return licenseclassdatalist[val]['className'];
            }
        break;
      case 5:
        {
          int val = a;
          val--;
          for (int dat = 0; dat <= examinerdatalist.length; dat++) {
            if (dat == val) {
            //  print(examinerdatalist[dat]['examinerType']);
             return examinerdatalist[dat]['examinerType'];
            } //  levelvaluedata= sixear.toString();
        }
        }
        break;
      case 6:
        {
          int val = a;
          val--;
        // return instructordatalist[val]['instructorType'];
          for (int dat = 0; dat <= instructordatalist.length; dat++) {
            if (dat == val) {
            //  print(instructordatalist[dat]['instructorType']);
             return instructordatalist[dat]['instructorType'];
            } //  levelvaluedata= sixear.toString();
        } //  levelvaluedata= levelvalue(6);
        }
        break;
       case 7:
        {
          int val = a;
          val--;
        // return instructordatalist[val]['instructorType'];
          for (int dat = 0; dat <= endorsementdatalist.length; dat++) {
            if (dat == val) {
            //  print(endorsementdatalist[dat]['endorsementType']);
             return endorsementdatalist[dat]['endorsementType'];
            } //  levelvaluedata= sixear.toString();
        } //  levelvaluedata= levelvalue(6);
        }
        break;
        case 8:
        {
          int val = a;
          val--;
         if(a==0){return contries;}else{
          for (int dat = 0; dat <= licensetitlesdatalist.length; dat++) {
            if (dat == val) {
            //  print(licensetitlesdatalist[dat]['title']);
             return licensetitlesdatalist[dat]['title'];
            } //  levelvaluedata= sixear.toString();
        } //  levelvaluedata= levelvalue(6);
        }
        }
        break;
        case 9:
        {
          int val = a;
          val--;
          if(a==0){return contries;}else{
          for (int dat = 0; dat <= licensecodesdatalist.length; dat++) {
            if (dat == val) {
              //print(licensecodesdatalist[dat]['code']);
             return licensecodesdatalist[dat]['code'];
            }
          }
           } //  iions= countriesdatalist[dat]['code'];
        }
        break;
        case 10:
        {
          int val = a;
          val--;
          if(a==0){return contries;}else{
          for (int dat = 0; dat <= licensetypedatalist.length; dat++) {
            if (dat == val) {
              //print(licensecodesdatalist[dat]['code']);
             return licensetypedatalist[dat]['typeName'];
            }
          }
           } //  iions= countriesdatalist[dat]['code'];
        }
        break;
      default:
        {
         return contries; //statements;
        }
        break;
    }
    
  }
