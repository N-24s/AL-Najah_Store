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

 Product.empty()
      : id = 0,
        name = '',
        price = '',
        description = '',
        brandId = 0,
        categoryId = 0,
        image = '',
        subImages = [],
        discountPercentage = 0,
        isActive = 0,
        viewsCount = 0,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        category = Brand.empty(),
        brand = Brand.empty(),
        isFavorited = false;

  
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
  String? logo;
 
  

  Brand({
    required this.id,
    required this.name,
     this.logo,
  });
    Brand.empty()
      : id = 0,
        name = '';

     
   

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"], 
        logo: json['logo'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo":logo
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

