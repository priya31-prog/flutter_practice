class OrderHistoryModel {
  final int? id;
  final int? productId;
  final String? name;
  final DateTime? orderDate;
  final String? price;
  final String? brand;
  final DateTime? shippingInfo;
  final String? warrentyInfo;
  final String? imageUrl;
  final int? quantity;
  final String? message;

  OrderHistoryModel({
    this.id,
    this.brand,
    this.imageUrl,
    this.message,
    this.name,
    this.orderDate,
    this.price,
    this.productId,
    this.quantity,
    this.shippingInfo,
    this.warrentyInfo,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      message: json['message'] ?? '',
      name: json['name'] ?? '',
      orderDate:
          json['orderDate'] != null
              ? DateTime.tryParse(json['orderDate'])
              : null,
      price: json['price'] ?? '',
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
      shippingInfo:
          json['shippingInfo'] != null
              ? DateTime.tryParse(json['shippingInfo'])
              : null,
      warrentyInfo: json['warrentyInfo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'imageUrl': imageUrl,
      'message': message,
      'name': name,
      'orderDate': orderDate?.toIso8601String(),
      'price': price,
      'productId': productId,
      'quantity': quantity,
      'shippingInfo': shippingInfo?.toIso8601String(),
      'warrentyInfo': warrentyInfo,
    };
  }
}
