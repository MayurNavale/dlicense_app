

import 'dart:convert';
import 'dart:ffi';

import 'package:appdata/src/providers/db_provider.dart';
import 'package:dio/dio.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeApiProvider {
  //   getCountries(url) async {
  //   final response = await http.get('$url');
  //   return response;
  // }
 
  Future<List<Stateclass>> stateapimasterdata() async {
       final response =await http.get("http://$ipAddress:8080/dLicence/api/states/v1",headers: {"Authorization":"$token"});
       print(response.body);
       if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((body) {
      print('Inserting $body');
      DBProvider.db.createstatedb(Stateclass.fromJson(body));
    }).toList();}}
  Future<List<Airline>> airlineapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/airline/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.airlinestatedb(Airline.fromJson(data));
    }).toList();}}
    Future<List<Country>> countryNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/countries/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.countryNamedb(Country.fromJson(data));
    }).toList();}}
  Future<List<Doctor>> doctorNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/doctor/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.doctorNamedb(Doctor.fromJson(data));
    }).toList();}}
   Future<List<Institution>> institutionNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/institution/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.institutionNamedb(Institution.fromJson(data));
    }).toList();}}
   Future<List<Language>> languageapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/languages/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.languagedb(Language.fromJson(data));
    }).toList();}}
     Future<List<Class>> classNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/licenseclass/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.classNamedb(Class.fromJson(data));
    }).toList();}} Future<List<Code>> codeapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/licensecodes/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.codedb(Code.fromJson(data));
    }).toList();}} Future<List<Titleclass>> titleapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/licensetitles/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.titledb(Titleclass.fromJson(data));
    }).toList();}} Future<List<Type>> typeNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/licensetype/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.typeNamedb(Type.fromJson(data));
    }).toList();}} 


    Future<List<Limitation>> limitationINTmedicalapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/limitation/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.limitationdb(Limitation.fromJson(data));
    }).toList();}} 

    

  Future<List<Ministry>>ministryNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/ministry/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.ministryNamedb(Ministry.fromJson(data));
    }).toList();}}
    
     Future<List<Niveaulevel>> niveaulevelapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/niveaulevel/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.niveauleveldb(Niveaulevel.fromJson(data));
    }).toList();}} Future<List<School>> schoolNameapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/school/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.schoolNamedb(School.fromJson(data));
    }).toList();}}
Future<List<Examiner>> examinerapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/examinerTypes/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.examinerTypesdb(Examiner.fromJson(data));
    }).toList(); }}
    Future<List<Endorsement>> endorsementapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/endorsementTypes/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.endorsementTypesdb(Endorsement.fromJson(data));
    }).toList(); }}
Future<List<Instructor>> instructorapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/instructorTypes/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.instructorTypessdb(Instructor.fromJson(data));
    }).toList(); }}
Future<List<Place>> placeapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/places/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.placedb(Place.fromJson(data));
    }).toList(); }}
    Future<List<Makemodel>> makemodelapimasterdata() async {
    final response =await http.get("http://$ipAddress:8080/dLicence/api/makemodel/v1",headers: {"Authorization":"$token"});
     if(response.statusCode==200){
         List<dynamic>body=jsonDecode(response.body);
       body.map((data) {
      print('Inserting $data');
      DBProvider.db.makemodeldb(Makemodel.fromJson(data));
    }).toList(); }}
    
}
