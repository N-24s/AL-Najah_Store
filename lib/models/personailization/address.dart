class Address {
  String name;
  String address;
  String phone;
  bool selectedAddress;

  Address.empty()
      : name = '',
        address = '',
        phone = '',
        selectedAddress=false;

  Address({
    this.selectedAddress=false,
    required this.name,
    required this.address,
    required this.phone,
  });

  // Factory constructor to create an Address from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  // Method to convert an Address instance into JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
    };
  }
}
