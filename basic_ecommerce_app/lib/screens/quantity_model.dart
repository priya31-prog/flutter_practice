class QuantityModel {
  final int id;
  final int quantity;

  QuantityModel({required this.id, required this.quantity});

  factory QuantityModel.fromJson(Map<String, dynamic> json) {
    return QuantityModel(id: json['id'], quantity: json['quantity']);
  }

  QuantityModel copyWith({int? quantity}) {
    return QuantityModel(id: id, quantity: quantity ?? this.quantity);
  }
}
