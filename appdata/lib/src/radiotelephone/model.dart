import 'dart:convert';

Radiotelephone radiotelephoneFromJson(String str) => Radiotelephone.fromJson(json.decode(str));

String radiotelephoneToJson(Radiotelephone data) => json.encode(data.toJson());

class Radiotelephone

 {
    Radiotelephone({
        this.dtIssue,
        this.id,
        this.licenseId,
        this.number,
    });

    String dtIssue;
    int id;
    int licenseId;
    int number;

    factory Radiotelephone.fromJson(Map<String, dynamic> json) => Radiotelephone(
        dtIssue: json["dtIssue"] == null ? null : json["dtIssue"],
        id: json["id"] == null ? null : json["id"],
        licenseId: json["licenseId"] == null ? null : json["licenseId"],
        number: json["number"] == null ? null : json["number"],
    );

    Map<String, dynamic> toJson() => {
        "dtIssue": dtIssue == null ? null : dtIssue,
        "id": id == null ? null : id,
        "licenseId": licenseId == null ? null : licenseId,
        "number": number == null ? null : number,
    };
}