class CartProducts {
  final int? id;
  final int? productId;
  final String? name;
  final String? price;
  final String? discountPercent;
  final int? stock;
  final String? brand;
  final DateTime? addedToCartAt;
  final DateTime? shippingInfo;
  final String? warrentyInfo;
  final bool? isAvailable;
  final String? imageUrl;
  final int? quantity;
  final String? message;

  CartProducts({
    this.addedToCartAt,
    this.brand,
    this.name,
    this.discountPercent,
    this.id,
    this.isAvailable,
    this.price,
    this.productId,
    this.shippingInfo,
    this.stock,
    this.warrentyInfo,
    this.imageUrl,
    this.quantity,
    this.message,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      name: json['product_name'] ?? '',
      price: json['product_price'] ?? '0',
      discountPercent: json['discount_percent'] ?? '0',
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      addedToCartAt:
          json['added_cart_at'] != null
              ? DateTime.tryParse(json['added_cart_at'])
              : null,
      shippingInfo:
          json['shipping_info'] != null
              ? DateTime.tryParse(json['shipping_info'])
              : null,
      warrentyInfo: json['warrenty_info'] ?? '',
      isAvailable: json['is_available'] ?? false,
      imageUrl: json['image_url'] ?? '',
      quantity: json['quantity'],
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "product_name": name ?? '',
      "product_price": price ?? '',
      "discount_percent": discountPercent,
      "stock": stock,
      "brand": brand,
      "added_cart_at": addedToCartAt?.toIso8601String(),
      "shipping_info": shippingInfo?.toIso8601String(),
      "warrenty_info": warrentyInfo,
      "is_available": isAvailable ?? false,
      "image_url": imageUrl ?? '',
      "message": message ?? '',
    };
  }
}
