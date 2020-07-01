

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
