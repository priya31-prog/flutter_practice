import 'package:basic_ecommerce_app/api%20files/models/gadgets_model.dart';
import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDataLoaded = StateProvider<bool>((ref) => true);

final gadgetsList = StateProvider<GadgetsModel>(
  (ref) => GadgetsModel(products: []),
);

final brandsList = StateProvider<List<String>>((ref) => []);
final productsList = StateProvider<List<Products>>((ref) => []);

final isCredEntered = StateProvider<bool>((ref) => false);
final email = StateProvider<String>((ref) => '');
final phone = StateProvider<String>((ref) => '');

//product details screen
final isAlreadyAddedToCart = StateProvider<bool>((ref) => false);

//add to cart
final isLoadingCartItems = StateProvider<bool>((ref) => true);
