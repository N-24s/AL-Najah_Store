
class CartItem {
  final String id;
  final String? name;
  final double price;
  final String? imageUrl;
  int quantity;

  CartItem({
    required this.id,
     this.name,
     this.price=0.0,
     this.imageUrl,
    required this.quantity,
  });
static CartItem empty()=> CartItem(id: '', quantity: 0);
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'quantity': quantity,
      };

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toDouble(),
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
    );
  }
}
