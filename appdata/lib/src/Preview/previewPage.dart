import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:nice_button/nice_button.dart';
import 'package:appdata/src/models/masterdata.dart';

class PreviewPageFinal extends StatefulWidget {
  @override
  _PreviewPageFinalState createState() => _PreviewPageFinalState();
}

class _PreviewPageFinalState extends State<PreviewPageFinal> {
Future<int>futureLicenceclass;
 Future<int>futureMedicalclass;
 var filepathLicence,filepathMedica;
 var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
String pathOfPDFLicence = "",pathOfPDFMedical = "";
File urlLicenceFile, urlMedicalFie;
bool visibilityTag=false;
  @override
  void initState() {
  super.initState();
  futureLicenceclass = getlicencddata();
  futureMedicalclass=getMedicadata();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
         // backgroundColor: firstColor,
      appBar: new AppBar(title: new Text('    Preview',style:TextStyle( fontSize: 20,fontStyle: FontStyle.normal)), ),
  
       body: Center(
          child: FutureBuilder<int>(
            future: futureLicenceclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return   Center(
          child: FutureBuilder<int>(
            future: futureMedicalclass,
            builder: (context, snapshot) {
              if (snapshot.hasData) { return   Container(
            margin: new EdgeInsets.all(1.0),
            child:formUI(),); }
         else if (snapshot.hasError) { return Text("${snapshot.error}");  }
        return CircularProgressIndicator();  }, ),);} 
        else if (snapshot.hasError) { return Text("${snapshot.error}");  }
        return CircularProgressIndicator();
        },
      ),
   ),
  ),
 );
 }


 /////////////////
   Widget formUI() {
       return  Column(
      children: <Widget>[
       SizedBox(height:30),

NiceButton(
  width: MediaQuery.of(context).size.width,
    radius: 40,
    padding: const EdgeInsets.all(5),
    text: "Flight Crew Licence",
    icon: Icons.filter,
    background: Colors.blue[100],
    gradientColors: [secondColor, firstColor],
    onPressed: () {
           Navigator.push(  context, MaterialPageRoute(builder: (context) => 
           PDFScreenLicence(pathOfPDFLicence,filepathLicence)),  ); },
    ),
      SizedBox(height:20),
    NiceButton(
      width: MediaQuery.of(context).size.width,
    
    radius: 40,
    padding: const EdgeInsets.all(5),
    text: "Medical",
    icon: Icons.filter,
    background: Colors.blue[100],
    gradientColors: [secondColor, firstColor],
    onPressed: () {
           Navigator.push(  context, MaterialPageRoute(builder: (context) => 
           PDFScreenLicence(pathOfPDFMedical,filepathMedica)),  ); },
    ),
      
         ]
     );
     
   }
  
 

////////////
///get
//////////////////

    Future<int> getMedicadata() async {
    Report reportdata=new Report();
    reportdata.reportType='MEDICAL';
    reportdata.userId=uuid;
   reportdata.languageCode=savelicencdId;
 String json = welcomeToJson(reportdata);
 print( json);
  var url = 'http://$ipAddress:8080/dLicence/api/exportReportDataForType';
    http.post(url, headers: {"Content-Type": "application/json"}, body: json)
    .then((response)async {
   print(response.body);
   var bytes = response.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File fileMedical = File("${dir.path}/medical.pdf");
      urlMedicalFie = await fileMedical.writeAsBytes(bytes);
    print(dir);
    print('urlMedicalFie$urlMedicalFie');
    print('fileMedical$fileMedical');
    assignMedica(urlMedicalFie); 
  // return 1;
  });   return 1;
  }

   Future<int> getlicencddata() async {
    Report reportLicence=new Report();
    reportLicence.reportType='LICENCE';
    reportLicence.userId='a92a3003-68fc-4a3a-8ad5-cadf450dbccf';
   reportLicence.languageCode='481';
 String json = welcomeToJson(reportLicence);
 print( json);
  var url = 'http://$ipAddress:8080/dLicence/api/exportReportDataForType';
    final filename = 'exportReportDataForType.pdf';
    print(filename);
    http.post(url, headers: {"Content-Type": "application/json"}, body: json)
    .then((response)async {
   print(response.body);
   var bytes = response.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/licence.pdf");
      urlLicenceFile = await file.writeAsBytes(bytes);
    print(dir);
    print(urlLicenceFile);
    print(file);
    assignLicence(urlLicenceFile);
    // return 1; 
   });
 
    return 1;
  

  
    }
void assignLicence(File recive){
  filepathLicence=recive;
    pathOfPDFLicence=recive.path;
}

void assignMedica(File recive){
  filepathMedica=recive;
    pathOfPDFMedical=recive.path;
}
      
///////////////////////////
//end
//////////////////
}



class PDFScreenLicence extends StatelessWidget {
  String pathPDF ;
 var pathPDFForShare;
  PDFScreenLicence(this.pathPDF,this.pathPDFForShare);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Licence"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                 _shareStorageFile(pathPDFForShare);
              },
            ),
          ],
        ),
        path: pathPDF);
  }
  
}


_shareStorageFile(var filepathtosend) async {
 
    if (!await filepathtosend.exists()) {
      await filepathtosend.create(recursive: true);
      filepathtosend.writeAsStringSync("test for share documents file");
    }
    ShareExtend.share(filepathtosend.path, "file");
  }




Report welcomeFromJson(String str) => Report.fromJson(json.decode(str));

String welcomeToJson(Report data) => json.encode(data.toJson());

class Report {
    Report({
        this.languageCode,
        this.reportType,
        this.userId,
    });

    String languageCode;
    String reportType;
    String userId;

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        languageCode: json["languageCode"] == null ? null : json["languageCode"],
        reportType: json["reportType"] == null ? null : json["reportType"],
        userId: json["userId"] == null ? null : json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "languageCode": languageCode == null ? null : languageCode,
        "reportType": reportType == null ? null : reportType,
        "userId": userId == null ? null : userId,
    };
}





