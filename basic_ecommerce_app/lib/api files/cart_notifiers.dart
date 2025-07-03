import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<AsyncValue<List<CartProducts>>> {
  CartNotifier() : super(const AsyncValue.loading()) {
    loadCartItems();
  }

  // API 1: Load all cart products
  Future<void> loadCartItems() async {
    log('printing inside cart itesm');
    try {
      final items =
          await GadgetsApi().getCartItems(); // Your API for GET /cart/items
      state = AsyncValue.data(items.cartProducts!);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> incrementItem(CartProducts products) async {
    final response = await AddCartItem().addItem(
      product: products,
      action: 'increment',
    );
    if (response.productId != null) {
      await loadCartItems(); // re-fetch updated list
    }
  }

  Future<void> decrementItem(CartProducts products) async {
    final response = await AddCartItem().addItem(
      product: products,
      action: 'decrement',
    );
    if (response.productId != null) {
      await loadCartItems(); // re-fetch updated list
    }
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartProducts>>>(
      (ref) => CartNotifier(),
    );
