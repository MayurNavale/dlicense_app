

import 'package:appdata/src/providers/db_provider.dart';
import 'package:dio/dio.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';

class EmployeeApiProvider {
  //   getCountries(url) async {
  //   Response response = await Dio().get('$url');
  //   return response;
  // }
 
  Future<List<Stateclass>> stateapimasterdata() async {
    Response response = await Dio().get("http://192.168.43.246:8080/dLicence/api/states/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.createstatedb(Stateclass.fromJson(data));
    }).toList();
  }
  Future<List<Airline>> airlineapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/airline/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.airlinestatedb(Airline.fromJson(data));
    }).toList();
  }
    Future<List<Country>> countryNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/countries/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.countryNamedb(Country.fromJson(data));
    }).toList();
  }
  Future<List<Doctor>> doctorNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/doctor/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.doctorNamedb(Doctor.fromJson(data));
    }).toList();
  }
   Future<List<Institution>> institutionNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/institution/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.institutionNamedb(Institution.fromJson(data));
    }).toList();
  }
   Future<List<Language>> languageapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/languages/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.languagedb(Language.fromJson(data));
    }).toList();
  } Future<List<Class>> classNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/licenseclass/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.classNamedb(Class.fromJson(data));
    }).toList();
  } Future<List<Code>> codeapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/licensecodes/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.codedb(Code.fromJson(data));
    }).toList();
  } Future<List<Titleclass>> titleapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/licensetitles/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.titledb(Titleclass.fromJson(data));
    }).toList();
  } Future<List<Type>> typeNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/licensetype/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.typeNamedb(Type.fromJson(data));
    }).toList();
  } Future<List<Limitation>> limitationINTmedicalapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/limitation/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.limitationdb(Limitation.fromJson(data));
    }).toList();
  } 
  // Future<List<Medicaltype>> limitationsMedicalapimasterdata() async {
  //   Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/airline/v1");
  //   return (response.data as List).map((data) {
  //     print('Inserting $data');
  //     DBProvider.db.limitationsMedicaldb(Medicaltype.fromJson(data));
  //   }).toList();
  // } 
  Future<List<Ministry>>ministryNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/ministry/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.ministryNamedb(Ministry.fromJson(data));
    }).toList();
  } Future<List<Niveaulevel>> niveaulevelapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/niveaulevel/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.niveauleveldb(Niveaulevel.fromJson(data));
    }).toList();
  } Future<List<School>> schoolNameapimasterdata() async {
    Response response =await Dio().get("http://192.168.43.246:8080/dLicence/api/school/v1");
    return (response.data as List).map((data) {
      print('Inserting $data');
      DBProvider.db.schoolNamedb(School.fromJson(data));
    }).toList();
  }
}
