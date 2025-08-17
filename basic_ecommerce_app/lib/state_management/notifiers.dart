import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/api%20files/models/gadgets_model.dart';
import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDataLoaded = StateProvider<bool>((ref) => true);

final gadgetsList = StateProvider<GadgetsModel>(
  (ref) => GadgetsModel(products: []),
);

//home screen
final brandsList = StateProvider<List<String>>((ref) => []);
final productsList = StateProvider<List<Products>>((ref) => []);
final searchedProducts = StateProvider<List<Products>>((ref) => []);

final isCredEntered = StateProvider<bool>((ref) => false);
final email = StateProvider<String>((ref) => '');
final phone = StateProvider<String>((ref) => '');

//product details screen
final isAlreadyAddedToCart = StateProvider<bool>((ref) => false);
final allProducts = StateProvider<List<CartProducts>>((ref) => []);

//add to cart
final isLoadingCartItems = StateProvider<bool>((ref) => true);
// final totalCartValue = StateProvider<double>((ref) => 0.0);
final itemQuantity = StateProvider<int>((ref) => 0);
final loaderToOperate = StateProvider<Map<int, bool>>((ref) => {});
