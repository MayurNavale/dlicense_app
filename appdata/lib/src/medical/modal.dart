import 'dart:convert';
var tpyeOptionDatamed;

    var    contriesmed;
     var  licenceNumber;
      var  limitations;
      var  expirydateofthiscertificate;
      var   examinationdate;
      var   expirydateofpreviousMedicalCertificate;
     var electrocardiogram;
        var audiogram='';
      var  comments;
 var  dtC1;
        var  dtC1Sp;
        var  dtC2;
        var  dtC3;
        var  dtClapl;
var dateOfInitialIssuemed;

Medical welcomeFromJson(String str) => Medical.fromJson(json.decode(str));

String welcomeToJson(Medical data) => json.encode(data.toJson());

class Medical {
    Medical({
        this.comments,
        this.dtAudiogram,
        this.dtEcg,
        this.dtExam,
        this.dtExpPrevcert,
        this.dtExpiryC1,
        this.dtExpiryC1Sp,
        this.dtExpiryC2,
        this.dtExpiryC3,
        this.dtExpiryClapl,
        this.dtIssue,
        this.id,
        this.licenseId,
        this.licenseNumber,
        this.limitationId,
        this.stateId,
    });

    String comments;
    String dtAudiogram;
    String dtEcg;
    String dtExam;
    String dtExpPrevcert;
    String dtExpiryC1;
    String dtExpiryC1Sp;
    String dtExpiryC2;
    String dtExpiryC3;
    String dtExpiryClapl;
    String dtIssue;
    int id;
    int licenseId;
    int licenseNumber;
    int limitationId;
    int stateId;

    factory Medical.fromJson(Map<String, dynamic> json) => Medical(
        comments: json["comments"],
        dtAudiogram: json["dtAudiogram"],
        dtEcg: json["dtEcg"],
        dtExam: json["dtExam"],
        dtExpPrevcert: json["dtExpPrevcert"],
        dtExpiryC1: json["dtExpiryC1"],
        dtExpiryC1Sp: json["dtExpiryC1sp"],
        dtExpiryC2: json["dtExpiryC2"],
        dtExpiryC3: json["dtExpiryC3"],
        dtExpiryClapl: json["dtExpiryClapl"],
        dtIssue: json["dtIssue"],
        id: json["id"],
        licenseId: json["licenseId"],
        licenseNumber: json["licenseNumber"],
        limitationId: json["limitationId"],
        stateId: json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "comments": comments,
        "dtAudiogram": dtAudiogram,
        "dtEcg": dtEcg,
        "dtExam": dtExam,
        "dtExpPrevcert": dtExpPrevcert,
        "dtExpiryC1": dtExpiryC1,
        "dtExpiryC1sp": dtExpiryC1Sp,
        "dtExpiryC2": dtExpiryC2,
        "dtExpiryC3": dtExpiryC3,
        "dtExpiryClapl": dtExpiryClapl,
        "dtIssue": dtIssue,
        "id": id,
        "licenseId": licenseId,
        "licenseNumber": licenseNumber,
        "limitationId": limitationId,
        "stateId": stateId,
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
  {
    "id": 3,
    "type": "CC MEDICAL REPORT"
  }
];