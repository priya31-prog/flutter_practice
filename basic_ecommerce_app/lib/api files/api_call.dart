import 'dart:convert';
// import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/gadgets_model.dart';
import 'package:http/http.dart' as http;

class GadgetsApi {
  final String url = 'https://fakestoreapi.in/api/products';

  Future<GadgetsModel> fetchApiResponse() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // log('response -- ${jsonDecode(response.body)}');
      return GadgetsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Exception status code -- ${response.statusCode}');
    }
  }
}
