// import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandedProductsNotifier extends Notifier<List<Products>> {
  @override
  List<Products> build() {
    return const [];
  }

  void filterBrand(String brandTapped, List<Products> products) {
    state = products
        .where(
          (element) => element.brand.toLowerCase() == brandTapped.toLowerCase(),
        )
        .toList(growable: false);

    // ref.read(searchBasedOnBrand.notifier).state = AsyncValue.data(resultBrand);

    // log('printing resulted brands  - ${state}');
  }

  void clear() => state = [];
}

final brandFilterNotifier =
    NotifierProvider<BrandedProductsNotifier, List<Products>>(
      BrandedProductsNotifier.new,
    );
