class ShoppingItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final DateTime addedAt;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.addedAt,
  });

  double get total => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'] ?? 1,
      addedAt: DateTime.parse(json['addedAt']),
    );
  }
}
