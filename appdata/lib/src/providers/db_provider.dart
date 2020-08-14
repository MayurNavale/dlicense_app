import 'dart:io';
//import 'package:dlicense_codemagic/src/models/employee_model.dart';
import 'package:path/path.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();
    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'dlicence_Databse_create.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Statedatatable('
          'id INTEGER PRIMARY KEY,'
          'countryId INTEGER NOT NULL,'
          'stateName TEXT'
          ')');
       await db.execute('CREATE TABLE Airlinedatatable('
          'id INTEGER PRIMARY KEY,'
          'airlineName TEXT'
          ')');
            await db.execute('CREATE TABLE Country('
          'countryCode TEXT,'
          'countryName TEXT,'
          'countryPhone INTEGER NOT NULL,'
          'id INTEGER PRIMARY KEY'
          ')');
            await db.execute('CREATE TABLE Doctor('
          'id INTEGER PRIMARY KEY,'
          'doctorName TEXT'
          ')');
          await db.execute('CREATE TABLE Institution('
          'id INTEGER PRIMARY KEY,'
          'institutionName TEXT'
          ')');
            await db.execute('CREATE TABLE Language('
          'id INTEGER PRIMARY KEY,'
          'language TEXT'
          ')');
            await db.execute('CREATE TABLE Class('
          'id INTEGER PRIMARY KEY,'
          'className TEXT'
          ')');
            await db.execute('CREATE TABLE Code('
          'id INTEGER PRIMARY KEY,'
          'code TEXT'
          ')');
            await db.execute('CREATE TABLE Titleclass('
          'id INTEGER PRIMARY KEY,'
          'title TEXT'
          ')');
            await db.execute('CREATE TABLE Type('
          'id INTEGER PRIMARY KEY,'
          'typeName TEXT'
          ')');
            await db.execute('CREATE TABLE Limitation('
          'id INTEGER PRIMARY KEY,'
          'limitation TEXT,'
          'medicalTypeId INTEGER NOT NULL'
          ')');
            await db.execute('CREATE TABLE Ministry('
          'id INTEGER PRIMARY KEY,'
          'ministryName TEXT'
          ')');
          await db.execute('CREATE TABLE Niveaulevel('
          'id INTEGER PRIMARY KEY,'
          'level TEXT'
          ')');
            await db.execute('CREATE TABLE School('
          'id INTEGER PRIMARY KEY,'
          'schoolName TEXT'
          ')');
           await db.execute('CREATE TABLE Examiner('
          'id INTEGER PRIMARY KEY,'
          'examinerType TEXT'
          ')');
          await db.execute('CREATE TABLE Endorsement('
          'id INTEGER PRIMARY KEY,'
          'endorsementType TEXT'
          ')');
          await db.execute('CREATE TABLE Instructor('
          'id INTEGER PRIMARY KEY,'
          'instructorType TEXT'
          ')');
          await db.execute('CREATE TABLE Place('
          'id INTEGER PRIMARY KEY,'
          'placeName TEXT,'
          'placeCode TEXT'
          ')');
          await db.execute('CREATE TABLE Makemodel('
          'id INTEGER PRIMARY KEY,'
          'makeModelCode TEXT,'
          'makeModelName TEXT'
          ')');

    });
  }
int countryId;
    int id;
    String stateName;
  // Insert employee on database
  createstatedb(Stateclass apiData) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db.insert('Statedatatable', apiData.toJson());
return res;
  }
   airlinestatedb(Airline apiData) async {
     final db = await database;
    final res = await db.insert('Airlinedatatable', apiData.toJson());
    return res;}
      countryNamedb(Country apiData) async {
     final db = await database;
    final res = await db.insert('Country', apiData.toJson());
    return res;}
       doctorNamedb(Doctor apiData) async {
     final db = await database;
    final res = await db.insert('Doctor', apiData.toJson());
    return res;} 
      institutionNamedb(Institution apiData) async {
     final db = await database;
    final res = await db.insert('Institution', apiData.toJson());
    return res;}
       languagedb(Language apiData) async {
     final db = await database;
    final res = await db.insert('Language', apiData.toJson());
    return res;}
       classNamedb(Class apiData) async {
     final db = await database;
    final res = await db.insert('Class', apiData.toJson());
    return res;}
       codedb(Code apiData) async {
     final db = await database;
    final res = await db.insert('Code', apiData.toJson());
    return res;}
       titledb(Titleclass apiData) async {
     final db = await database;
    final res = await db.insert('Titleclass', apiData.toJson());
    return res;}
       typeNamedb(Type apiData) async {
     final db = await database;
    final res = await db.insert('Type', apiData.toJson());
    return res;}
       limitationdb(Limitation apiData) async {
     final db = await database;
    final res = await db.insert('Limitation', apiData.toJson());
    return res;}
    //    limitationsMedicaldb(Medicaltype apiData) async {
    //  final db = await database;
    // final res = await db.insert('Medicaltype', apiData.toJson());
    // return res;}
 ministryNamedb(Ministry apiData) async {
     final db = await database;
    final res = await db.insert('Ministry', apiData.toJson());
    return res;}
    
 niveauleveldb(Niveaulevel apiData) async {
     final db = await database;
    final res = await db.insert('Niveaulevel', apiData.toJson());
    return res;}
schoolNamedb(School apiData) async {
     final db = await database;
    final res = await db.insert('School', apiData.toJson());
    return res;}
 examinerTypesdb(Examiner apiData) async {
     final db = await database;
     final res = await db.insert('Examiner', apiData.toJson());
    return res;}
endorsementTypesdb(Endorsement newdata) async {
     final db = await database;
     final res = await db.insert('Endorsement', newdata.toJson());
     return res;}
instructorTypessdb(Instructor apiData) async {
     final db = await database;
     final res = await db.insert('Instructor', apiData.toJson());
    return res;}
placedb(Place apiData) async {
     final db = await database;
     final res = await db.insert('Place', apiData.toJson());
    return res;}
makemodeldb(Makemodel apiData) async {
     final db = await database;
     final res = await db.insert('Makemodel', apiData.toJson());
    return res;}



  // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final resa = await db.rawDelete('DELETE FROM Statedatatable');
    final resaa = await db.rawDelete('DELETE FROM Airlinedatatable');
   final resas = await db.rawDelete('DELETE FROM Country');
   final resaf = await db.rawDelete('DELETE FROM Doctor');
   final resaq = await db.rawDelete('DELETE FROM Institution');
   final resar = await db.rawDelete('DELETE FROM Language');
   final resaw = await db.rawDelete('DELETE FROM Class');
   final resay = await db.rawDelete('DELETE FROM Code');
   final resaay= await db.rawDelete('DELETE FROM Titleclass');
   final resap = await db.rawDelete('DELETE FROM Type');
   final resai = await db.rawDelete('DELETE FROM Limitation');
   final resau = await db.rawDelete('DELETE FROM Ministry');
    await db.rawDelete('DELETE FROM Niveaulevel');
  await db.rawDelete('DELETE FROM Examiner');
   await db.rawDelete('DELETE FROM Endorsement');
       await db.rawDelete('DELETE FROM Instructor');
      await db.rawDelete('DELETE FROM Instructor');
      await db.rawDelete('DELETE FROM Instructor');
       await db.rawDelete('DELETE FROM Place');
       await db.rawDelete('DELETE FROM Makemodel');
    final res = await db.rawDelete('DELETE FROM School');
   
    return res;
  }
 

  Future<List<Stateclass>> getAlldata() async {
    final db = await database;
  airlinedatalist = await db.rawQuery("SELECT * FROM AIRLINEDATATABLE");
 // print(airlinedatalist);
  if(airlinedatalist.length>0){hasdata=1;}else{hasdata=0;}
  countriesdatalist = await db.rawQuery("SELECT * FROM COUNTRY");
  //print(countriesdatalist);  
  doctordatalist = await db.rawQuery("SELECT * FROM DOCTOR");
  //print(doctordatalist);
  institutiondatalist = await db.rawQuery("SELECT * FROM INSTITUTION");
  //print(institutiondatalist);
  languagedatalist = await db.rawQuery("SELECT * FROM LANGUAGE");
  //print(languagedatalist);
  licenseclassdatalist = await db.rawQuery("SELECT * FROM CLASS");
 // print(licenseclassdatalist);
  licensecodesdatalist = await db.rawQuery("SELECT * FROM CODE");
 // print(licensecodesdatalist);
  licensetypedatalist = await db.rawQuery("SELECT * FROM TYPE");
 // print(licensetypedatalist);
  licensetitlesdatalist = await db.rawQuery("SELECT * FROM TITLECLASS");
 // print(licensetitlesdatalist);
  limitationdatalist = await db.rawQuery("SELECT * FROM LIMITATION");
 // print(limitationdatalist);
  ministrydatalist = await db.rawQuery("SELECT * FROM MINISTRY");
 // print(ministrydatalist);
  niveauleveldatalist = await db.rawQuery("SELECT * FROM NIVEAULEVEL");
 // print(niveauleveldatalist);
  schooldatalist = await db.rawQuery("SELECT * FROM SCHOOL");
 // print(schooldatalist);
  examinerdatalist = await db.rawQuery("SELECT * FROM EXAMINER");
 // print(examinerdatalist);
  endorsementdatalist = await db.rawQuery("SELECT * FROM ENDORSEMENT");
 // print(endorsementdatalist);
  instructordatalist = await db.rawQuery("SELECT * FROM INSTRUCTOR"); 
  placesdatalist = await db.rawQuery("SELECT * FROM PLACE");
    makemodeldatalist = await db.rawQuery("SELECT * FROM MAKEMODEL");
  statedatalist = await db.rawQuery("SELECT * FROM STATEDATATABLE");print(statedatalist);
 
 print(hasdata);
    List<Stateclass> list =
        statedatalist.isNotEmpty ? statedatalist.map((c) => Stateclass.fromJson(c)).toList() : [];
    return list;
  
  
  }
}
