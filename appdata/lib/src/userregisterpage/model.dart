import 'dart:convert';

// 
UserClass userClassFromJson(String str) => UserClass.fromJson(json.decode(str));

String userClassToJson(UserClass data) => json.encode(data.toJson());

class UserClass {
    UserClass({
        this.address='walunj',
        this.dateOfBirth='2020-01-01',
        this.displayName='MSN',
        this.email='mayurnavale97@gmail.com',
        this.enabled=true,
        this.firstName='nikhil',
        this.id='',
        this.lastName='navale',
        this.nationality='indian',
        this.passportPhoto='address',
        this.password='pass',
        this.placeOfBirth='saswad',
        this.roles,
        this.status='active',
        this.telephoneNumber=23467,
        this.token='APPLICANT',
        this.username='25ef5d3f-84ca-4771-b072-e2d3edbe6963',
    });
 
    String address;
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
    String placeOfBirth;
    List<Role> roles;
    String status;
    int telephoneNumber;
    String token;
    String username;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        address: json["address"],
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
        placeOfBirth: json["placeOfBirth"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        status: json["status"],
        telephoneNumber: json["telephoneNumber"],
        token: json["token"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
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
        "placeOfBirth": placeOfBirth,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "status": status,
        "telephoneNumber": telephoneNumber,
        "token": token,
        "username": username,
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
