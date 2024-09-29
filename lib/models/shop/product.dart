import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:al_najah_store/utilis/constants/http_url.dart';
import 'package:al_najah_store/utilis/helpers/api_exception.dart';
import 'package:al_najah_store/utilis/helpers/http_helper.dart';


import 'dart:convert';

// To parse this JSON data
Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  int code;
  String message;
  Data data;

  Products({
    required this.code,
    required this.message,
    required this.data,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
  int currentPage;
  List<Product> data; // List of products
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Product>.from(
            json["data"].map((x) => Product.fromJson(x))), // Fixed key name
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())), // Product list
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
  List<dynamic> subImages;
  int discountPercentage;
  int isActive;
  int viewsCount;
  DateTime createdAt;
  DateTime updatedAt;
  Brand category;
  Brand brand;
  bool isFavorited;

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
    this.isFavorited = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        image: json["image"],
        subImages: json["sub_images"],
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
        "sub_images": subImages,
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

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

// // To parse this JSON data, do
// //
// //     final products = productsFromJson(jsonString);

// import 'dart:convert';

// Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// String productsToJson(Products data) => json.encode(data.toJson());

// class Products {
//     int code;
//     String message;
//     List<Product> product;

//     Products({
//         required this.code,
//         required this.message,
//         required this.product,
//     });

//     factory Products.fromJson(Map<String, dynamic> json) => Products(
//         code: json["code"],
//         message: json["message"],
        
//         product: List<Product>.from(json["Product"].map((x) => Product.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "Product": List<dynamic>.from(product.map((x) => x.toJson())),
//     };
// }

// class Product {
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
//     Brand category;
//     Brand brand;
//     bool isFavorited;

//     Product({
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
//         required this.category,
//         required this.brand,
//         this.isFavorited=false,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
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



// class Products {
//   int? code;
//   String? message;
//   List<Product>? data;

//   Products({this.code, this.message, this.data});

//   Products.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Product>[];
//       json['data'].forEach((v) {
//         data!.add(new Product.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Product {
//   int? id;
//   String? name;
//   String? price;
//   String? description;
//   int? brandId;
//   int? categoryId;
//   String? image;
//   List<String>? subImages;
//   int? discountPercentage;
//   int? isActive;
//   int? viewsCount;
//   String? createdAt;
//   String? updatedAt;
//   Category? category;
//   Category? brand;

//   Product(
//       {this.id,
//       this.name,
//       this.price,
//       this.description,
//       this.brandId,
//       this.categoryId,
//       this.image,
//       this.subImages,
//       this.discountPercentage,
//       this.isActive,
//       this.viewsCount,
//       this.createdAt,
//       this.updatedAt,
//       this.category,
//       this.brand});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     description = json['description'];
//     brandId = json['brand_id'];
//     categoryId = json['category_id'];
//     image = json['image'];
//     subImages = json['sub_images'];
//     discountPercentage = json['discount_percentage'];
//     isActive = json['isActive'];
//     viewsCount = json['views_count'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     brand = json['brand'] != null ? new Category.fromJson(json['brand']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['brand_id'] = this.brandId;
//     data['category_id'] = this.categoryId;
//     data['image'] = this.image;
//     data['sub_images'] = this.subImages;
//     data['discount_percentage'] = this.discountPercentage;
//     data['isActive'] = this.isActive;
//     data['views_count'] = this.viewsCount;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     if (this.brand != null) {
//       data['brand'] = this.brand!.toJson();
//     }
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? name;

//   Category({this.id, this.name});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }


// import 'dart:convert';

// // To parse this JSON data
// Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// String productsToJson(Products data) => json.encode(data.toJson());

// class Products {
//   int code;
//   String message;
//   Data data;

//   Products({
//     required this.code,
//     required this.message,
//     required this.data,
//   });

//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//         code: json["code"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   int currentPage;
//   List<Product> data; 
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   List<Link> links;
//   String? nextPageUrl;
//   String path;
//   int perPage;
//   String? prevPageUrl;
//   int to;
//   int total;

//   Data({
//     required this.currentPage,
//     required this.data,
//     required this.firstPageUrl,
//     required this.from,
//     required this.lastPage,
//     required this.lastPageUrl,
//     required this.links,
//     required this.nextPageUrl,
//     required this.path,
//     required this.perPage,
//     required this.prevPageUrl,
//     required this.to,
//     required this.total,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         currentPage: json["current_page"],
//         data: List<Product>.from(
//             json["data"].map((x) => Product.fromJson(x))), 
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "links": List<dynamic>.from(links.map((x) => x.toJson())),
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }

// class Product {
//   int id;
//   String name;
//   String price;
//   String description;
//   int brandId;
//   int categoryId;
//   String image;
//   List<dynamic> subImages;
//   int discountPercentage;
//   int isActive;
//   int viewsCount;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Brand category;
//   Brand brand;
//   bool isFavorited;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.brandId,
//     required this.categoryId,
//     required this.image,
//     required this.subImages,
//     required this.discountPercentage,
//     required this.isActive,
//     required this.viewsCount,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.category,
//     required this.brand,
//     this.isFavorited = false,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         description: json["description"],
//         brandId: json["brand_id"],
//         categoryId: json["category_id"],
//         image: json["image"],
//         subImages: json["sub_images"],
//         discountPercentage: json["discount_percentage"],
//         isActive: json["isActive"],
//         viewsCount: json["views_count"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         category: Brand.fromJson(json["category"]),
//         brand: Brand.fromJson(json["brand"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "description": description,
//         "brand_id": brandId,
//         "category_id": categoryId,
//         "image": image,
//         "sub_images": subImages,
//         "discount_percentage": discountPercentage,
//         "isActive": isActive,
//         "views_count": viewsCount,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "category": category.toJson(),
//         "brand": brand.toJson(),
//       };
// }

// class Brand {
//   int id;
//   String name;

//   Brand({
//     required this.id,
//     required this.name,
//   });

//   factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }

// class Link {
//   String? url;
//   String label;
//   bool active;

//   Link({
//     required this.url,
//     required this.label,
//     required this.active,
//   });

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "label": label,
//         "active": active,
//       };
// }



// // // To parse this JSON data, do
// // //
// // //     final products = productsFromJson(jsonString);

// // import 'dart:convert';

// // Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// // String productsToJson(Products data) => json.encode(data.toJson());

// // class Products {
// //     int code;
// //     String message;
// //     Data data;

// //     Products({
// //         required this.code,
// //         required this.message,
// //         required this.data,
// //     });

// //     factory Products.fromJson(Map<String, dynamic> json) => Products(
// //         code: json["code"],
// //         message: json["message"],
// //         data: Data.fromJson(json["data"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "code": code,
// //         "message": message,
// //         "data": data.toJson(),
// //     };
// // }

// // class Data {
// //     int currentPage;
// //     List<Product> data;
// //     String firstPageUrl;
// //     int from;
// //     int lastPage;
// //     String lastPageUrl;
// //     List<Link> links;
// //     String nextPageUrl;
// //     String path;
// //     int perPage;
// //     dynamic prevPageUrl;
// //     int to;
// //     int total;

// //     Data({
// //         required this.currentPage,
// //         required this.data,
// //         required this.firstPageUrl,
// //         required this.from,
// //         required this.lastPage,
// //         required this.lastPageUrl,
// //         required this.links,
// //         required this.nextPageUrl,
// //         required this.path,
// //         required this.perPage,
// //         required this.prevPageUrl,
// //         required this.to,
// //         required this.total,
// //     });

// //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         currentPage: json["current_page"],
// //         data: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
// //         firstPageUrl: json["first_page_url"],
// //         from: json["from"],
// //         lastPage: json["last_page"],
// //         lastPageUrl: json["last_page_url"],
// //         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
// //         nextPageUrl: json["next_page_url"],
// //         path: json["path"],
// //         perPage: json["per_page"],
// //         prevPageUrl: json["prev_page_url"],
// //         to: json["to"],
// //         total: json["total"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "current_page": currentPage,
// //         "product": List<dynamic>.from(data.map((x) => x.toJson())),
// //         "first_page_url": firstPageUrl,
// //         "from": from,
// //         "last_page": lastPage,
// //         "last_page_url": lastPageUrl,
// //         "links": List<dynamic>.from(links.map((x) => x.toJson())),
// //         "next_page_url": nextPageUrl,
// //         "path": path,
// //         "per_page": perPage,
// //         "prev_page_url": prevPageUrl,
// //         "to": to,
// //         "total": total,
// //     };
// // }

// // class Link {
// //     String? url;
// //     String label;
// //     bool active;

// //     Link({
// //         required this.url,
// //         required this.label,
// //         required this.active,
// //     });

// //     factory Link.fromJson(Map<String, dynamic> json) => Link(
// //         url: json["url"],
// //         label: json["label"],
// //         active: json["active"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "url": url,
// //         "label": label,
// //         "active": active,
// //     };
// // }

// // class Product {
// //     int id;
// //     String name;
// //     String price;
// //     String description;
// //     int brandId;
// //     int categoryId;
// //     String image;
// //     String subImages;
// //     int discountPercentage;
// //     int isActive;
// //     int viewsCount;
// //     DateTime createdAt;
// //     DateTime updatedAt;
// //     Brand category;
// //     Brand brand;
// //     bool isFavorited;

// //     Product({
// //         required this.id,
// //         required this.name,
// //         required this.price,
// //         required this.description,
// //         required this.brandId,
// //         required this.categoryId,
// //         required this.image,
// //         required this.subImages,
// //         required this.discountPercentage,
// //         required this.isActive,
// //         required this.viewsCount,
// //         required this.createdAt,
// //         required this.updatedAt,
// //         required this.category,
// //         required this.brand,
// //         this.isFavorited=false,
// //     });

// //     factory Product.fromJson(Map<String, dynamic> json) => Product(
// //         id: json["id"],
// //         name: json["name"],
// //         price: json["price"],
// //         description: json["description"],
// //         brandId: json["brand_id"],
// //         categoryId: json["category_id"],
// //         image: json["image"],
// //         subImages: json["sub_images"],
// //         discountPercentage: json["discount_percentage"],
// //         isActive: json["isActive"],
// //         viewsCount: json["views_count"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //         category: Brand.fromJson(json["category"]),
// //         brand: Brand.fromJson(json["brand"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "name": name,
// //         "price": price,
// //         "description": description,
// //         "brand_id": brandId,
// //         "category_id": categoryId,
// //         "image": image,
// //         "sub_images": subImages,
// //         "discount_percentage": discountPercentage,
// //         "isActive": isActive,
// //         "views_count": viewsCount,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //         "category": category.toJson(),
// //         "brand": brand.toJson(),
// //     };
// // }

// // class Brand {
// //     int id;
// //     String name;

// //     Brand({
// //         required this.id,
// //         required this.name,
// //     });

// //     factory Brand.fromJson(Map<String, dynamic> json) => Brand(
// //         id: json["id"],
// //         name: json["name"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "name": name,
// //     };
// // }


// // //llllllllllllllllllllllllllllllllllllll

// // // // To parse this JSON data, do
// // // //
// // // //     final products = productsFromJson(jsonString);

// // // import 'dart:convert';

// // // Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// // // String productsToJson(Products data) => json.encode(data.toJson());

// // // class Products {
// // //     List<Product> product;

// // //     Products({
// // //         required this.product,
// // //     });

// // //     factory Products.fromJson(Map<String, dynamic> json) => Products(
// // //         product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "product": List<dynamic>.from(product.map((x) => x.toJson())),
// // //     };
// // // }

// // // class Product {
// // //     int id;
// // //     String name;
// // //     String price;
// // //     String description;
// // //     int brandId;
// // //     int categoryId;
// // //     String image;
// // //     String subImages;
// // //     int discountPercentage;
// // //     int isActive;
// // //     int viewsCount;
// // //     DateTime createdAt;
// // //     DateTime updatedAt;
// // //     Brand category;
// // //     Brand brand;
// // //     bool isFavorited;


// // //     Product({
// // //         required this.id,
// // //         required this.name,
// // //         required this.price,
// // //         required this.description,
// // //         required this.brandId,
// // //         required this.categoryId,
// // //         required this.image,
// // //         required this.subImages,
// // //         required this.discountPercentage,
// // //         required this.isActive,
// // //         required this.viewsCount,
// // //         required this.createdAt,
// // //         required this.updatedAt,
// // //         required this.category,
// // //         required this.brand,
// // //         this.isFavorited=false,
// // //     });

// // //     factory Product.fromJson(Map<String, dynamic> json) => Product(
// // //         id: json["id"],
// // //         name: json["name"],
// // //         price: json["price"],
// // //         description: json["description"],
// // //         brandId: json["brand_id"],
// // //         categoryId: json["category_id"],
// // //         image: json["image"],
// // //         subImages: json["sub_images"],
// // //         discountPercentage: json["discount_percentage"],
// // //         isActive: json["isActive"],
// // //         viewsCount: json["views_count"],
// // //         createdAt: DateTime.parse(json["created_at"]),
// // //         updatedAt: DateTime.parse(json["updated_at"]),
// // //         category: Brand.fromJson(json["category"]),
// // //         brand: Brand.fromJson(json["brand"]),
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "name": name,
// // //         "price": price,
// // //         "description": description,
// // //         "brand_id": brandId,
// // //         "category_id": categoryId,
// // //         "image": image,
// // //         "sub_images": subImages,
// // //         "discount_percentage": discountPercentage,
// // //         "isActive": isActive,
// // //         "views_count": viewsCount,
// // //         "created_at": createdAt.toIso8601String(),
// // //         "updated_at": updatedAt.toIso8601String(),
// // //         "category": category.toJson(),
// // //         "brand": brand.toJson(),
// // //     };
// // // }

// // // class Brand {
// // //     int id;
// // //     String name;

// // //     Brand({
// // //         required this.id,
// // //         required this.name,
// // //     });

// // //     factory Brand.fromJson(Map<String, dynamic> json) => Brand(
// // //         id: json["id"],
// // //         name: json["name"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "name": name,
// // //     };
// // // }

// // //RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

// // // // To parse this JSON data, do
// // // //
// // // //     final products = productsFromJson(jsonString);

// // // import 'dart:convert';

// // // Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// // // String productsToJson(Products data) => json.encode(data.toJson());

// // // class Products {
// // //     List<Product> products;
// // //     int total;
// // //     int skip;
// // //     int limit;

// // //     Products({
// // //         required this.products,
// // //         required this.total,
// // //         required this.skip,
// // //         required this.limit,
// // //     });

// // //     factory Products.fromJson(Map<String, dynamic> json) => Products(
// // //         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
// // //         total: json["total"],
// // //         skip: json["skip"],
// // //         limit: json["limit"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "products": List<dynamic>.from(products.map((x) => x.toJson())),
// // //         "total": total,
// // //         "skip": skip,
// // //         "limit": limit,
// // //     };
// // // }

// // // class Product {
// // //     int id;
// // //     String title;
// // //     String description;
// // //     Category category;
// // //     double price;
// // //     double discountPercentage;
// // //     double rating;
// // //     int stock;
// // //     List<String> tags;
// // //     String? brand;
// // //     String sku;
// // //     int weight;
// // //     Dimensions dimensions;
// // //     String warrantyInformation;
// // //     String shippingInformation;
// // //     AvailabilityStatus availabilityStatus;
// // //     List<Review> reviews;
// // //     ReturnPolicy returnPolicy;
// // //     int minimumOrderQuantity;
// // //     Meta meta;
// // //     List<String> images;
// // //     String thumbnail;
// // //     bool isFavorited;

// // //     Product({
// // //         required this.id,
// // //         required this.title,
// // //         required this.description,
// // //         required this.category,
// // //         required this.price,
// // //         required this.discountPercentage,
// // //         required this.rating,
// // //         required this.stock,
// // //         required this.tags,
// // //         this.brand,
// // //         required this.sku,
// // //         required this.weight,
// // //         required this.dimensions,
// // //         required this.warrantyInformation,
// // //         required this.shippingInformation,
// // //         required this.availabilityStatus,
// // //         required this.reviews,
// // //         required this.returnPolicy,
// // //         required this.minimumOrderQuantity,
// // //         required this.meta,
// // //         required this.images,
// // //         required this.thumbnail,
// // //         this.isFavorited=false,
// // //     });

// // //     factory Product.fromJson(Map<String, dynamic> json) => Product(
// // //         id: json["id"],
// // //         title: json["title"],
// // //         description: json["description"],
// // //         category: categoryValues.map[json["category"]]!,
// // //         price: json["price"]?.toDouble(),
// // //         discountPercentage: json["discountPercentage"]?.toDouble(),
// // //         rating: json["rating"]?.toDouble(),
// // //         stock: json["stock"],
// // //         tags: List<String>.from(json["tags"].map((x) => x)),
// // //         brand: json["brand"],
// // //         sku: json["sku"],
// // //         weight: json["weight"],
// // //         dimensions: Dimensions.fromJson(json["dimensions"]),
// // //         warrantyInformation: json["warrantyInformation"],
// // //         shippingInformation: json["shippingInformation"],
// // //         availabilityStatus: availabilityStatusValues.map[json["availabilityStatus"]]!,
// // //         reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
// // //         returnPolicy: returnPolicyValues.map[json["returnPolicy"]]!,
// // //         minimumOrderQuantity: json["minimumOrderQuantity"],
// // //         meta: Meta.fromJson(json["meta"]),
// // //         images: List<String>.from(json["images"].map((x) => x)),
// // //         thumbnail: json["thumbnail"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "title": title,
// // //         "description": description,
// // //         "category": categoryValues.reverse[category],
// // //         "price": price,
// // //         "discountPercentage": discountPercentage,
// // //         "rating": rating,
// // //         "stock": stock,
// // //         "tags": List<dynamic>.from(tags.map((x) => x)),
// // //         "brand": brand,
// // //         "sku": sku,
// // //         "weight": weight,
// // //         "dimensions": dimensions.toJson(),
// // //         "warrantyInformation": warrantyInformation,
// // //         "shippingInformation": shippingInformation,
// // //         "availabilityStatus": availabilityStatusValues.reverse[availabilityStatus],
// // //         "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
// // //         "returnPolicy": returnPolicyValues.reverse[returnPolicy],
// // //         "minimumOrderQuantity": minimumOrderQuantity,
// // //         "meta": meta.toJson(),
// // //         "images": List<dynamic>.from(images.map((x) => x)),
// // //         "thumbnail": thumbnail,
// // //     };
// // // }

// // // enum AvailabilityStatus {
// // //     IN_STOCK,
// // //     LOW_STOCK
// // // }

// // // final availabilityStatusValues = EnumValues({
// // //     "In Stock": AvailabilityStatus.IN_STOCK,
// // //     "Low Stock": AvailabilityStatus.LOW_STOCK
// // // });

// // // enum Category {
// // //     BEAUTY,
// // //     FRAGRANCES,
// // //     FURNITURE,
// // //     GROCERIES
// // // }

// // // final categoryValues = EnumValues({
// // //     "beauty": Category.BEAUTY,
// // //     "fragrances": Category.FRAGRANCES,
// // //     "furniture": Category.FURNITURE,
// // //     "groceries": Category.GROCERIES
// // // });

// // // class Dimensions {
// // //     double width;
// // //     double height;
// // //     double depth;

// // //     Dimensions({
// // //         required this.width,
// // //         required this.height,
// // //         required this.depth,
// // //     });

// // //     factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
// // //         width: json["width"]?.toDouble(),
// // //         height: json["height"]?.toDouble(),
// // //         depth: json["depth"]?.toDouble(),
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "width": width,
// // //         "height": height,
// // //         "depth": depth,
// // //     };
// // // }

// // // class Meta {
// // //     DateTime createdAt;
// // //     DateTime updatedAt;
// // //     String barcode;
// // //     String qrCode;

// // //     Meta({
// // //         required this.createdAt,
// // //         required this.updatedAt,
// // //         required this.barcode,
// // //         required this.qrCode,
// // //     });

// // //     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
// // //         createdAt: DateTime.parse(json["createdAt"]),
// // //         updatedAt: DateTime.parse(json["updatedAt"]),
// // //         barcode: json["barcode"],
// // //         qrCode: json["qrCode"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "createdAt": createdAt.toIso8601String(),
// // //         "updatedAt": updatedAt.toIso8601String(),
// // //         "barcode": barcode,
// // //         "qrCode": qrCode,
// // //     };
// // // }

// // // enum ReturnPolicy {
// // //     NO_RETURN_POLICY,
// // //     THE_30_DAYS_RETURN_POLICY,
// // //     THE_60_DAYS_RETURN_POLICY,
// // //     THE_7_DAYS_RETURN_POLICY,
// // //     THE_90_DAYS_RETURN_POLICY
// // // }

// // // final returnPolicyValues = EnumValues({
// // //     "No return policy": ReturnPolicy.NO_RETURN_POLICY,
// // //     "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
// // //     "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
// // //     "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
// // //     "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
// // // });

// // // class Review {
// // //     int rating;
// // //     String comment;
// // //     DateTime date;
// // //     String reviewerName;
// // //     String reviewerEmail;

// // //     Review({
// // //         required this.rating,
// // //         required this.comment,
// // //         required this.date,
// // //         required this.reviewerName,
// // //         required this.reviewerEmail,
// // //     });

// // //     factory Review.fromJson(Map<String, dynamic> json) => Review(
// // //         rating: json["rating"],
// // //         comment: json["comment"],
// // //         date: DateTime.parse(json["date"]),
// // //         reviewerName: json["reviewerName"],
// // //         reviewerEmail: json["reviewerEmail"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "rating": rating,
// // //         "comment": comment,
// // //         "date": date.toIso8601String(),
// // //         "reviewerName": reviewerName,
// // //         "reviewerEmail": reviewerEmail,
// // //     };
// // // }

// // // class EnumValues<T> {
// // //     Map<String, T> map;
// // //     late Map<T, String> reverseMap;

// // //     EnumValues(this.map);

// // //     Map<T, String> get reverse {
// // //             reverseMap = map.map((k, v) => MapEntry(v, k));
// // //             return reverseMap;
// // //     }
// // // }
