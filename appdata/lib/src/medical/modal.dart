import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'medicalpage.dart';


Medical MedicalFromJson(String str) => Medical.fromJson(json.decode(str));

String MedicalToJson(Medical data) => json.encode(data.toJson());

class Medical {
    Medical({
        this.comments,
        this.dtAudiogram,
        this.dtEcg,
        this.dtExam,
        this.dtExpPrevcert,
        this.dtExpiryC1,
        this.dtExpiryC1sp,
        this.dtExpiryC2,
        this.dtExpiryC3,
        this.dtExpiryClapl,
        this.dtIssue,
        this.id,
        this.licenseId,
        this.licenseNumber,
        this.limitationId,
        this.medicalType,
        this.stateId,
    });

    String comments;
    String dtAudiogram;
    String dtEcg;
    String dtExam;
    String dtExpPrevcert;
    String dtExpiryC1;
    String dtExpiryC1sp;
    String dtExpiryC2;
    String dtExpiryC3;
    String dtExpiryClapl;
    String dtIssue;
    int id;
    int licenseId;
    int licenseNumber;
    int limitationId;
    String medicalType;
    int stateId;

    factory Medical.fromJson(Map<String, dynamic> json) => Medical(
        comments: json["comments"] == null ? null : json["comments"],
        dtAudiogram: json["dtAudiogram"] == null ? null : json["dtAudiogram"],
        dtEcg: json["dtEcg"] == null ? null : json["dtEcg"],
        dtExam: json["dtExam"] == null ? null : json["dtExam"],
        dtExpPrevcert: json["dtExpPrevcert"] == null ? null : json["dtExpPrevcert"],
        dtExpiryC1: json["dtExpiryC1"] == null ? null : json["dtExpiryC1"],
        dtExpiryC1sp: json["dtExpiryC1sp"] == null ? null : json["dtExpiryC1sp"],
        dtExpiryC2: json["dtExpiryC2"] == null ? null : json["dtExpiryC2"],
        dtExpiryC3: json["dtExpiryC3"] == null ? null : json["dtExpiryC3"],
        dtExpiryClapl: json["dtExpiryClapl"] == null ? null : json["dtExpiryClapl"],
        dtIssue: json["dtIssue"] == null ? null : json["dtIssue"],
        id: json["id"] == null ? null : json["id"],
        licenseId: json["licenseId"] == null ? null : json["licenseId"],
        licenseNumber: json["licenseNumber"] == null ? null : json["licenseNumber"],
        limitationId: json["limitationId"] == null ? null : json["limitationId"],
        medicalType: json["medicalType"] == null ? null : json["medicalType"],
        stateId: json["stateId"] == null ? null : json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "comments": comments == null ? null : comments,
        "dtAudiogram": dtAudiogram == null ? null : dtAudiogram,
        "dtEcg": dtEcg == null ? null : dtEcg,
        "dtExam": dtExam == null ? null : dtExam,
        "dtExpPrevcert": dtExpPrevcert == null ? '' : dtExpPrevcert,
        "dtExpiryC1": dtExpiryC1 == null ? '' : dtExpiryC1,
        "dtExpiryC1sp": dtExpiryC1sp == null ? '' : dtExpiryC1sp,
        "dtExpiryC2": dtExpiryC2 == null ? '' : dtExpiryC2,
        "dtExpiryC3": dtExpiryC3 == null ? '' : dtExpiryC3,
        "dtExpiryClapl": dtExpiryClapl == null ? '' : dtExpiryClapl,
        "dtIssue": dtIssue == null ? null : dtIssue,
        "id": id == null ? null : id,
        "licenseId": licenseId == null ? null : licenseId,
        "licenseNumber": licenseNumber == null ? null : licenseNumber,
        "limitationId": limitationId == null ? null : limitationId,
        "medicalType": medicalType == null ? null : medicalType,
        "stateId": stateId == null ? null : stateId,
    };
}

  


List<Map<String, dynamic>> medicaltpedatalist=[
  {
    "id": 1,
    "type": " CLASS 1/2/LAPL"
  },
  {
    "id": 2,
    "type": " CLASS 3"
  },
  
];
List<Map>limtationHardcoded= [
      {
        "id": 1,
        "limitation": "TML"
      },
      {
        "id": 16,
        "limitation": "OML"
      },
      {
        "id": 10,
        "limitation": "OPL"
      },
      {
        "id": 15,
        "limitation": "RXO"
      },
      {
        "id": 14,
        "limitation": "SIC"
      },
      {
        "id": 4,
        "limitation": "VNL"
      },
      {
        "id": 12,
        "limitation": "OAL"
      },
      {
        "id": 2,
        "limitation": "VDL"
      },
      {
        "id": 9,
        "limitation": "OCL"
      },
      {
        "id": 11,
        "limitation": "SSL"
      },
      {
        "id": 17,
        "limitation": "OSL"
      },
      {
        "id": 8,
        "limitation": "APL"
      },
      {
        "id": 13,
        "limitation": "AHL"
      },
      {
        "id": 3,
        "limitation": "VML"
      },
      {
        "id": 7,
        "limitation": "HAL"
      },
      {
        "id": 5,
        "limitation": "CCL"
      },
      {
        "id": 6,
        "limitation": "VCL"
      }
    ];