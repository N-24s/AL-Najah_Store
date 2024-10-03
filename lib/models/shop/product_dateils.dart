// To parse this JSON data, do
//
//     final productdetails = productdetailsFromJson(jsonString);

import 'dart:convert';

// Productdetails productdetailsFromJson(String str) => Productdetails.fromJson(json.decode(str));

// String productdetailsToJson(Productdetails data) => json.encode(data.toJson());

// class Productdetails {
//     Productdateil productdateil;

//     Productdetails({
//         required this.productdateil,
//     });

//     factory Productdetails.fromJson(Map<String, dynamic> json) => Productdetails(
//         productdateil: Productdateil.fromJson(json["productdateil"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "productdateil": productdateil.toJson(),
//     };
// }

// class Productdateil {
//     int id;
//     String name;
//     String price;
//     String description;
//     int brandId;
//     int categoryId;
//     String image;
//     List<String> subImages;
//     int discountPercentage;
//     int isActive;
//     int viewsCount;
//     DateTime createdAt;
//     DateTime updatedAt;
//     List<SimilarProduct> similarProducts;
//     Brand category;
//     Brand brand;

//     Productdateil({
//         required this.id,
//         required this.name,
//         required this.price,
//         required this.description,
//         required this.brandId,
//         required this.categoryId,
//         required this.image,
//         required this.subImages,
//         required this.discountPercentage,
//         required this.isActive,
//         required this.viewsCount,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.similarProducts,
//         required this.category,
//         required this.brand,
//     });

//     factory Productdateil.fromJson(Map<String, dynamic> json) => Productdateil(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         description: json["description"],
//         brandId: json["brand_id"],
//         categoryId: json["category_id"],
//         image: json["image"],
//         subImages: List<String>.from(json["sub_images"].map((x) => x)),
//         discountPercentage: json["discount_percentage"],
//         isActive: json["isActive"],
//         viewsCount: json["views_count"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         similarProducts: List<SimilarProduct>.from(json["similar_products"].map((x) => SimilarProduct.fromJson(x))),
//         category: Brand.fromJson(json["category"]),
//         brand: Brand.fromJson(json["brand"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "description": description,
//         "brand_id": brandId,
//         "category_id": categoryId,
//         "image": image,
//         "sub_images": List<dynamic>.from(subImages.map((x) => x)),
//         "discount_percentage": discountPercentage,
//         "isActive": isActive,
//         "views_count": viewsCount,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "similar_products": List<dynamic>.from(similarProducts.map((x) => x.toJson())),
//         "category": category.toJson(),
//         "brand": brand.toJson(),
//     };
// }

// class Brand {
//     int id;
//     String name;

//     Brand({
//         required this.id,
//         required this.name,
//     });

//     factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

class SimilarProduct {
    int id;
    String name;
    String price;
SimilarProduct.empty():
id=0,
name='',
price='';

    SimilarProduct({
        required this.id,
        required this.name,
        required this.price,
    });

    factory SimilarProduct.fromJson(Map<String, dynamic> json) => SimilarProduct(
        id: json["id"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
    };
}
