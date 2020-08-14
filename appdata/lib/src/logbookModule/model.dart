//     final LoogBookModuleClass = LoogBookModuleClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoogBookModuleClass loogBookModuleClassFromJson(String str) => LoogBookModuleClass.fromJson(json.decode(str));

String loogBookModuleClassToJson(LoogBookModuleClass data) => json.encode(data.toJson());

class LoogBookModuleClass {
    LoogBookModuleClass({
        @required this.copilot,
        @required this.dtOfFlight,
        @required this.dual,
        @required this.fe,
        @required this.fl,
        @required this.id,
        @required this.ifr,
        @required this.landing,
        @required this.makemodel,
        @required this.mp,
        @required this.nameOfPic,
        @required this.night,
        @required this.pic,
        @required this.picus,
        @required this.placeOfArrival,
        @required this.placeOfDeparture,
        @required this.registrationOfAircraft,
        @required this.remarks,
        @required this.solo,
        @required this.sp,
        @required this.spic,
        @required this.takeOff,
        @required this.timeOfArrivalIn,
        @required this.timeOfArrivalInUtc,
        @required this.timeOfArrivalOn,
        @required this.timeOfArrivalOnUtc,
        @required this.timeOfDepartureOffUtc,
        @required this.timeOfDepartureOutUtc,
        @required this.timeofDepartureOff,
        @required this.timeofDepartureOut,
        @required this.userId,
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
    String solo;
    String sp;
    String spic;
    String takeOff;
    String timeOfArrivalIn;
    String timeOfArrivalInUtc;
    String timeOfArrivalOn;
    String timeOfArrivalOnUtc;
    String timeOfDepartureOffUtc;
    String timeOfDepartureOutUtc;
    String timeofDepartureOff;
    String timeofDepartureOut;
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
        solo: json["solo"],
        sp: json["sp"],
        spic: json["spic"],
        takeOff: json["takeOff"],
        timeOfArrivalIn: json["timeOfArrivalIn"],
        timeOfArrivalInUtc: json["timeOfArrivalInUTC"],
        timeOfArrivalOn: json["timeOfArrivalOn"],
        timeOfArrivalOnUtc: json["timeOfArrivalOnUTC"],
        timeOfDepartureOffUtc: json["timeOfDepartureOffUTC"],
        timeOfDepartureOutUtc: json["timeOfDepartureOutUTC"],
        timeofDepartureOff: json["timeofDepartureOff"],
        timeofDepartureOut: json["timeofDepartureOut"],
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
        "solo": solo,
        "sp": sp,
        "spic": spic,
        "takeOff": takeOff,
        "timeOfArrivalIn": timeOfArrivalIn,
        "timeOfArrivalInUTC": timeOfArrivalInUtc,
        "timeOfArrivalOn": timeOfArrivalOn,
        "timeOfArrivalOnUTC": timeOfArrivalOnUtc,
        "timeOfDepartureOffUTC": timeOfDepartureOffUtc,
        "timeOfDepartureOutUTC": timeOfDepartureOutUtc,
        "timeofDepartureOff": timeofDepartureOff,
        "timeofDepartureOut": timeofDepartureOut,
        "userId": userId,
    };
}
