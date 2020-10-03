import 'dart:convert';
LanguageClass welcomeFromJson(String str) => LanguageClass.fromJson(json.decode(str));

String welcomeToJson(LanguageClass data) => json.encode(data.toJson());

class LanguageClass {
    LanguageClass({
        this.certificateNumber,
        this.checkDate,
        this.id=0,
        this.licenseId=0,
        this.niveauLevelId=0,
        this.supportedLanguageId=0,
    });

    int certificateNumber;
    String checkDate;
    int id;
    int licenseId;
    int niveauLevelId;
    int supportedLanguageId;

    factory LanguageClass.fromJson(Map<String, dynamic> json) => LanguageClass(
        certificateNumber: json["certificateNumber"],
        checkDate: json["checkDate"],
        id: json["id"],
        licenseId: json["licenseId"],
        niveauLevelId: json["niveauLevelId"],
        supportedLanguageId: json["supportedLanguageId"],
    );

    Map<String, dynamic> toJson() => {
        "certificateNumber": certificateNumber,
        "checkDate": checkDate,
        "id": id,
        "licenseId": licenseId,
        "niveauLevelId": niveauLevelId,
        "supportedLanguageId": supportedLanguageId,
    };
}



