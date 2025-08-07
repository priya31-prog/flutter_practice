import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/cart_notifiers.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/common_files/common_utils.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void onRemoveAddActions({
  required String action,
  required int productID,
  final int? index,
  final List<CartProducts>? cartItems,
  required WidgetRef ref,
  final CartProducts? products,
  final VoidCallback? productsCallBack,
  required double cartValue,
}) {
  ref
      .read(loaderToOperate.notifier)
      .update((state) => {...state, productID: true});

  if (index != null) {
    // final originalPrice = double.parse(cartItems![index].price ?? '');
    // final discount = double.parse(cartItems[index].discountPercent ?? '');

    final price = double.parse(cartItems![index].price ?? '');
    // double.parse(
    //   CommonUtils.discountedPrice(price: originalPrice, discount: discount),
    // );

    log('price of a single product ${price}');

    // final item = cartItems[index];
    // item.price = price.toStringAsFixed(2);

    log('Logging the price updated cart item ${cartItems}');

    if (action == 'increment') {
      ref
          .read(cartProvider.notifier)
          .incrementItem(cartItems[index])
          .then(
            (final value) => {
              ref
                  .read(loaderToOperate.notifier)
                  .update((state) => {...state, productID: false}),

              ref.read(totalCartValue.notifier).state += price,
              log('price after increment ${ref.watch(totalCartValue)}'),
              log('price after increment ${ref.watch(cartProvider)}'),
            },
          );
    } else {
      ref
          .read(cartProvider.notifier)
          .decrementItem(cartItems[index])
          .then(
            (final val) => {
              ref
                  .read(loaderToOperate.notifier)
                  .update((state) => {...state, productID: false}),

              ref.read(totalCartValue.notifier).state -= price,
              log('price after decrement ${ref.watch(totalCartValue)}'),
            },
          );
    }
  } else {
    final originalPrice = double.parse(products!.price ?? '');
    final discountPrice = double.parse(products.discountPercent ?? '');

    final price = double.parse(
      CommonUtils.discountedPrice(
        price: originalPrice,
        discount: discountPrice,
      ),
    );

    final item = products;
    item.price = price.toStringAsFixed(2);

    log('price of a single product ${price}');

    if (action == 'increment') {
      ref
          .read(cartProvider.notifier)
          .incrementItem(products)
          .then(
            (final value) => {
              ref
                  .read(loaderToOperate.notifier)
                  .update((state) => {...state, productID: false}),

              ref.read(totalCartValue.notifier).state = price + cartValue,
              log('price after increment ${ref.watch(totalCartValue)}'),
              log('price after increment ${cartValue}'),
              log('price after increment ${price}'),
              productsCallBack?.call(),
            },
          );
    }
  }
  final isItemPresent = ref
      .watch(cartProvider)
      .maybeWhen(data: (cartList) => cartList.isEmpty, orElse: () => false);
  ref.read(isAlreadyAddedToCart.notifier).state = isItemPresent;
}
