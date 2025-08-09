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
      "https://feature-cart-items-api.onrender.com/api/v1/cartItems/";

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
        "https://feature-cart-items-api.onrender.com/api/v1/cartItems/";

    final cartResponse = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (cartResponse.statusCode == 200) {
      final values = CartItemsModel.fromJson(jsonDecode(cartResponse.body));
      log('printing mapped model ${cartResponse.body}');
      return values;
    } else {
      throw Exception('Something went wrong ${cartResponse.statusCode}');
    }
  }
}

class AddCartItem {
  final addUrl =
      "https://feature-cart-items-api.onrender.com/api/v1/cartItems/";

  Future<CartProducts> addItem({
    required CartProducts product,
    required String action,
  }) async {
    final header = await getHeaders();
    final requestBody = {...product.toJson(), 'action': action};
    try {
      log('printing request ${json.encode(requestBody)}');
      final respone = await http.post(
        Uri.parse(addUrl),
        headers: header,
        body: json.encode(requestBody),
      );
      if (respone.statusCode == 201 || respone.statusCode == 200) {
        log('Product added successfully..${respone.body}');
        return CartProducts.fromJson(jsonDecode(respone.body));
      } else if (respone.statusCode == 202) {
        log('Product removed successfully..${respone.body}');
        return CartProducts.fromJson(jsonDecode(respone.body));
      } else {
        throw Exception('Thrown exception..${respone.body}');
      }

      // return true;
    } catch (e) {
      throw Exception('Error in adding data ${e}');
      // log('exception ${e}');
      // return false;
    }
  }
}
