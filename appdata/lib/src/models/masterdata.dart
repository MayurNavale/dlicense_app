
class Stateclass {
    Stateclass({
        this.countryId,
        this.id,
        this.stateName,
    });

    int countryId;
    int id;
    String stateName;

    factory Stateclass.fromJson(Map<String, dynamic> json) => Stateclass(
        countryId: json["countryId"],
        id: json["id"],
        stateName: json["stateName"],
    );

    Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "id": id,
        "stateName": stateName,
    };
}

class Airline {
    Airline({this.airlineName,this.id, });
    String airlineName;
    int id;

    factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        airlineName: json["airlineName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "airlineName": airlineName,
        "id": id,
    };
}
class Country {
    Country({
        this.countryCode,
        this.countryName,
        this.countryPhone,
        this.id,
    });

    String countryCode;
    String countryName;
    int countryPhone;
    int id;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        countryPhone: json["countryPhone"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "countryName": countryName,
        "countryPhone": countryPhone,
        "id": id,
    };
}
class Doctor {
    Doctor({
        this.doctorName,
        this.id,
    });

    String doctorName;
    int id;

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorName: json["doctorName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "doctorName": doctorName,
        "id": id,
    };
}

class Institution {
    Institution({
        this.id,
        this.institutionName,
    });

    int id;
    String institutionName;

    factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        id: json["id"],
        institutionName: json["institutionName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "institutionName": institutionName,
    };
}

class Language {
    Language({
        this.id,
        this.language,
    });

    int id;
    String language;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "language": language,
    };
}
class Class {
    Class({
        this.className,
        this.id,
    });

    String className;
    int id;

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        className: json["className"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "className": className,
        "id": id,
    };
}

class Code {
    Code({
        this.code,
        this.id,
    });

    String code;
    int id;

    factory Code.fromJson(Map<String, dynamic> json) => Code(
        code: json["code"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "id": id,
    };
}

class Titleclass {
    Titleclass({
        this.id,
        this.title,
    });

    int id;
    String title;

    factory Titleclass.fromJson(Map<String, dynamic> json) => Titleclass(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}
class Type {
    Type({
        this.id,
        this.typeName,
    });

    int id;
    String typeName;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        typeName: json["typeName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
    };
}
class Limitation {
    Limitation({
        this.id,
        this.limitation,
        this.medicalTypeId,
    });

    int id;
    String limitation;
    int medicalTypeId;

    factory Limitation.fromJson(Map<String, dynamic> json) => Limitation(
        id: json["id"],
        limitation: json["limitation"],
        medicalTypeId: json["medicalTypeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "limitation": limitation,
        "medicalTypeId": medicalTypeId,
    };
}
// class Medicaltype {
//     Medicaltype({
//         this.id,
//         this.limitations,
//         this.type,
//     });

//     int id;
//     List<Limitation> limitations;
//     String type;

//     factory Medicaltype.fromJson(Map<String, dynamic> json) => Medicaltype(
//         id: json["id"],
//         limitations: List<Limitation>.from(json["limitations"].map((x) => Limitation.fromJson(x))),
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "limitations": List<dynamic>.from(limitations.map((x) => x.toJson())),
//         "type": type,
//     };
// }
class Ministry {
    Ministry({
        this.id,
        this.ministryName,
    });

    int id;
    String ministryName;

    factory Ministry.fromJson(Map<String, dynamic> json) => Ministry(
        id: json["id"],
        ministryName: json["ministryName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ministryName": ministryName,
    };
}
class Niveaulevel {
    Niveaulevel({
        this.id,
        this.level,
    });

    int id;
    String level;

    factory Niveaulevel.fromJson(Map<String, dynamic> json) => Niveaulevel(
        id: json["id"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
    };
}
class School {
    School({
        this.id,
        this.schoolName,
    });

    int id;
    String schoolName;

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        schoolName: json["schoolName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
    };
}





// 
  List countriesdata = [];
    List licenseclassdata=[];
  List licensecodesdata=[];
  List licensetitlesdata=[];
  List licensetypedata=[];
  List statedata=[];

  List apidata = [];
  //String classOptions;
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
  List<Map<String, dynamic>> titledatalist=[];
  List<Map<String, dynamic>> licensetypedatalist=[];
  List<Map<String, dynamic>> statedatalist=[];
  List<Map<String, dynamic>> airlinedatalist=[];
   List<Map<String, dynamic>> institutiondatalist=[];
     List<Map<String, dynamic>> languagedatalist=[];
      List<Map<String, dynamic>> limitationdatalist=[];
  List<Map<String, dynamic>> ministrydatalist=[];
  List<Map<String, dynamic>> niveauleveldatalist=[];
 List<Map<String, dynamic>> schooldatalist=[];
 List<Map<String, dynamic>> doctordatalist=[];

    int licenceNumber;
     int licenceCodeOptionsid; 

    bool ir = false;
    bool co_Pilot = false;
    bool additionalratingcoPilot=false;
    bool additionalratingIR=false;
    int hasdata=0;
    String dt_irtest;
    String licence_Number;
    String countryCodes;

    String tpyeOptionData;
    String classOptions;
    String examinarRemarksandRestrictions;
    String ratingcertificateendorsement;
    String additionalratingtpyeOptionData;
    String instructorremarksandRestrictions;
   
    var contries='';
    var licenceCodeOptions='';
    var titleOfLicenceOptions='';
    var dateofratingtest;
    var dateOfInitialIssue;
    var dateofIRtest;
    var examiners;
    var additionalLicenceNumber;
    var validuntil;
    var examinerscertificatenumber;
    var instructorsOptions;
    var remarksandRestrictions; 
    var addtiionalratingclassOptions;
