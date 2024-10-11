// To parse this JSON data, do
//
//     final responsModel = responsModelFromJson(jsonString);

import 'dart:convert';


ResponsModel responsModelFromJson(String str) => ResponsModel.fromJson(json.decode(str));

String responsModelToJson(ResponsModel data) => json.encode(data.toJson());

class ResponsModel {
    int code;
    String message;
    List<Product>products;

    ResponsModel({
        required this.code,
        required this.message,
        required this.products,
    });

    factory ResponsModel.fromJson(Map<String, dynamic> json) => ResponsModel(
        code: json["code"],
        message: json["message"],
        products: List<Product>.from(json["data"].map((x) => Product.fromJson(x))).toList(),

    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String name;
    String price;
    String image;
    int discountPercentage;
    int brandId;
    Brand brand;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.image,
        required this.discountPercentage,
        required this.brandId,
        required this.brand,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        discountPercentage: json["discount_percentage"],
        brandId: json["brand_id"],
        brand: Brand.fromJson(json["brand"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "discount_percentage": discountPercentage,
        "brand_id": brandId,
        "brand": brand.toJson(),
    };
}

class Brand {
    int id;
    String name;

    Brand({
        required this.id,
        required this.name,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
