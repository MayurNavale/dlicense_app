
import 'package:appdata/src/providers/db_provider.dart';
import 'package:appdata/src/providers/employee_api_provider.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:appdata/src/models/masterdata.dart';
import 'navdrawar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  @override
  void initState() {
   
    super.initState();
   
  
  checkapi();
  }

 checkapi()async{
    await Future.delayed(const Duration(seconds: 2));
 if(hasdata==0){_loadFromApi();
//  if(isLoading=false)
//  {
//  DBProvider.db.getAlldata();
//  }
// Here you can write your code
 }
 
 }
   
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api to sqlite'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(right: 10.0),
          //   child: IconButton(
          //     icon: Icon(Icons.settings_input_antenna),
          //      onPressed: () { Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => RegisterUser()),
          //     );},
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      drawer: NavDrawer(),
body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          //Container(),
           :_buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.stateapimasterdata();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(milliseconds: 600));
   await apiProvider.airlineapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.countryNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.doctorNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.institutionNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.languageapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.classNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.codeapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.titleapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.typeNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.limitationINTmedicalapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    // await apiProvider.limitationsMedicalapimasterdata();
    // await Future.delayed(const Duration(seconds: 2));
    await apiProvider.ministryNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.niveaulevelapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.schoolNameapimasterdata();
    await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.examinerapimasterdata(); await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.endorsementapimasterdata(); await Future.delayed(const Duration(milliseconds: 600));
    await apiProvider.instructorapimasterdata();  await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAlldata(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: <Widget>[Center(child:Text('Welcome to digital World'))],
                             );
            
        }
      },
    );
  }

}
