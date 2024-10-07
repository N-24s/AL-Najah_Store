class Address {
    int code;
    String message;
    List<Data> data;

    Address({
        required this.code,
        required this.message,
        required this.data,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null 
            ? [] 
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    int id;
    String title;
    String phone;
    String description;
    String latitude;
    String longitude;
    bool isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        required this.id,
        required this.title,
        required this.phone,
        required this.description,
        required this.latitude,
        required this.longitude,
        required this.isActive,
         this.createdAt,
         this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        phone: json["phone"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["isActive"],
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? DateTime.now() : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "phone": phone,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "isActive": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };

       Map<String,dynamic> addressData(){
    Map<String,dynamic> loginInfo=Map();
    loginInfo["title"]=title;
    loginInfo["phone"]=phone;
    loginInfo["description"]=description;
    loginInfo["latitude"]=latitude;
    loginInfo["longitude"]=longitude;
    loginInfo["isActive"]=isActive;
    loginInfo["created_at"]=title;
    loginInfo["updated_at"]=phone;
    return loginInfo;
  }
     Map<String,dynamic> updateAddressData(){
    Map<String,dynamic> loginInfo=Map();
    loginInfo["title"]=title;
    loginInfo["phone"]=phone;
    loginInfo["description"]=description;
    loginInfo["latitude"]=latitude;
    loginInfo["longitude"]=longitude;
    loginInfo["isActive"]=isActive;
   
    return loginInfo;
  }
}


// class Address {
//   String name;
//   String address;
//   String phone;
//   bool selectedAddress;

//   Address.empty()
//       : name = '',
//         address = '',
//         phone = '',
//         selectedAddress=false;

//   Address({
//     this.selectedAddress=false,
//     required this.name,
//     required this.address,
//     required this.phone,
//   });

//   // Factory constructor to create an Address from JSON
//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       name: json['name'],
//       address: json['address'],
//       phone: json['phone'],
//     );
//   }

//   // Method to convert an Address instance into JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'address': address,
//       'phone': phone,
//     };
//   }
// }
