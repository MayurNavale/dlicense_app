import 'dart:convert';
LanguagePost welcomeFromJson(String str) => LanguagePost.fromJson(json.decode(str));

String welcomeToJson(LanguagePost data) => json.encode(data.toJson());

class LanguagePost {
    LanguagePost({
        this.certificateNumber,
        this.checkDate,
        this.id,
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

    factory LanguagePost.fromJson(Map<String, dynamic> json) => LanguagePost(
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



