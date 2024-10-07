import 'package:get/get.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class FavoritesVM extends GetxController {

  static FavoritesVM get instance=>Get.find<FavoritesVM>();
  
  final RxList<Product> favoriteProducts = <Product>[].obs;
  final GetStorage _storage = GetStorage();

  // Constructor to load saved favorites from storage
  @override
  void onInit() {
    super.onInit();
    List<dynamic>? storedFavorites = _storage.read<List<dynamic>>('favorites');
    if (storedFavorites != null) {
      favoriteProducts.assignAll(storedFavorites.map((json) => Product.fromJson(json)).toList());
    }
  }

  // Method to toggle favorites
  void toggleFavorite(Product product) {
    if (isProductFavorited(product)) {
      favoriteProducts.remove(product);
      // _storage.write('favorites', favoriteProducts.map((p) => p.toJson()).toList());
    } else {
      favoriteProducts.add(product);
      _storage.write('favorites', favoriteProducts.map((p) => p.toJson()).toList());
    }
  }

  // Check if the product is in favorites
  bool isProductFavorited(Product product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }
}


// import 'package:flutter/material.dart';
// import 'package:al_najah_store/models/shop/product.dart';

// class FavoritesVM with ChangeNotifier {

//   final List<Product> _favoriteProducts = []; 

//   List<Product> get favoriteProducts => _favoriteProducts;

//   void toggleFavorite(Product product) {
//     if (product.isFavorited) {
//       _favoriteProducts.remove(product); 
//       product.isFavorited = false; 
//     } else {
//       _favoriteProducts.add(product); 
      
//       product.isFavorited = true; 
//     }
//     notifyListeners(); 
//   }

//   bool isProductFavorited(Product product) {
//     return _favoriteProducts.contains(product); 
//   }
// }

