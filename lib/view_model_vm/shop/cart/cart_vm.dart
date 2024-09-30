import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var items = <String, CartItem>{}.obs;  // Observable map for items
  final storage = GetStorage();
  var qty = 0.obs;  // Observable quantity

  @override
  void onInit() {
    super.onInit();
    loadCart();  // Load cart on initialization
  }

  // Map<String, CartItem> get items => _items;

  int get itemCount => items.length;

  // Increment quantity
  void incrementQty() {
    qty.value++;
  }

  // Decrement quantity
  void decrementQty() {
    if (qty > 0) {
      qty.value--;
    }
  }

  // Add product to the cart
  void addProductToCart(Product product, int qty) {
    if (product.id == null || product.name == null) {
      throw Exception('Product ID or Name is missing');
    }

    if (items.containsKey(product.id.toString())) {
      items.update(
        product.id!.toString(),
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          imageUrl: existingItem.imageUrl,
          price: existingItem.price,
          quantity: qty,
        ),
      );
    } else {
      // Add new product
      items.putIfAbsent(
        product.id.toString(),
        () => CartItem(
          id: product.id.toString(),
          name: product.name!,
          imageUrl: product.image,
          price: double.parse(product.price),
          quantity: qty,
        ),
      );
    }
    saveCart();  // Save cart to storage
  }

  // Remove product from cart
  void removeProductFromCart(String productId) {
    items.remove(productId);
    saveCart();  // Save cart after removing
  }

  // Get product from cart
  CartItem? getProduct(String productId) {
    return items[productId];
  }

  // Save cart to local storage
  void saveCart() {
    final cartData = items.values.map((item) => item.toJson()).toList();
    storage.write('cart', cartData);
  }

  // Load cart from local storage
  void loadCart() {
    final cartData = storage.read<List<dynamic>>('cart') ?? [];
    items.assignAll({
      for (var item in cartData) CartItem.fromJson(item).id: CartItem.fromJson(item)
    });
  }
}


// import 'package:al_najah_store/app.dart';
// import 'package:al_najah_store/models/shop/cart/cart_item.dart';
// import 'package:al_najah_store/models/shop/product.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

// class CartProvider with ChangeNotifier {
//   Map<String, CartItem> _items = {};
//   final storage = GetStorage();

//   CartProvider() {
//     print("KKKKKKKKKKKKKKKKKKKKKK");
//     loadCart();
//   }

//   Map<String, CartItem> get items => _items;

//   int get itemCount => _items.length;
//   int qty=0;

//   // double get totalAmount {
//   //   return _items.values.fold(
//   //     0.0,
//   //     (previousValue, item) => previousValue + item.price * item.quantity,
//   //   );
//   // }

//    icrementQty(){
//    qty++;
//   notifyListeners();
// }
// derementQty(){
//   qty--;
//   notifyListeners();
// }

//   // Add product to the cart
//   void addProductToCart(Product product,int qty) {
//   if (product.id == null || product.name == null) {
//     throw Exception('Product ID or Name is missing'); 
//   }


 


//   if (_items.containsKey(product.id.toString())) {
//     print("cccc");
//     _items.update(
      
//       product.id!.toString(),
//       (existingItem) => CartItem(
        
//         id: existingItem.id,
//         name: existingItem.name,
//         imageUrl: existingItem.imageUrl,
//         price: existingItem.price,
//             quantity: qty,

//       ),
//     );
//   }
//    else {
//     // Add new product
//     _items.putIfAbsent(
//       product.id.toString(),
//       () => CartItem(
//         id: product.id.toString(),
//         name: product.name!,
//           imageUrl: product.image,
//         price: double.parse(product.price),
//         quantity: qty

    
//       ),
//     );
//   }
//   saveCart();
//   notifyListeners();
// }

//   // void addProductToCart(Product product) {
//   //   if (_items.containsKey(product.id)) {
//   //     // Update quantity
//   //     _items.update(
//   //       product.id.toString(),
//   //       (existingItem) => CartItem(
//   //         id: existingItem.id,
//   //         name: existingItem.name,
//   //         price: existingItem.price,
//   //         imageUrl: existingItem.imageUrl,
//   //         quantity: existingItem.quantity + 1,
//   //       ),
//   //     );
//   //   } else {
//   //     // Add new product
//   //     _items.putIfAbsent(
//   //       product.id.toString(),
//   //       () => CartItem(
//   //         id: product.id.toString(),
//   //         name: product.title,
//   //         price: product.price,
//   //         imageUrl: product.images[0],
//   //       ),
//   //     );
//   //   }
//   //   saveCart();
//   //   notifyListeners();
//   // }

//   // // Decrement product quantity
//   // void decrementProductQuantity(String product_id) {
//   //   if (_items.containsKey(product_id)) {
//   //     final currentQuantity = _items[product_id]!.quantity;
//   //     if (currentQuantity > 1) {
//   //       _items.update(
//   //         product_id,
//   //         (existingItem) => CartItem(
//   //           id: existingItem.id,
//   //           name: existingItem.name,
//   //             imageUrl: existingItem.imageUrl,
//   //       price: existingItem.price,
//   //           quantity: existingItem.quantity - qty,
//   //         ),
//   //       );
//   //       saveCart();
//   //       notifyListeners();
//   //     }
//   //   }
//   // }

//   // Remove product from cart
//   void removeProductFromCart(String productId) {
//     _items.remove(productId);
//     saveCart();
//     notifyListeners();
//   }

//   // Get product from cart
//   CartItem? getProduct(String productId ){
//     return _items[productId];
//   }

//   // Save cart to local storage
//   void saveCart() {
//     final cartData = _items.values.map((item) => item.toJson()).toList();
//     storage.write('cart', cartData);
//   }


//   void loadCart() {
//     final cartData = storage.read<List<dynamic>>('cart') ?? [];
//     _items = {for (var item in cartData) CartItem.fromJson(item).id: CartItem.fromJson(item)};
//     notifyListeners();
//   }
//   }
// //LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
// import 'package:al_najah_store/models/shop/cart/cart_item.dart';
// import 'package:al_najah_store/models/shop/product.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

// class CartProvider with ChangeNotifier {
//   final Map<String, dynamic> _items = {};
//   final storage = GetStorage();

//   CartProvider() {
//     loadCart();
//   }

//   Map<String, dynamic> get items => _items;

//   int get itemCount => _items.length;

//   // double get totalAmount {
//   //   return _items.values
//   //       .fold(0.0, (previousValue, item) => previousValue + item.price * item.quantity);
//   // }

//   void addItem(Product product) {
//     if (_items.containsKey(product)) {
//       // Update quantity
//       _items.update(
//         product.id.toString(),
//         (existingCartItem) => CartItem(
//           product: existingCartItem.product,
       
//           quantity: existingCartItem.quantity + 1,
//         ),
//       );
//     } else {
//       // Add new product
//       _items.putIfAbsent(
//         product.id.toString(),
//         () => CartItem(
//           product: product,
        
//         ),
//       );
//     }
//     saveCart();
//     notifyListeners();
//   }

//   void updateQuantity(int product, int newQuantity) {
//     if (_items.containsKey(product)) {
//       if (newQuantity > 0) {
//         _items.update(
//           product.toString(),
//           (existingItem) => CartItem(
//             product: existingItem.product,
          
//             quantity: newQuantity,
//           ),
//         );
//       } else {
//         removeItem(product.toString());
//       }
//       saveCart();
//       notifyListeners();
//     }
//   }

//   void removeItem(String title) {
//     _items.remove(title);
//     saveCart();
//     notifyListeners();
//   }

//   void saveCart() {
//     final cartData = _items.values.map((item) => item.toJson()).toList();
//     storage.write('cart', cartData);
//   }

//   void loadCart() {
//     final List<dynamic> cartData = storage.read<List<dynamic>>('cart') ?? [];
//     _items.clear();
//     cartData.forEach((item) {
//       final cartItem = CartItem.fromJson(item);
//       _items.putIfAbsent(cartItem.product.id.toString(), () => cartItem);
//     });
//     notifyListeners();
//   }
// }
