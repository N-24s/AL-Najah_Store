import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/test_app/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class vmPro extends ChangeNotifier{


    Map<String, CartItem> _items = {};
  final storage = GetStorage();

  vmPro() {
    print("KKKKKKKKKKKKKKKKKKKKKK");
    loadCart();
  }

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  // double get totalAmount {
  //   return _items.values.fold(
  //     0.0,
  //     (previousValue, item) => previousValue + item.price * item.quantity,
  //   );
  // }

  // Add product to the cart
  void addProductToCart(String name) {
  

  if (_items.containsKey(name)) {
    // Update existing product in cart
    _items.update(
      name,
      (existingItem) => CartItem(
        name: existingItem.name,
  
        quantity: existingItem.quantity + 1,
      ),
    );
  } else {
    // Add new product
    _items.putIfAbsent(
      name,
      () => CartItem(
        name: name,
      
      ),
    );
  }
  saveCart();
  notifyListeners();
}

  // void addProductToCart(Product product) {
  //   if (_items.containsKey(product.id)) {
  //     // Update quantity
  //     _items.update(
  //       product.id.toString(),
  //       (existingItem) => CartItem(
  //         id: existingItem.id,
  //         name: existingItem.name,
  //         price: existingItem.price,
  //         imageUrl: existingItem.imageUrl,
  //         quantity: existingItem.quantity + 1,
  //       ),
  //     );
  //   } else {
  //     // Add new product
  //     _items.putIfAbsent(
  //       product.id.toString(),
  //       () => CartItem(
  //         id: product.id.toString(),
  //         name: product.title,
  //         price: product.price,
  //         imageUrl: product.images[0],
  //       ),
  //     );
  //   }
  //   saveCart();
  //   notifyListeners();
  // }

  // Decrement product quantity
  void decrementProductQuantity(String title) {
    if (_items.containsKey(title)) {
      final currentQuantity = _items[title]!.quantity;
      if (currentQuantity > 1) {
        _items.update(
          title,
          (existingItem) => CartItem(
            name: existingItem.name,
   
            quantity: existingItem.quantity - 1,
          ),
        );
        saveCart();
        notifyListeners();
      }
    }
  }

  // Remove product from cart
  void removeProductFromCart(String title) {
    _items.remove(title);
    saveCart();
    notifyListeners();
  }

  // Get product from cart
  CartItem? getProduct(String title) {
    return _items[title];
  }

  // Save cart to local storage
  void saveCart() {
    final cartData = _items.values.map((item) => item.toJson()).toList();
    storage.write('cart', cartData);
  }

  // Load cart from local storage
  void loadCart() {
    
    final cartData = storage.read<List<dynamic>>('cart') ?? [];
    if(cartData.isNotEmpty)
    _items = {for (var item in cartData) CartItem.fromJson(item).name: CartItem.fromJson(item)};

    notifyListeners();
  }
  }

//    int num=0;
//    List<Map<String,dynamic>> cartName=[];


//  incrm(){
//   num++;
//     notifyListeners();

//  }
//  decrm(){
//   num--;
//     notifyListeners();

//  }
//  addToCart(String name){
//   print(name);
//   cartName.add({name:num});
//   num=0;
//   notifyListeners();

//  }
