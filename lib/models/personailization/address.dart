class Address {
  String name;
  String city;
  String phone;

  Address.empty()
      : name = '',
        city = '',
        phone = '';

  Address({
    required this.name,
    required this.city,
    required this.phone,
  });

  // Factory constructor to create an Address from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      city: json['city'],
      phone: json['phone'],
    );
  }

  // Method to convert an Address instance into JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'phone': phone,
    };
  }
}
