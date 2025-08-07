import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/notifiers.dart';

class CartNotifier extends StateNotifier<AsyncValue<List<CartProducts>>> {
  CartNotifier() : super(const AsyncValue.loading()) {
    loadCartItems();
  }

  // API 1: Load all cart products
  Future<void> loadCartItems() async {
    try {
      final items = await GadgetsApi().getCartItems();
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

  double get totalCartValue {
    final cart = state.valueOrNull ?? [];
    return cart.fold(0.0, (sum, item) {
      final itemPrice = double.tryParse(item.price ?? '') ?? 0.0;
      final price = itemPrice * (item.quantity ?? 1);
      return sum + price;
    });
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartProducts>>>(
      (ref) => CartNotifier(),
    );

final totalCartValueProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartProvider);

  return cartState.when(
    data: (items) {
      return items.fold(0.0, (sum, item) {
        final itemPrice = double.tryParse(item.price ?? '') ?? 0.0;
        final price = itemPrice * (item.quantity ?? 1);
        return sum + price;
      });
    },
    error: (_, __) => 0.0,
    loading: () => 0.0,
  );
});
