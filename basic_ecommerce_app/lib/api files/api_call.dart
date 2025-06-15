import 'dart:convert';
// import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/gadgets_model.dart';
import 'package:http/http.dart' as http;

class GadgetsApi {
  final String phonesUrl =
      'https://dummyjson.com/products/category/smartphones';
  final String laptopsUrl = "https://dummyjson.com/products/search?q=laptop";

  Future<List<GadgetsModel>> fetchApiResponse() async {
    final phoneResponse = await http.get(Uri.parse(phonesUrl));
    final laptopResponse = await http.get(Uri.parse(laptopsUrl));

    if (phoneResponse.statusCode == 200 && laptopResponse.statusCode == 200) {
      final phoneDecode = json.decode(phoneResponse.body);
      final lapDecode = json.decode(laptopResponse.body);

      final phoneData = (phoneDecode['products'] as List).map(
        (json) => GadgetsModel.fromJson(json),
      );

      final laptopData = (lapDecode['products'] as List).map(
        (json) => GadgetsModel.fromJson(json),
      );

      final mergedList = [...phoneData, ...laptopData];

      // log('response -- ${jsonDecode(response.body)}');
      return mergedList;
    } else {
      throw Exception('Exception status code -- ${phoneResponse.statusCode}');
    }
  }
}
