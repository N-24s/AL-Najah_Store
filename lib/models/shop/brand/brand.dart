// To parse this JSON data, do
//
//     final responsModel = responsModelFromJson(jsonString);

import 'dart:convert';

import 'package:al_najah_store/models/shop/store/store.dart';

ResponsModel responsModelFromJson(String str) => ResponsModel.fromJson(json.decode(str));

String responsModelToJson(ResponsModel data) => json.encode(data.toJson());

class ResponsModel {
    int code;
    String message;
    List<Brand> brand;

    ResponsModel({
        required this.code,
        required this.message,
        required this.brand,
    });

    factory ResponsModel.fromJson(Map<String, dynamic> json) => ResponsModel(
        code: json["code"],
        message: json["message"],
        brand: List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "brand": List<dynamic>.from(brand.map((x) => x.toJson())),
    };
}

class Brand {
    int id;
    String? name;
    String? description;
    String? logo;
    int? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    Brand({
        required this.id,
         this.name,
         this.description,
         this.logo,
         this.isActive,
         this.createdAt,
         this.updatedAt,
    });
      factory Brand.fromFeatured(Featured featured) {
    return Brand(
      id: featured.id,
      name: featured.name,
      logo: featured.logo,
      description: null,      
      isActive: 1,           
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "isActive": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
