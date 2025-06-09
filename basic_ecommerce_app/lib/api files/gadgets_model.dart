import 'package:basic_ecommerce_app/api%20files/products_model.dart';

class GadgetsModel {
  final String status;
  final String message;
  final Products products;

  GadgetsModel({
    required this.status,
    required this.message,
    required this.products,
  });

  factory GadgetsModel.fromJson(Map<String, dynamic> json) {
    return GadgetsModel(
      status: json['status'],
      message: json['message'],
      products: json['products'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'products': products};
  }
}
