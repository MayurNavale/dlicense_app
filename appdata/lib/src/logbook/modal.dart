

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Logbook logbookFromJson(String str) => Logbook.fromJson(json.decode(str));

String logbookToJson(Logbook data) => json.encode(data.toJson());

class Logbook {
    Logbook({
        this.id,
        this.pathLicensePages,
        this.totalLandingDay,
        this.totalLandingNight,
        this.totalTakeoffDay,
        this.totalTakeoffNight,
        this.totalTimeCoPilot,
        this.totalTimeDual,
        this.totalTimeFe,
        this.totalTimeFi,
        this.totalTimeFstd,
        this.totalTimeFlights,
        this.totalTimeIfr,
        this.totalTimeMultiPilot,
        this.totalTimeNight,
        this.totalTimePic,
        this.totalTimePicus,
        this.totalTimeSinglePilot,
        this.totalTimeSolo,
        this.totalTimeSpic,
        this.totalTimeairborne,
    });

    int id;
    String pathLicensePages;
    int totalLandingDay;
    int totalLandingNight;
    int totalTakeoffDay;
    int totalTakeoffNight;
    int totalTimeCoPilot;
    int totalTimeDual;
    int totalTimeFe;
    int totalTimeFi;
    int totalTimeFstd;
    int totalTimeFlights;
    int totalTimeIfr;
    int totalTimeMultiPilot;
    int totalTimeNight;
    int totalTimePic;
    int totalTimePicus;
    int totalTimeSinglePilot;
    int totalTimeSolo;
    int totalTimeSpic;
    int totalTimeairborne;

    factory Logbook.fromJson(Map<String, dynamic> json) => Logbook(
        id: json["id"],
        pathLicensePages: json["pathLicensePages"],
        totalLandingDay: json["totalLandingDay"],
        totalLandingNight: json["totalLandingNight"],
        totalTakeoffDay: json["totalTakeoffDay"],
        totalTakeoffNight: json["totalTakeoffNight"],
        totalTimeCoPilot: json["totalTimeCoPilot"],
        totalTimeDual: json["totalTimeDual"],
        totalTimeFe: json["totalTimeFE"],
        totalTimeFi: json["totalTimeFI"],
        totalTimeFstd: json["totalTimeFSTD"],
        totalTimeFlights: json["totalTimeFlights"],
        totalTimeIfr: json["totalTimeIFR"],
        totalTimeMultiPilot: json["totalTimeMultiPilot"],
        totalTimeNight: json["totalTimeNight"],
        totalTimePic: json["totalTimePic"],
        totalTimePicus: json["totalTimePicus"],
        totalTimeSinglePilot: json["totalTimeSinglePilot"],
        totalTimeSolo: json["totalTimeSolo"],
        totalTimeSpic: json["totalTimeSpic"],
        totalTimeairborne: json["totalTimeairborne"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pathLicensePages": pathLicensePages,
        "totalLandingDay": totalLandingDay,
        "totalLandingNight": totalLandingNight,
        "totalTakeoffDay": totalTakeoffDay,
        "totalTakeoffNight": totalTakeoffNight,
        "totalTimeCoPilot": totalTimeCoPilot,
        "totalTimeDual": totalTimeDual,
        "totalTimeFE": totalTimeFe,
        "totalTimeFI": totalTimeFi,
        "totalTimeFSTD": totalTimeFstd,
        "totalTimeFlights": totalTimeFlights,
        "totalTimeIFR": totalTimeIfr,
        "totalTimeMultiPilot": totalTimeMultiPilot,
        "totalTimeNight": totalTimeNight,
        "totalTimePic": totalTimePic,
        "totalTimePicus": totalTimePicus,
        "totalTimeSinglePilot": totalTimeSinglePilot,
        "totalTimeSolo": totalTimeSolo,
        "totalTimeSpic": totalTimeSpic,
        "totalTimeairborne": totalTimeairborne,
    };
}


shoe(
 Logbook logbookData){
// LicenseDetail licenseDetail,
//Personnel personal){
// saveLicenseData.personnel = <Personnel>[personal];
// saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String json = logbookToJson(logbookData);
 print( json);

}
