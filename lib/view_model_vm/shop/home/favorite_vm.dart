import 'package:flutter/material.dart';
import 'package:al_najah_store/models/shop/product.dart';

class FavoritesVM with ChangeNotifier {

  final List<Product> _favoriteProducts = []; 

  List<Product> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(Product product) {
    if (product.isFavorited) {
      _favoriteProducts.remove(product); 
      product.isFavorited = false; 
    } else {
      _favoriteProducts.add(product); 
      
      product.isFavorited = true; 
    }
    notifyListeners(); 
  }

  bool isProductFavorited(Product product) {
    return _favoriteProducts.contains(product); 
  }
}

