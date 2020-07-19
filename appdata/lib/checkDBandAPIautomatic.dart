// import 'package:appdata/apidata.dart';
// import 'package:flutter/material.dart';
// //import 'homepage.dart';
// import 'licencepage.dart';
// import 'splashscreen.dart';
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
// int dbavalible=3;
//  void msdela(int msdel){
//   int o,p;
//   for(o=0;o<msdel;o++)
//   for (p=0;p<1000;p++){}
// }
// class _SplashScreenState extends State<SplashScreen> {
//  final dbHelper = DatabaseHelper.instance;
//   @override
//   void initState() {
//     super.initState();
//      Future.delayed(const Duration(milliseconds: 9000));
//     _querylicensecodesdatatableavalible();
//   }
  
//  void _querylicensecodesdatatableavalible() async {
//     // final allRowsclassb = await dbHelper.querylicensecodesdatatable();
//     //   print(allRowsclassb.length);
//   if(dbavalible>0){
//   print(dbavalible);
//   msdela(3000);
// Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) =>Apidata()),
//               );
 
// // classdatamap(allRowsclassb);
//   }

//   // else{
//   //   Navigator.push(
//   //               context,
//   //               MaterialPageRoute(builder: (context) =>Apidata ()),
//   //             );
//   // }

//  }
  
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xffffff),
//         body:Container(
//           child:Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
              
//                    Text(
//                     "Initializing",
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       color:Colors.white,
//                       fontWeight:FontWeight.w800,
//                       fontFamily: "Cursive",
//                     ),
//                   ),
              
//             ],
//           ),
//         ));
//   }
// }
