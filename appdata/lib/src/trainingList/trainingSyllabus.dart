import 'package:flutter/material.dart';
class TrainingSyllabus extends StatefulWidget {
  @override
  _TrainingSyllabusState createState() => _TrainingSyllabusState();
}

class _TrainingSyllabusState extends State<TrainingSyllabus> {
      void initState() {
    super.initState();

futuregetlogbookIdvalue=defaultvalue();
}


Future<int> defaultvalue()async{ return 1;}
    int _selectedIndex = 0;
  Future<int >futuregetlogbookIdvalue;
bool _autoValidate = false,readOnlytrue=false;
 final _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  //   return  Center(
  //         child: FutureBuilder<int>(
  //           future: futuregetlogbookIdvalue,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               return   SingleChildScrollView(
  //          child:  Container(
  //           margin:  EdgeInsets.all(15.0),
  //           child:  Form(
  //             key: _formKey,
  //             autovalidate: _autoValidate,
  //             child:formUI(),
  //           ),
  //         ),
  //       );
  //     } else if (snapshot.hasError) { return Text("${snapshot.error}");  }
  //      // By default, show a loading spinner.
  //       return CircularProgressIndicator();
  //       },
  //     ),
  //   );
  // }
  // // List <Widge> widger=[asd,asd];
 
  //  Widget formUI() {
       return  Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.blue[400],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      );
     
  }
}