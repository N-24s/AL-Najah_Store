// To parse this JSON data, do
//
//     final responsModelStore = responsModelStoreFromJson(jsonString);

import 'dart:convert';

ResponsModelStore responsModelStoreFromJson(String str) => ResponsModelStore.fromJson(json.decode(str));

String responsModelStoreToJson(ResponsModelStore data) => json.encode(data.toJson());

class ResponsModelStore {
    String code;
    String message;
    Data data;

    ResponsModelStore({
        required this.code,
        required this.message,
        required this.data,
    });

    factory ResponsModelStore.fromJson(Map<String, dynamic> json) => ResponsModelStore(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<Featured> featured;
    List<Category> categories;

    Data({
        required this.featured,
        required this.categories,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        featured: List<Featured>.from(json["featured"].map((x) => Featured.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "featured": List<dynamic>.from(featured.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;
    String image;
    int isActive;
    DateTime createdAt;
    DateTime updatedAt;
    List<Brand> brands;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.brands,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "isActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class Brand {
    int id;
    String name;
    String description;
    String logo;
    int isActive;
    DateTime createdAt;
    DateTime updatedAt;
    int laravelThroughKey;
    List<Product> products;

    Brand({
        required this.id,
        required this.name,
        required this.description,
        required this.logo,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.laravelThroughKey,
        required this.products,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        laravelThroughKey: json["laravel_through_key"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "isActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "laravel_through_key": laravelThroughKey,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    int brandId;
    int categoryId;
    String price;
    String image;

    Product({
        required this.id,
        required this.brandId,
        required this.categoryId,
        required this.price,
        required this.image,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        price: json["price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand_id": brandId,
        "category_id": categoryId,
        "price": price,
        "image": image,
    };
}

class Featured {
    int id;
    String name;
    String logo;

    Featured({
        required this.id,
        required this.name,
        required this.logo,
    });

    factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
    };
}
