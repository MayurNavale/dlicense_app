import 'dart:convert';

////////////////////////////////

//_onSuccessResponse(UserClass user){}

  List<Map<String, dynamic>> countriesalreadlist=[
  {
    "id": 1,
    "countryName": " AF",
    "countryCode": "Afghanistan",
    "countryPhone": 93
  },
  {
    "id": 2,
    "countryName": "AL",
    "countryCode": "Albania",
    "countryPhone": 355
  },
  {
    "id": 3,
    "countryName": "AG",
    "countryCode": "Algeria",
    "countryPhone": 213
  },
  
];



  List<Map<String, dynamic>> statuslist=[
  {
    "id": 1,
    "Name": " Marrid",
    
  },
  {
    "id": 2,
    "Name": "Single",
    
  },
 
  
];
UserClass userClassFromJson(String str) => UserClass.fromJson(json.decode(str));

String userClassToJson(UserClass data) => json.encode(data.toJson());

class UserClass {
    UserClass({
        this.address='pune 28',
        this.dateOfBirth='202-01-01',
        this.displayName='tech',
        this.email='future1@gmail.com',
        this.firstName='sam',
        this.id,
        this.lastName='pataki',
        this.nationality='india',
        this.passportPhoto='',
        this.password='1234',
        this.placeOfBirth='pune',
        this.status='Single',
        this.telephoneNumber=1234,
    });

    String address;
    String dateOfBirth;
    String displayName;
    String email;
    String firstName;
    String id;
    String lastName;
    String nationality;
    String passportPhoto;
    String password;
    String placeOfBirth;
    String status;
    int telephoneNumber;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        displayName: json["displayName"],
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
        nationality: json["nationality"],
        passportPhoto: json["passportPhoto"],
        password: json["password"],
        placeOfBirth: json["placeOfBirth"],
        status: json["status"],
        telephoneNumber: json["telephoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "dateOfBirth": dateOfBirth,
        "displayName": displayName,
        "email": email,
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
        "nationality": nationality,
        "passportPhoto": passportPhoto,
        "password": password,
        "placeOfBirth": placeOfBirth,
        "status": status,
        "telephoneNumber": telephoneNumber,
    };
}

