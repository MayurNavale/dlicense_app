import 'dart:convert';

// 
UserClass userClassFromJson(String str) => UserClass.fromJson(json.decode(str));

String userClassToJson(UserClass data) => json.encode(data.toJson());

class UserClass {
    UserClass({
         this.address='walunj',
         this.city='pune',
         this.createdAt,
         this.dateOfBirth='1996-08-02',
         this.displayName='msn',
         this.email='tanaka@gmail.com',
         this.enabled=true,
         this.firstName='mayur',
         this.id='',
         this.lastName='navale',
         this.nationality='indian',
         this.passportPhoto='',
         this.password='password',
         this.pincode=412303,
         this.placeOfBirth='saswad',
         this.roles,
         this.status='single',
         this.telephoneNumber=123467,
         this.token='',
         this.updatedAt,
         this.username,
         this.version=0,
    });

    String address;
    String city;
    String createdAt;
    String dateOfBirth;
    String displayName;
    String email;
    bool enabled;
    String firstName;
    String id;
    String lastName;
    String nationality;
    String passportPhoto;
    String password;
    int pincode;
    String placeOfBirth;
    List<Role> roles;
    String status;
    int telephoneNumber;
    String token;
    String updatedAt;
    String username;
    int version;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        address: json["address"],
        city: json["city"],
        createdAt: json["createdAt"],
        dateOfBirth: json["dateOfBirth"],
        displayName: json["displayName"],
        email: json["email"],
        enabled: json["enabled"],
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
        nationality: json["nationality"],
        passportPhoto: json["passportPhoto"],
        password: json["password"],
        pincode: json["pincode"],
        placeOfBirth: json["placeOfBirth"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        status: json["status"],
        telephoneNumber: json["telephoneNumber"],
        token: json["token"],
        updatedAt: json["updatedAt"],
        username: json["username"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "createdAt": createdAt,
        "dateOfBirth": dateOfBirth,
        "displayName": displayName,
        "email": email,
        "enabled": enabled,
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
        "nationality": nationality,
        "passportPhoto": passportPhoto,
        "password": password,
        "pincode": pincode,
        "placeOfBirth": placeOfBirth,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "status": status,
        "telephoneNumber": telephoneNumber,
        "token": token,
        "updatedAt": updatedAt,
        "username": username,
        "version": version,
    };
}

class Role {
    Role({
         this.id=0,
         this.name='ROLE_APPLICANT',
    });

    int id;
    String name;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
