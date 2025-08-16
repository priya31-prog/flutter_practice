import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';

class GadgetsModel {
  // final String status;
  // final String message;
  final List<Products> products;

  GadgetsModel({required this.products});

  factory GadgetsModel.fromJson(Map<String, dynamic> json) {
    return GadgetsModel(
      products:
          (json['products'] as List<dynamic>)
              .map((e) => Products.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'products': products.map((e) => e.toJson()).toList()};
  }
}
