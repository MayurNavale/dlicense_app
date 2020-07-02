import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'model.dart';

class DatabaseHelper {
 
  Map<String, dynamic> rowclass;
  static final _databasec = "MyData.db";
  static final _databaseVersion = 1;

  
  static final countriesdatatable = 'countriesdata';
  static final licenseclassdatatable = 'licenseclassdata';
  static final licensecodesdatatable = 'licensecodesdata';
  static final licensetitlesdatatable='licensetitlesdata';
  static final licensetypedatatable='licensetypedata';
  static final statedatatable='statedata';



  static final countryid = 'id';
  static final countryCode = 'countryCode';
    static final countryName = 'countryName';
  static final countryPhone = 'countryPhone';

  
  static final classNameid = 'id';
  static final className = 'className';

   static final codeid = 'id';
  static final code = 'code';
 
 
   static final titleid = 'id';
  static final title = 'title';

static final typeNameid = 'id';
  static final typeName = 'typeName';

   static final statecountryid = 'id';
  static final stateName = 'stateName';
  static final countryId = 'countryId';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  
  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databasec);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    
    await db.execute('''
          CREATE TABLE $countriesdatatable (
            $countryid INTEGER PRIMARY KEY,
            $countryCode TEXT NOT NULL,
            $countryName TEXT NOT NULL,
            $countryPhone INTEGER NOT NULL
          )
          ''');
    await db.execute(''' CREATE TABLE $licenseclassdatatable (
            $classNameid INTEGER PRIMARY KEY,
            $className TEXT NOT NULL
          ) ''');
    await db.execute(''' CREATE TABLE $licensecodesdatatable (
            $codeid INTEGER PRIMARY KEY,
            $code TEXT NOT NULL
          ) ''');
     await db.execute(''' CREATE TABLE $licensetitlesdatatable (
            $titleid INTEGER PRIMARY KEY,
            $title TEXT NOT NULL
          ) ''');
     await db.execute(''' CREATE TABLE $licensetypedatatable (
            $typeNameid INTEGER PRIMARY KEY,
            $typeName TEXT NOT NULL
          ) ''');
     await db.execute('''
          CREATE TABLE $statedatatable (
            $statecountryid INTEGER PRIMARY KEY,
            $stateName TEXT NOT NULL,
            $countryId TEXT NOT NULL
          )
          ''');
           
  }

         
  // Helper methods

 

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertcountriesdatatable(  Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(countriesdatatable, row);
  }
 Future<int> insertlicenseclassdatatable(  Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(licenseclassdatatable, rowclass);
  }
   Future<int> insertlicensecodesdatatable(  Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(licensecodesdatatable, rowclass);
  }
  Future<int> insertlicensetitlesdatatable( Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(licensetitlesdatatable, rowclass);
  }
   Future<int> insertlicensetypedatatable(  Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(licensetypedatatable, rowclass);
  }
   Future<int> insertstatedatatable( Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(statedatatable, rowclass);
  }
  // All of the rows are returned as a list of maps, where each map is 
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> querycountriesdatatable() async {
    Database db = await instance.database;
    return await db.query(countriesdatatable);
  }

    Future<List<Map<String, dynamic>>> querylicenseclassdatatable() async {
    Database db = await instance.database;
    return await db.query(licenseclassdatatable);
  }
   Future<List<Map<String, dynamic>>> querylicensecodesdatatable() async {
    Database db = await instance.database;
    return await db.query(licensecodesdatatable);
  }
   Future<List<Map<String, dynamic>>> querylicensetitlesdatatable() async {
    Database db = await instance.database;
    return await db.query(licensetitlesdatatable);
  }
   Future<List<Map<String, dynamic>>> querylicensetypedatatable() async {
    Database db = await instance.database;
    return await db.query(licensetypedatatable);
  }
   Future<List<Map<String, dynamic>>> querystatedatatable() async {
    Database db = await instance.database;
    return await db.query(statedatatable);
  }
  //  Future<int> insertclassb(Map<String, dynamic> rowclassdata) async {
  //   Database db = await instance.database;
  //   return await db.insert(tableclassb, rowclassdata);
  // }
  // // All of the rows are returned as a list of maps, where each map is 
  // // a key-value list of columns.
  // Future<List<Map<String, dynamic>>> queryAllRowsclassb() async {
  //   Database db = await instance.database;
  //   return await db.query(tableclassb);
  // }


  // All of the methods (insert, query, update, delete) can also be done using
  // // raw SQL commands. This method uses a raw query to give the row count.
  // Future<int> queryRowCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $countriesdatatable'));
  // }

  // We are assuming here that the id column in the map is set. The other 
  // column values will be used to update the row.
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Deletes the row specified by the id. The number of affected rows is 
  // returned. This should be 1 as long as the row exists.
  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }
}