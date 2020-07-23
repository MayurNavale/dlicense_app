import 'package:appdata/src/logbook/logbookpage.dart';

import 'package:appdata/src/userregisterpage/model.dart';
import 'package:flutter/material.dart';
import 'package:appdata/src/medical/medicalpage.dart';
import 'package:appdata/src/pages/signinPage.dart';


import 'package:appdata/src/userregisterpage/registeruserpage.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'package:appdata/src/language/languagepage.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/images/cover.jpg'))),
          ),
          ),
          ListTile(
        title: Text("login"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );},
      ),
      ListTile(
        title: Text("register user"),
        trailing: Icon(Icons.arrow_forward),
        onTap:() { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterUser(),
        ));} ,
      ),
      ListTile(
        title: Text(" Licence "),
        trailing: Icon(Icons.arrow_forward),
        onTap:() { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Licencepagehome()),
              );} ,
      ),
      // ListTile(
        // //    leading: Icon(Icons.input),
        //     title: Text('Welcome'),
        //     onTap: () => {},
        //   ),
          ListTile(
             trailing: Icon(Icons.arrow_forward),
         //   leading: Icon(Icons.verified_user),
            title: Text('Language'),
            onTap: () => { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Licencepage())),
              },
            
          ),
           ListTile(
              trailing: Icon(Icons.arrow_forward),
         //   leading: Icon(Icons.verified_user),
            title: Text('Medical'),
            onTap: () => { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicalPage()),
              )},
            
          ),
           ListTile(
         //   leading: Icon(Icons.verified_user),
            title: Text('Logbook'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogBookPage()),
              )},
            
          ),
          
//           ListTile(
//          //   leading: Icon(Icons.settings),
//             title: Text('Medical'),
//             onTap: () => { Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Licencepaget()),
//               )},
//           ),
//           ListTile(
//          //   leading: Icon(Icons.border_color),
//             title: Text('Feedback'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Text('Logout'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
        ],
      ),
    );
  }
}






 