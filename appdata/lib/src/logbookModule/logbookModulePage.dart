import 'dart:convert';
LoogBookModuleClass loogBookModuleClassFromJson(String str) => LoogBookModuleClass.fromJson(json.decode(str));
String loogBookModuleClassToJson(LoogBookModuleClass data) => json.encode(data.toJson());

class LoogBookModuleClass {
    LoogBookModuleClass({
        this.copilot,
        this.dtOfFlight,
        this.duall,
        this.fe,
        this.fl,
        this.id=0,
        this.ifr,
        this.landingDay,
        this.landingNight,
        this.makemodel,
        this.mp,
        this.nameOfPic,
        this.night,
        this.pic,
        this.picus,
        this.placeOfArrival,
        this.placeOfDeparture,
        this.registrationOfAircraft,
        this.remarks,
        this.seMe='false',
        this.solo,
        this.sourceFlag,
        this.sp,
        this.spic,
        this.takeOffDay,
        this.takeOffNight,
        this.timeOfArrivalIn,
        this.timeOfArrivalInUTC,
        this.timeOfArrivalOn,
        this.timeOfArrivalOnUTC,
        this.timeOfDepartureOff,
        this.timeOfDepartureOffUTC,
        this.timeOfDepartureOut,
        this.timeOfDepartureOutUTC,
        this.totalTimeFstd,
        this.totalTimeFlights,
        this.totalTimeairborne,
        this.userId,
    });

     String copilot;
     String dtOfFlight;
     String duall;
     String fe;
     String fl;
     int id;
     String ifr;
     int landingDay;
     int landingNight;
     String makemodel;
     String mp;
     String nameOfPic;
     String night;
     String pic;
     String picus;
     String placeOfArrival;
     String placeOfDeparture;
     String registrationOfAircraft;
     String remarks;
     String seMe;
     String solo;
     String sourceFlag;
     String sp;
     String spic;
     int takeOffDay;
     int takeOffNight;
     String timeOfArrivalIn;
     String timeOfArrivalInUTC;
     String timeOfArrivalOn;
     String timeOfArrivalOnUTC;
     String timeOfDepartureOff;
     String timeOfDepartureOffUTC;
     String timeOfDepartureOut;
     String timeOfDepartureOutUTC;
     String totalTimeFstd;
     String totalTimeFlights;
     String totalTimeairborne;
     String userId;

    factory LoogBookModuleClass.fromJson(Map<String, dynamic> json) => LoogBookModuleClass(
        copilot: json["copilot"] == null ? "" : json["copilot"],
        dtOfFlight: json["dtOfFlight"] == null ? "" : json["dtOfFlight"],
        duall: json["duall"] == null ? "" : json["duall"],
        fe: json["fe"] == null ? "" : json["fe"],
        fl: json["fl"] == null ? "" : json["fl"],
        id: json["id"] == null ? "" : json["id"],
        ifr: json["ifr"] == null ? "" : json["ifr"],
        landingDay: json["landingDay"] == null ? "" : json["landingDay"],
        landingNight: json["landingNight"] == null ? "" : json["landingNight"],
        makemodel: json["makemodel"] == null ? "" : json["makemodel"],
        mp: json["mp"] == null ? "" : json["mp"],
        nameOfPic: json["nameOfPic"] == null ? "" : json["nameOfPic"],
        night: json["night"] == null ? "" : json["night"],
        pic: json["pic"] == null ? "" : json["pic"],
        picus: json["picus"] == null ? "" : json["picus"],
        placeOfArrival: json["placeOfArrival"] == null ? "" : json["placeOfArrival"],
        placeOfDeparture: json["placeOfDeparture"] == null ? "" : json["placeOfDeparture"],
        registrationOfAircraft: json["registrationOfAircraft"] == null ? "" : json["registrationOfAircraft"],
        remarks: json["remarks"] == null ? "" : json["remarks"],
        seMe: json["seMe"] == null ? "" : json["seMe"],
        solo: json["solo"] == null ? "" : json["solo"],
        sourceFlag: json["sourceFlag"] == null ? "" : json["sourceFlag"],
        sp: json["sp"] == null ? "" : json["sp"],
        spic: json["spic"] == null ? "" : json["spic"],
        takeOffDay: json["takeOffDay"] == null ? "" : json["takeOffDay"],
        takeOffNight: json["takeOffNight"] == null ? "" : json["takeOffNight"],
        timeOfArrivalIn: json["timeOfArrivalIn"] == null ? "" : json["timeOfArrivalIn"],
        timeOfArrivalInUTC: json["timeOfArrivalInUTC"] == null ? "" : json["timeOfArrivalInUTC"],
        timeOfArrivalOn: json["timeOfArrivalOn"] == null ? "" : json["timeOfArrivalOn"],
        timeOfArrivalOnUTC: json["timeOfArrivalOnUTC"] == null ? "" : json["timeOfArrivalOnUTC"],
        timeOfDepartureOff: json["timeOfDepartureOff"] == null ? "" : json["timeOfDepartureOff"],
        timeOfDepartureOffUTC: json["timeOfDepartureOffUTC"] == null ? "" : json["timeOfDepartureOffUTC"],
        timeOfDepartureOut: json["timeOfDepartureOut"] == null ? "" : json["timeOfDepartureOut"],
        timeOfDepartureOutUTC: json["timeOfDepartureOutUTC"] == null ? "" : json["timeOfDepartureOutUTC"],
        totalTimeFstd: json["totalTimeFSTD"] == null ? "" : json["totalTimeFSTD"],
        totalTimeFlights: json["totalTimeFlights"] == null ? "" : json["totalTimeFlights"],
        totalTimeairborne: json["totalTimeairborne"] == null ? "" : json["totalTimeairborne"],
        userId: json["userId"] == null ? "" : json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "copilot": copilot == null ? null : copilot,
        "dtOfFlight": dtOfFlight == null ? null : dtOfFlight,
        "duall": duall == null ? null : duall,
        "fe": fe == null ? null : fe,
        "fl": fl == null ? null : fl,
        "id": id == null ? null : id,
        "ifr": ifr == null ? null : ifr,
        "landingDay": landingDay == null ? null : landingDay,
        "landingNight": landingNight == null ? null : landingNight,
        "makemodel": makemodel == null ? null : makemodel,
        "mp": mp == null ? null : mp,
        "nameOfPic": nameOfPic == null ? null : nameOfPic,
        "night": night == null ? null : night,
        "pic": pic == null ? null : pic,
        "picus": picus == null ? null : picus,
        "placeOfArrival": placeOfArrival == null ? null : placeOfArrival,
        "placeOfDeparture": placeOfDeparture == null ? null : placeOfDeparture,
        "registrationOfAircraft": registrationOfAircraft == null ? null : registrationOfAircraft,
        "remarks": remarks == null ? null : remarks,
        "seMe": seMe == null ? null : seMe,
        "solo": solo == null ? null : solo,
        "sourceFlag": sourceFlag == null ? null : sourceFlag,
        "sp": sp == null ? null : sp,
        "spic": spic == null ? null : spic,
        "takeOffDay": takeOffDay == null ? null : takeOffDay,
        "takeOffNight": takeOffNight == null ? null : takeOffNight,
        "timeOfArrivalIn": timeOfArrivalIn == null ? null : timeOfArrivalIn,
        "timeOfArrivalInUTC": timeOfArrivalInUTC == null ? null : timeOfArrivalInUTC,
        "timeOfArrivalOn": timeOfArrivalOn == null ? null : timeOfArrivalOn,
        "timeOfArrivalOnUTC": timeOfArrivalOnUTC == null ? null : timeOfArrivalOnUTC,
        "timeOfDepartureOff": timeOfDepartureOff == null ? null : timeOfDepartureOff,
        "timeOfDepartureOffUTC": timeOfDepartureOffUTC == null ? null : timeOfDepartureOffUTC,
        "timeOfDepartureOut": timeOfDepartureOut == null ? null : timeOfDepartureOut,
        "timeOfDepartureOutUTC": timeOfDepartureOutUTC == null ? null : timeOfDepartureOutUTC,
        "totalTimeFSTD": totalTimeFstd == null ? null : totalTimeFstd,
        "totalTimeFlights": totalTimeFlights == null ? null : totalTimeFlights,
        "totalTimeairborne": totalTimeairborne == null ? null : totalTimeairborne,
        "userId": userId == null ? null : userId,
    };
}


bool  copilot,
        dual,
        fe,
        fl,
        ifr,
        mp,
        nameOfPic,
        night,
        pic,
        picus,boolseme,
        solo,
        sp,
        spic;
var dualinitiial,copilotinitial;

DateTime timeDepartureout,
     timeOfArrivalIn,
     timeOfArrivalInUTC,
     timeOfArrivalOn,
     timeOfArrivalOnUTC,
     timeOfDepartureOffUTC,
     timeOfDepartureOutUTC,
     timeofDepartureOff,
     timeofDepartureOut,
     timeOfDepartureOutUTCfortimediff,
     timeOfArrivalInUTCfortimediff;
// TextEditingController timeDepartureoUTCtr,dtdepartureout;

List<Map<String, Object>>  placesdatalistdemo= [
    {
      "id": 1,
      "placeName": "Boston",
      "placeCode": "Europe/Zurich"
    },
    {
      "id": 2,
      "placeName": "India",
      "placeCode": "Asia/Kolkata"
    },
    {
      "id": 3,
      "placeName": "London",
      "placeCode": "Europe/London"
    }
];