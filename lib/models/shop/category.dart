class CategoryModel {
  final int id;
  final String name;
  final String? image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isActive: json['isActive'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isActive': isActive ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}



// import 'dart:convert';

// Categories productsFromJson(String str) => Categories.fromJson(json.decode(str));

// String productsToJson(Categories data) => json.encode(data.toJson());
// class Categories {
//   int? code;
//   String? message;
//   List<Category>? category;

//   Categories({this.code, this.message, this.category});

//   Categories.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     if (json['Category'] != null) {
//       category = <Category>[];
//       json['Category'].forEach((v) {
//         category!.add( Category.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.category != null) {
//       data['Category'] = this.category!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? name;
//   Null? image;
//   int? isActive;
//   String? createdAt;
//   String? updatedAt;

//   Category(
//       {this.id,
//       this.name,
//       this.image,
//       this.isActive,
//       this.createdAt,
//       this.updatedAt});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     isActive = json['isActive'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['isActive'] = this.isActive;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
