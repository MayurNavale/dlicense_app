
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'homepage.dart';
class AllData extends StatefulWidget {
  @override
  _AllData createState() => _AllData();
}
List asdfg=[];

class _AllData extends State<AllData> {
 

  //List planetList = ["planet", "Venus", "Earth"];
  bool isSearching = false;
  
 List countries = [];
  getCountries(url) async {
    var response = await Dio().get('$url');
    return response.data;
  }

  @override
  void initState() {
        for(int i=0; i<urls.length;i++){
     getCountries(urls[i]).then((data) {
      setState(() {
        apidata =  data;
        assigndata(apidata,i);
      });
    });
    super.initState();
  }
  }
  void _filterCountries(value) {
    setState(() {
      filteredCountries = countries
.where((country) =>
              country['className'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
void assigndata(List dataitem ,int k){
   switch(k) { 
   case 0: { 
    countriesdata = dataitem;
    print('\n');
      print(countriesdata);
      print('\n');
      // statements; 
   } 
   break; 
  
   case 1: { 
     licenseclassdata=dataitem;
    print(licenseclassdata);
    print('\n');
    countries=filteredCountries=licenseclassdata;
      //statements; 
   } 
   break; 
    case 2: { 
    licensecodesdata = dataitem;
      print(licensecodesdata);
      print('\n');
      // statements; 
   } 
   break; 
    case 3: { 
    licensetitlesdata = dataitem;
      print(licensetitlesdata);
      print('\n');
      // statements; 
   } 
   break; 
    case 4: { 
    licensetypedata = dataitem;
      print(licensetypedata);
      print('\n');
      // statements; 
   } 
   break; 
    case 5: { 
    statedata = dataitem;
      print(statedata);
      print('\n');
      // statements; 
   } 
   break; 
   } 
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Country Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllDataa()),
              );
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                         filteredCountries[index]['className'],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}