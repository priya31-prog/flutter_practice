import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartProducts>> {
  CartNotifier() : super([]);

  // API 1: Load all cart products
  Future<void> loadCartItems() async {
    final items = await GadgetsApi().getCartItems();
    state = items.cartProducts ?? [];
  }

  // API 2: Add/increment item and update only the changed item in UI
  Future<void> addCartItem(CartProducts itemToAdd) async {
    final updatedItem = await AddCartItem().addItem(product: itemToAdd);

    final index = state.indexWhere((e) => e.productId == updatedItem.productId);

    if (index != -1) {
      // Replace only that item with updated quantity
      final updatedList = [...state];
      updatedList[index] = updatedItem;
      state = List<CartProducts>.from(updatedList);
    } else {
      // First time item added
      state = [...state, updatedItem];
    }
    print("✅ state updated: ${state.map((e) => e.quantity)}");
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartProducts>>(
  (ref) => CartNotifier(),
);
