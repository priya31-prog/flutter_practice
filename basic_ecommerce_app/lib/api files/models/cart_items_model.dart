import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';

class CartItemsModel {
  final String status;
  final int statusCode;
  final List<CartProducts>? cartProducts;
  CartItemsModel({
    required this.status,
    required this.statusCode,
    this.cartProducts,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) {
    return CartItemsModel(
      status: json['status'],
      statusCode: json['success_code'],
      cartProducts:
          (json['data'] as List?)
              ?.map((item) => CartProducts.fromJson(item))
              .toList(),
    );
  }
}

//  (json['data'] as List?)
//           ?.map((item) => CartItem.fromJson(item))
//           .toList(),
