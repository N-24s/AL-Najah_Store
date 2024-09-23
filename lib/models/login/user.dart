// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? accessToken;
    String? refreshToken;
    int? id;
    String? username;
    String? email;
    String? firstName;
    String? lastName;
    String? gender;
    String? image;
    String? password;

    User({
         this.accessToken,
         this.refreshToken,
         this.id,
         this.username,
         this.email,
         this.firstName,
         this.lastName,
         this.gender,
         this.image,
         this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
    };

      Map<String,String> authData(){
    Map<String,String> loginInfo=Map();
    loginInfo["username"]=username!;
    loginInfo["password"]=password!;
    return loginInfo;
  }
}
