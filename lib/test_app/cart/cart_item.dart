class CartItem {
  final String name;

  int quantity;

  CartItem({
    required this.name,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
      
        'quantity': quantity,
      };

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}

// import 'package:al_najah_store/models/shop/product.dart';

// class CartItem {
//   final Product product;
 
//   int quantity;

//   CartItem({
//     required this.product,
//     this.quantity = 1,
//   });

//   Map<String, dynamic> toJson() => {
//         'product': product,
//         'quantity': quantity,
//       };

//   static CartItem fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       product: json['product'],
//       quantity: json['quantity'],
//     );
//   }
// }
