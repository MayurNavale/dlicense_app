
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'homepage.dart';
import 'licencepage.dart';
class Apidata extends StatefulWidget {
  @override
  _ApidataState createState() => _ApidataState();
}

class _ApidataState extends State<Apidata> {
 

//List asdfg=[];



  //List planetList = ["planet", "Venus", "Earth"];
  bool isSearching = false;
 
 List countries = [];
  getCountries(url) async {
    var response = await Dio().get('$url');
    return response.data;
  }

  @override
  void initState() {
    print(urls.length);
        for(int i=0; i<urls.length;i++){
     getCountries(urls[i]).then((data) {
      setState(() {
        apidata =  data;
        assigndata(apidata,i);
         Future.delayed(const Duration(milliseconds: 60));
      });
    });
    super.initState();
  //  if(statedata.length>3)gonext();
  }
  // Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) =>Licencepage()),
  //             );
   }
//    void gonext(){
//      print(statedata.length);
//        //  Future.delayed(const Duration(milliseconds: 8000));
//     print('acces api');
  
//     Navigator.push(context,MaterialPageRoute(builder: (context) =>Homepage()),);
//  }
//   void _filterCountries(value) {
//     setState(() {
//       filteredCountries = countries
// .where((country) =>
//               country['className'].toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }
void assigndata(List dataitem ,int k){
   switch(k) { 
   case 0: { 
    countriesdata = dataitem;
    print('\n');
    print("countriesdata");
      print(countriesdata);
      print('\n');
      // statements; 
   } 
   break; 
  
   case 1: { 
     licenseclassdata=dataitem;
    print('licenseclassdata');
    print(licenseclassdata);
    print('\n');
    
      //statements; 
   } 
   break; 
    case 2: { 
    licensecodesdata = dataitem;
    print('licensecodesdata');
      print(licensecodesdata);
      print('\n');
      // statements; 
   } 
   break; 
    case 3: { 
    licensetitlesdata = dataitem;
      print('licensetitlesdata');print(licensetitlesdata);
      print('\n');
      // statements; 
   } 
   break; 
    case 4: { 
    licensetypedata = dataitem;
      print('licensetypedata');print(licensetypedata);
      print('\n');
      // statements; 
   } 
   break; 
    case 5: { 
    statedata = dataitem;
      print('statedata');  print(statedata);print(statedata.length);

      // statements; 
   } 
   break; 
   } 
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      body: Container(
        padding: EdgeInsets.all(10),
        child:Center(
        child: Row(
           children: <Widget>[
            RaisedButton(
              child: Text('ipdata', style: TextStyle(fontSize: 20),),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
              },
            ),
                  Text(
                    "initializing",
                    style: TextStyle(
                      fontSize: 40.0,
                      color:Colors.white,
                      fontWeight:FontWeight.w800,
                      fontFamily: "Cursive",
                    ),
                  ),])
        ),  
      ),
    );
  }
}