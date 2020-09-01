// To parse this JSON data, do
//
//     final ApplyEnrollClass = ApplyEnrollClassFromJson(jsonString);

import 'dart:convert';

ApplyEnrollClass applyEnrollClassFromJson(String str) => ApplyEnrollClass.fromJson(json.decode(str));

String applyEnrollClassToJson(ApplyEnrollClass data) => json.encode(data.toJson());

class ApplyEnrollClass {
    ApplyEnrollClass({
        this.airlineId,
        this.airlineName,
        this.applicationDate,
        this.doctorId,
        this.doctorName,
        this.id,
        this.institutionId,
        this.institutionName,
        this.ministryId,
        this.ministryName,
        this.schoolId,
        this.schoolName,
        this.statusType,
        this.userId,
    });

    int airlineId;
    String airlineName;
    DateTime applicationDate;
    int doctorId;
    String doctorName;
    int id;
    int institutionId;
    String institutionName;
    int ministryId;
    String ministryName;
    int schoolId;
    String schoolName;
    String statusType;
    String userId;

    factory ApplyEnrollClass.fromJson(Map<String, dynamic> json) => ApplyEnrollClass(
        airlineId: json["airlineId"],
        airlineName: json["airlineName"],
        applicationDate: DateTime.parse(json["applicationDate"]),
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        id: json["id"],
        institutionId: json["institutionId"],
        institutionName: json["institutionName"],
        ministryId: json["ministryId"],
        ministryName: json["ministryName"],
        schoolId: json["schoolId"],
        schoolName: json["schoolName"],
        statusType: json["statusType"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "airlineId": airlineId,
        "airlineName": airlineName,
        "applicationDate": applicationDate.toIso8601String(),
        "doctorId": doctorId,
        "doctorName": doctorName,
        "id": id,
        "institutionId": institutionId,
        "institutionName": institutionName,
        "ministryId": ministryId,
        "ministryName": ministryName,
        "schoolId": schoolId,
        "schoolName": schoolName,
        "statusType": statusType,
        "userId": userId,
    };
}
