import 'dart:convert';
import 'dart:developer';
// import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/cart_items_model.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/api%20files/models/gadgets_model.dart';
import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/common_files/api_header.dart';
import 'package:http/http.dart' as http;

class GadgetsApi {
  final String phonesUrl =
      'https://dummyjson.com/products/category/smartphones';
  final String laptopsUrl = "https://dummyjson.com/products/search?q=laptop";
  final String cartItemsUrl =
      "https://feature-cart-items-api.onrender.com/api/v1/cartItems";

  Future<GadgetsModel> fetchApiResponse() async {
    final phoneResponse = await http.get(Uri.parse(phonesUrl));
    // log('cart json api response ${json.decode(phoneResponse.body)}');s
    final laptopResponse = await http.get(Uri.parse(laptopsUrl));

    if (phoneResponse.statusCode == 200 && laptopResponse.statusCode == 200) {
      final phoneDecode = json.decode(phoneResponse.body);
      final lapDecode = json.decode(laptopResponse.body);

      final phoneData = (phoneDecode['products'] as List).map(
        (json) => Products.fromJson(json),
      );

      final laptopData = (lapDecode['products'] as List).map(
        (json) => Products.fromJson(json),
      );

      final mergedList = [...phoneData, ...laptopData];

      // log('response -- ${jsonDecode(response.body)}');
      return GadgetsModel(products: mergedList);
    } else {
      throw Exception('Exception status code -- ${phoneResponse.statusCode}');
    }
  }

  Future<CartItemsModel> getCartItems() async {
    final String url =
        "https://feature-cart-items-api.onrender.com/api/v1/cartItems";

    final cartResponse = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (cartResponse.statusCode == 200) {
      final values = CartItemsModel.fromJson(jsonDecode(cartResponse.body));
      log('printing mapped model ${values.cartProducts![0].brand}');
      return values;
    } else {
      throw Exception('Something went wrong ${cartResponse.statusCode}');
    }
  }
}

class AddCartItem {
  final addUrl = "https://feature-cart-items-api.onrender.com/api/v1/cartItems";

  Future<bool> addItem({required CartProducts product}) async {
    final header = await getHeaders();
    try {
      log(
        'printing request ${CartProducts(addedToCartAt: product.addedToCartAt, name: product.name, price: product.price, imageUrl: product.imageUrl, productId: product.productId, discountPercent: product.discountPercent, shippingInfo: product.shippingInfo, stock: product.stock, brand: product.brand, warrentyInfo: product.warrentyInfo, isAvailable: product.isAvailable).toJson()}',
      );
      final respone = await http.post(
        Uri.parse(addUrl),
        headers: header,
        body: json.encode(product.toJson()),
      );
      if (respone.statusCode == 201) {
        log('Product added successfully..');
        return true;
      } else {
        log('response ${respone.statusCode}');
        log('response ${respone.body}');
        return true;
      }

      // return true;
    } catch (e) {
      Exception('Error in adding data ${e}');
      log('exception ${e}');
      return false;
    }
  }
}
