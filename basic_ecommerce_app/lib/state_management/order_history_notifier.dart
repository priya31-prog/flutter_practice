import 'dart:async';
import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/order_history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistoryNotifier extends AsyncNotifier<List<OrderHistoryModel>> {
  @override
  Future<List<OrderHistoryModel>> build() async {
    return await fetchOrders();
  }

  //manual refresh condition
  Future<void> fetchHistoryRefresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return fetchOrders();
    });
  }

  Future<List<OrderHistoryModel>> fetchOrders() async {
    final snapShot =
        await FirebaseFirestore.instance
            .collection('sold_products')
            .doc('dndaRtwFqKPg8yxm2guJ')
            .get();

    if (!snapShot.exists) {
      return [];
    }
    final Map<String, dynamic>? soldProducts = snapShot.data();
    final List<dynamic> dataList = soldProducts!['data'] ?? [];

    final List<OrderHistoryModel> allOrders =
        dataList
            .map(
              (element) =>
                  OrderHistoryModel.fromJson(element as Map<String, dynamic>),
            )
            .toList();

    log('all orders -$allOrders');
    state = AsyncData(allOrders);

    return allOrders;
  }
}

final orderHistoryProvider = AsyncNotifierProvider<
  OrderHistoryNotifier,
  List<OrderHistoryModel>
>(
  OrderHistoryNotifier
      .new, // tear-off this can be written also as () => OrderHistoryNotifier()
);
