import 'dart:convert';
LoogBookModuleClass loogBookModuleClassFromJson(String str) => LoogBookModuleClass.fromJson(json.decode(str));

String loogBookModuleClassToJson(LoogBookModuleClass data) => json.encode(data.toJson());

class LoogBookModuleClass {
    LoogBookModuleClass({
        this.copilot,
        this.dtOfFlight,
        this.dual,
        this.fe,
        this.fl,
        this.id=0,
        this.ifr,
        this.landing,
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
        this.seMe,
        this.solo,
        this.sp,
        this.spic,
        this.takeOff,
        this.timeOfArrivalIn,
        this.timeOfArrivalInUTC,
        this.timeOfArrivalOn,
        this.timeOfArrivalOnUTC,
        this.timeOfDepartureOff,
        this.timeOfDepartureOffUTC,
        this.timeOfDepartureOut,
        this.timeOfDepartureOutUTC,
        this.userId,
    });

    String copilot;
    String dtOfFlight;
    String dual;
    String fe;
    String fl;
    int id;
    String ifr;
    String landing;
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
    String sp;
    String spic;
    String takeOff;
    String timeOfArrivalIn;
    String timeOfArrivalInUTC;
    String timeOfArrivalOn;
    String timeOfArrivalOnUTC;
    String timeOfDepartureOff;
    String timeOfDepartureOffUTC;
    String timeOfDepartureOut;
    String timeOfDepartureOutUTC;
    String userId;

    factory LoogBookModuleClass.fromJson(Map<String, dynamic> json) => LoogBookModuleClass(
        copilot: json["copilot"],
        dtOfFlight: json["dtOfFlight"],
        dual: json["dual"],
        fe: json["fe"],
        fl: json["fl"],
        id: json["id"],
        ifr: json["ifr"],
        landing: json["landing"],
        makemodel: json["makemodel"],
        mp: json["mp"],
        nameOfPic: json["nameOfPic"],
        night: json["night"],
        pic: json["pic"],
        picus: json["picus"],
        placeOfArrival: json["placeOfArrival"],
        placeOfDeparture: json["placeOfDeparture"],
        registrationOfAircraft: json["registrationOfAircraft"],
        remarks: json["remarks"],
        seMe: json["seMe"],
        solo: json["solo"],
        sp: json["sp"],
        spic: json["spic"],
        takeOff: json["takeOff"],
        timeOfArrivalIn: json["timeOfArrivalIn"],
        timeOfArrivalInUTC: json["timeOfArrivalInUTC"],
        timeOfArrivalOn: json["timeOfArrivalOn"],
        timeOfArrivalOnUTC: json["timeOfArrivalOnUTC"],
        timeOfDepartureOff: json["timeOfDepartureOff"],
        timeOfDepartureOffUTC: json["timeOfDepartureOffUTC"],
        timeOfDepartureOut: json["timeOfDepartureOut"],
        timeOfDepartureOutUTC: json["timeOfDepartureOutUTC"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "copilot": copilot,
        "dtOfFlight": dtOfFlight,
        "dual": dual,
        "fe": fe,
        "fl": fl,
        "id": id,
        "ifr": ifr,
        "landing": landing,
        "makemodel": makemodel,
        "mp": mp,
        "nameOfPic": nameOfPic,
        "night": night,
        "pic": pic,
        "picus": picus,
        "placeOfArrival": placeOfArrival,
        "placeOfDeparture": placeOfDeparture,
        "registrationOfAircraft": registrationOfAircraft,
        "remarks": remarks,
        "seMe": seMe,
        "solo": solo,
        "sp": sp,
        "spic": spic,
        "takeOff": takeOff,
        "timeOfArrivalIn": timeOfArrivalIn,
        "timeOfArrivalInUTC": timeOfArrivalInUTC,
        "timeOfArrivalOn": timeOfArrivalOn,
        "timeOfArrivalOnUTC": timeOfArrivalOnUTC,
        "timeOfDepartureOff": timeOfDepartureOff,
        "timeOfDepartureOffUTC": timeOfDepartureOffUTC,
        "timeOfDepartureOut": timeOfDepartureOut,
        "timeOfDepartureOutUTC": timeOfDepartureOutUTC,
        "userId": userId,
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
     timeofDepartureOut,timeOfDepartureOutUTCfortimediff,timeOfArrivalInUTCfortimediff;
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