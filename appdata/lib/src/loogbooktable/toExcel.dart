import 'dart:async';
import 'modal.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:open_file/open_file.dart';
class ToExcelPage  {
List<String>excelFileHeaderField=[];
// List<String>tableHeader=[];
var excel = Excel.createExcel();

void save()async{
  
      var dir = await getApplicationDocumentsDirectory();
      //  File file = File("${dir.path}/excel.xlsx");
      print(dir.path);
  excel.encode().then((onValue) {
        File(join("${dir.path}/excel.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
} 
void createfile(){
   
      Sheet sheetObject=excel[ 'Data_Table'];
      excel.delete('Sheet1');
      CellStyle cellStyle = CellStyle(backgroundColorHex: "#1AFF1A", fontFamily : getFontFamily(FontFamily.Calibri));
      cellStyle.underline = Underline.Single; // or Underline.Double
      var cell = sheetObject.cell(CellIndex.indexByString("A1"));
      cell.value = 40; // dynamic values support provided;
      cell.cellStyle = cellStyle;
      // printing cell-type
      deleteActoinName();
      sheetObject.insertRowIterables(excelFileHeaderField, 0);
      print("CellType: "+ sheetObject.row.toString());
      for (int rows = 0; rows < exceldata.length; rows++) {  
        print('rows  :  $rows  exceldata ${exceldata.length}');
      for (int row = 1; row < cellContaintnameToBeInsert.length; row++)     
      dataList.add( exceldata[rows][cellContaintnameToBeInsert[row]]==null|| exceldata[rows][cellContaintnameToBeInsert[row]]==""?"NA": exceldata[rows][cellContaintnameToBeInsert[row]].toString());
      sheetObject.insertRowIterables(dataList, rows+1);
      dataList.clear();
     }
        // Future.delayed(const Duration(milliseconds: 600));
      save();
    
}
List<dynamic> dataList=[];
void deleteActoinName(){
  print(tableHeader.length);
  excelFileHeaderField=tableHeader;
 if(tableHeader.length==26)
 excelFileHeaderField.removeAt(0);
}
  Future<void> openFile() async {
    var  dir = await getApplicationDocumentsDirectory();
    final filePath = "${dir.path}/excel.xlsx";
    final result = await OpenFile.open(filePath);


  }
var _openResult;
}


List<Map>exceldata=[
  //  {"id":1,"userId":"0dbd2f72-adee-43c0-88e2-1ccb63bec3c0","dtOfFlight":"2020-09-19","placeOfDeparture":"","makemodel":null,"placeOfArrival":"","":"fh","timeOfDepartureOutUTC":"2020-09-19","timeOfDepartureOut":"2020-09-19","timeOfDepartureOffUTC":"2020-09-19","timeOfDepartureOff":"2020-09-19","timeOfArrivalOnUTC":"2020-09-20","timeOfArrivalOn":"2020-09-20","timeOfArrivalInUTC":"2020-09-20","timeOfArrivalIn":"2020-09-20","seMe":"true","takeOffDay":1,"landingDay":1,"landingNight":1,"takeOffNight":1,"nameOfPic":"lll","sp":"24:00:00.000000","mp":"24:00:00.000000","pic":"24:00:00.000000","solo":"24:00:00.0000","spic":"24:00:00.000000","picus":"24:00:00.000000","copilot":"24:00:00.000000","duall":"24:00:00.000000","fl":"24:00:00.000000","fe":"24:00:00.000000","night":"24:00:00.000000","ifr":"24:00:00.000000","remarks":"ffgg","totalTimeFSTD":"24:00:00.000000","totalTimeFlights":"24:00:00.000000","totalTimeairborne":"24:00:00.000000","sourceFlag":"fh"},
   {"id":2,"userId":"0dbd2f72-adee-43c0-88e2-1ccb63bec3c0","dtOfFlight":"2020-09-20","placeOfDeparture":"London","makemodel":"Lenardo Aw101","placeOfArrival":"India","registrationOfAircraft":"fh","timeOfDepartureOutUTC":"2020-09-19","timeOfDepartureOut":"2020-09-19","timeOfDepartureOffUTC":"2020-09-19","timeOfDepartureOff":"2020-09-19","timeOfArrivalOnUTC":"2020-09-20","timeOfArrivalOn":"2020-09-20","timeOfArrivalInUTC":"2020-09-20","timeOfArrivalIn":"2020-09-20","seMe":"true","takeOffDay":1,"landingDay":1,"landingNight":1,"takeOffNight":1,"nameOfPic":"lll","sp":"24:00:00.000000","mp":"24:00:00.000000","pic":"24:00:00.000000","solo":"24:00:00.0000","spic":"24:00:00.000000","picus":"24:00:00.000000","copilot":"24:00:00.000000","duall":"24:00:00.000000","fl":"24:00:00.000000","fe":"24:00:00.000000","night":"24:00:00.000000","ifr":"24:00:00.000000","remarks":"ffgg","totalTimeFSTD":"24:00:00.000000","totalTimeFlights":"24:00:00.000000","totalTimeairborne":"24:00:00.000000","sourceFlag":"fh"}
];