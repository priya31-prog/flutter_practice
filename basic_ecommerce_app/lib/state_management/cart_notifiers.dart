import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<AsyncValue<List<CartProducts>>> {
  CartNotifier() : super(const AsyncValue.loading()) {
    loadCartItems();
  }

  double? _lastTotal;
  List<CartProducts>? _lastCachedProducts;

  // API 1: Load all cart products
  Future<void> loadCartItems() async {
    try {
      final items = await GadgetsApi().getCartItems();
      state = AsyncValue.data(items.cartProducts!);
      invalidateCache();
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

  Future<void> deleteItem() async {
    final response = await AddCartItem().deleteItem(action: 'delete');

    if (response == true) {
      await loadCartItems();
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

  void invalidateCache() {
    _lastCachedProducts = null;
    _lastTotal = null;
  }

  //Optional getters
  double get totalCartValue {
    final cart = state.valueOrNull ?? [];

    //memoize approach (storing cached data and updating only when the state changes)
    if (identical(cart, _lastCachedProducts) && _lastTotal != null) {
      return _lastTotal ?? 0.0;
    }
    final total = cart.fold(0.0, (sum, item) {
      final itemPrice = double.tryParse(item.price ?? '') ?? 0.0;
      final price = itemPrice * (item.quantity ?? 1);
      return sum + price;
    });

    _lastTotal = total;
    _lastCachedProducts = cart;
    return total;
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartProducts>>>(
      (ref) => CartNotifier(),
    );
