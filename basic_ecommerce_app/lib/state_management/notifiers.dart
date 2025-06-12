import 'package:basic_ecommerce_app/api%20files/gadgets_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDataLoaded = StateProvider<bool>((ref) => true);

final gadgetsList = StateProvider<GadgetsModel>(
  (ref) => GadgetsModel(status: 'error', message: '', products: []),
);

final brandsList = StateProvider<List<String>>((ref) => []);
final isCredEntered = StateProvider<bool>((ref) => false);
final email = StateProvider<String>((ref) => '');
final phone = StateProvider<String>((ref) => '');
