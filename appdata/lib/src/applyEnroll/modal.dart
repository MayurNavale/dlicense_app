
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appdata/src/models/masterdata.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

ApplyEnrollClass applyEnrollClassFromJson(String str) => ApplyEnrollClass.fromJson(json.decode(str));

String applyEnrollClassToJson(ApplyEnrollClass data) => json.encode(data.toJson());

class ApplyEnrollClass {
    ApplyEnrollClass({
        this.airlineId=0,
        this.airlineName='',
        this.applicationDate,
        this.doctorId=0,
        this.doctorName='',
        this.id=0,
        this.institutionId=0,
        this.institutionName='',
        this.ministryId=0,
        this.ministryName='',
        this.schoolId=0,
        this.schoolName='',
        this.statusType='',
        this.userId,
    });

    int airlineId;
    String airlineName;
    String applicationDate;
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
        applicationDate: json["applicationDate"],
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
        "applicationDate": applicationDate,//.toIso8601String(),
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

    Future<int> getlogbookList() async {
       final response =await http.get("http://$ipAddress:8080/dLicence/api/logbookEntry/v1/$uuid",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
       List<dynamic>  logbookList=jsonDecode(response.body);
      print(logbookList);
         return 1;
       } 
     else if  (response.statusCode == 500){  return 1;}
     else{throw Exception('check network connecion');
     }
    }

// Future< Map> sendRequest( String data,String appliedfor)  {
//    print(data);
//  var url = 'http://$ipAddress:8080/dLicence/api/application/v1/$appliedfor/$uuid';
//     http.post(url, headers: {"Content-Type": "application/json","Authorization":"$token"}, body: data)
//         .then((response) {
//       print("Response status: ${response.statusCode}");
//       int code=response.statusCode;
//       if(code==200||code==201){
//         sucessval=1;
//         print('code$code');
//         print(response.body);
//         Map decode=jsonDecode(response.body);
//       return decode;
//       }
//     });  
// }

// int sucessval=2;