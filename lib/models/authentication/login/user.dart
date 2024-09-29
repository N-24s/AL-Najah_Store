

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    int code;
    String message;
    User user;

    Users({
        required this.code,
        required this.message,
        required this.user,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        code: json["code"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? email;
    dynamic? city;
    dynamic? phone;
    dynamic? avatar;
    dynamic? bio;
    String? token;
    String? role;
    String? password;


    User({
         this.id,
         this.name,
         this.email,
         this.city,
         this.phone,
         this.avatar,
         this.bio,
         this.token,
         this.role,
         this.password,
        
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        city: json["city"],
        phone: json["phone"],
        avatar: json["avatar"],
        bio: json["bio"],
        token: json["token"],
        role: json["role"], 
        password: json['password']
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "city": city,
        "phone": phone,
        "avatar": avatar,
        "bio": bio,
        "token": token,
        "role": role,
        'password':password
    };
    
      Map<String,String> authData(){
    Map<String,String> loginInfo=Map();
    loginInfo["email"]=email!;
    loginInfo["password"]=password!;
    print(password);
    return loginInfo;
  }
}


// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//     String? accessToken;
//     String? refreshToken;
//     int? id;
//     String? username;
//     String? email;
//     String? firstName;
//     String? lastName;
//     String? gender;
//     String? image;
//     String? password;

//     User({
//          this.accessToken,
//          this.refreshToken,
//          this.id,
//          this.username,
//          this.email,
//          this.firstName,
//          this.lastName,
//          this.gender,
//          this.image,
//          this.password,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         accessToken: json["accessToken"],
//         refreshToken: json["refreshToken"],
//         id: json["id"],
//         username: json["username"],
//         email: json["email"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         gender: json["gender"],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "accessToken": accessToken,
//         "refreshToken": refreshToken,
//         "id": id,
//         "username": username,
//         "email": email,
//         "firstName": firstName,
//         "lastName": lastName,
//         "gender": gender,
//         "image": image,
//     };

//       Map<String,String> authData(){
//     Map<String,String> loginInfo=Map();
//     loginInfo["username"]=username!;
//     loginInfo["password"]=password!;
//     return loginInfo;
//   }
// }
