

  List countriesdata = [];
    List licenseclassdata=[];
  List licensecodesdata=[];
  List licensetitlesdata=[];
  List licensetypedata=[];
  List statedata=[];

  List apidata = [];
  String classOptions;
   List classdata = [];
  List<Map<String, dynamic>> planet ;
  List planetX = [];List planetB = [];
  List filteredCountries = [];
  //List planetList = ["planet", "Venus", "Earth"];

  List urls=[
  'http://192.168.43.246:8080/dLicence/api/countries/v1',
  'http://192.168.43.246:8080/dLicence/api/licenseclass/v1',
  'http://192.168.43.246:8080/dLicence/api/licensecodes/v1',
  'http://192.168.43.246:8080/dLicence/api/licensetitles/v1',
  'http://192.168.43.246:8080/dLicence/api/licensetype/v1',
  'http://192.168.43.246:8080/dLicence/api/states/v1'];

 
  List<Map<String, dynamic>> countriesdatalist=[];
  List<Map<String, dynamic>> licenseclassdatalist=[]; 
  List<Map<String, dynamic>> licensecodesdatalist=[];
  List<Map<String, dynamic>> licensetitlesdatalist=[];
  List<Map<String, dynamic>> licensetypedatalist=[];
  List<Map<String, dynamic>> statedatalist=[];
 