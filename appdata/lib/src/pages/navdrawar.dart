import 'package:appdata/src/Preview/previewPage.dart';
import 'package:appdata/src/logbook/logbookpage.dart';
import 'package:appdata/src/logbookModule/model.dart';
import 'package:appdata/src/applyEnroll/applyEnroll.dart';
import 'package:appdata/src/loogbooktable/loogbooktabelpage.dart';
import 'package:appdata/src/radiotelephone/radioTelephonePage.dart';
import 'package:flutter/material.dart';
import 'package:appdata/src/medical/medicalpage.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'package:appdata/src/language/languagepage.dart';

class NavDrawer extends StatelessWidget {
  var sizebox=SizedBox(width: 40, height:2,child:Container(color: Colors.grey[400],));
  var textStyle = TextStyle( color: Colors.black, fontSize: 23);
  List <dynamic>location=[ Licencepagehome(), LanguagePage(),MedicalPage(),RadiotelephonePage(),LogBookPage(),PreviewPageFinal(),RowPage(null),LogbookTable(),CustomDataTable()];
  List <String> listitems=['Licence','Language','Medical','Radiotelephone','Logbook','Preview','Logbook Entry','Loogbook Table','Apply & Enroll'];
  List<IconData> icon=[Icons.contact_phone,Icons.language,Icons.plus_one,Icons.ring_volume,Icons.book,Icons.image,Icons.library_books,Icons.table_chart,Icons.table_chart];
  @override
  Widget build(BuildContext context) {
    return Drawer(
       elevation:10,
        child:Card(
          margin: EdgeInsets.all(0),
              elevation: 10,//color:Color.alphaBlend (Colors.deepPurple[400] ,Colors.deepPurple),
              child:Container( decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 25,178,238),
                    Color.fromARGB(255, 21,236,229),
                    // Colors.blue[300]
                  ],
                )
              ),child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
      //           DrawerHeader(
      //             curve: Curves.easeOutQuart,
      //             padding: EdgeInsets.fromLTRB(3, 3, 3, 3) ,
      //           margin:  EdgeInsets.only(bottom: 3.0),    // padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      //   child: Text('DLICENCE'),
      //   decoration: BoxDecoration(
      //     color: Colors.blue,
      //   ),
      // ),
                  SizedBox(height:20,width: 10),
                 Container(
                   height: 90, 
                   color: Color.fromARGB(255, 25,178,238), 
                   child: Center(
                     child: Text("  DLICENCE ", 
                      style: TextStyle( color: Colors.black, 
                      fontSize: 37), ),
                    ),
                 ),
                  SizedBox(height:6,width: 10),
              Container(
         
                  height: ( MediaQuery.of(context).size.height-130),
                  child:  ListView.builder(
                  itemCount: listitems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                  return Column( children: <Widget>[ListTile(
                    // shape: DecoratedBox( radius: 0.15,),
                      leading:Icon(icon[index],color: Colors.black,),
                      title: Text(listitems[index], style:textStyle),
                      onTap:() { Navigator.push(context, MaterialPageRoute(builder: (context) => location[index]), );} , ),
                      SizedBox(width: MediaQuery.of(context).size.width, height:2,child:Container(color: Colors.grey[400],))
                    
                     ] 
                  );
                }
              )
            ) ,
                
          ],
        ),
      ),
    ),
    );
  }
}






 