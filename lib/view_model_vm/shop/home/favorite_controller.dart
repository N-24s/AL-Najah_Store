import 'package:flutter/material.dart';
import 'package:al_najah_store/models/shop/product.dart';

class FavoritesProvider with ChangeNotifier {
  List<Product> _favoriteProducts = []; // List of favorite products

  List<Product> get favoriteProducts => _favoriteProducts; // Expose the list to UI

  void toggleFavorite(Product product) {
    if (product.isFavorited) {
      _favoriteProducts.remove(product); // Remove from favorites
      product.isFavorited = false; // Update product state
    } else {
      _favoriteProducts.add(product); // Add to favorites
      product.isFavorited = true; // Update product state
    }
    notifyListeners(); // Notify UI about changes
  }

  bool isProductFavorited(Product product) {
    return _favoriteProducts.contains(product); // Check if product is in favorites
  }
}



// import 'package:get/get.dart';
// import 'package:al_najah_store/models/shop/product.dart';

// class FavoritesController extends GetxController {
// static FavoritesController get instance => Get.put<FavoritesController>(FavoritesController()); 


//   var favoriteProducts = <Product>[].obs; // Observable list of favorite products

//   void toggleFavorite(Product product) {
//     if (product.isFavorited) {
//       favoriteProducts.remove(product); // Remove from favorites
//       product.isFavorited = false; // Update product state
//     } else {
//       favoriteProducts.add(product); // Add to favorites
//       product.isFavorited = true; // Update product state
//     }
//     update(); // Notify listeners about the change
//   }

//   bool isProductFavorited(Product product) {
//     return favoriteProducts.contains(product); // Check if product is favorited
//   }
// }
