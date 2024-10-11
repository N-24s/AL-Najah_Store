// To parse this JSON data, do
//
//     final responsModelProductByCategories = responsModelProductByCategoriesFromJson(jsonString);

import 'dart:convert';

ResponsModelProductByCategories responsModelProductByCategoriesFromJson(String str) => ResponsModelProductByCategories.fromJson(json.decode(str));

String responsModelProductByCategoriesToJson(ResponsModelProductByCategories data) => json.encode(data.toJson());

class ResponsModelProductByCategories {
    int code;
    String message;
    List<Product> data;

    ResponsModelProductByCategories({
        required this.code,
        required this.message,
        required this.data,
    });

    factory ResponsModelProductByCategories.fromJson(Map<String, dynamic> json) => ResponsModelProductByCategories(
        code: json["code"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String name;
    String price;
    String description;
    int brandId;
    int categoryId;
    String image;
    List<String>? subImages;
    int discountPercentage;
    int isActive;
    int viewsCount;
    DateTime createdAt;
    DateTime updatedAt;
    Brand category;
    Brand brand;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.brandId,
        required this.categoryId,
        required this.image,
        required this.subImages,
        required this.discountPercentage,
        required this.isActive,
        required this.viewsCount,
        required this.createdAt,
        required this.updatedAt,
        required this.category,
        required this.brand,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        image: json["image"],
        subImages: json["sub_images"] == null ? [] : List<String>.from(json["sub_images"]!.map((x) => x)),
        discountPercentage: json["discount_percentage"],
        isActive: json["isActive"],
        viewsCount: json["views_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Brand.fromJson(json["category"]),
        brand: Brand.fromJson(json["brand"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "brand_id": brandId,
        "category_id": categoryId,
        "image": image,
        "sub_images": subImages == null ? [] : List<dynamic>.from(subImages!.map((x) => x)),
        "discount_percentage": discountPercentage,
        "isActive": isActive,
        "views_count": viewsCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
        "brand": brand.toJson(),
    };
}

class Brand {
    int id;
    Name name;

    Brand({
        required this.id,
        required this.name,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
    };
}

enum Name {
    APPLE,
    LAPTOPS,
    SAMSUNG
}

final nameValues = EnumValues({
    "Apple": Name.APPLE,
    "Laptops": Name.LAPTOPS,
    "Samsung": Name.SAMSUNG
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
