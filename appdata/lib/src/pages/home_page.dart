
import 'package:appdata/src/pages/signinPage.dart';
import 'package:appdata/src/providers/db_provider.dart';
import 'package:appdata/src/providers/employee_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:appdata/src/userregisterpage/registeruserpage.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'navdrawar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

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
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.stateapimasterdata();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));
   await apiProvider.airlineapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.countryNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.doctorNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.institutionNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.languageapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.classNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.codeapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.titleapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.typeNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.limitationINTmedicalapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    // await apiProvider.limitationsMedicalapimasterdata();
    // await Future.delayed(const Duration(seconds: 2));
    await apiProvider.ministryNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.niveaulevelapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    await apiProvider.schoolNameapimasterdata();
    await Future.delayed(const Duration(seconds: 2));
    
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
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20.0),
                ),
                title: Text(
                    "Name: ${snapshot.data[index].stateName} ${snapshot.data[index].stateName} "),
                subtitle: Text('EMAIL: ${snapshot.data[index].stateName}'),
              );
            },
          );
        }
      },
    );
  }
}
