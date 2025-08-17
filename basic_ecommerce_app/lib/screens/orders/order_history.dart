// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:basic_ecommerce_app/state_management/order_history_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistory extends ConsumerStatefulWidget {
  const OrderHistory({super.key});
  @override
  ConsumerState<OrderHistory> createState() => _OrderHistory();
}

class _OrderHistory extends ConsumerState<OrderHistory> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderHistoryProvider.notifier).fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderedProducts = ref.watch(orderHistoryProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
          titleTextStyle: TextStyle(fontSize: 24),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.grey),
          ),
        ),
        body: orderedProducts.when(
          data:
              (orderedProducts) =>
                  orderedProducts.isEmpty
                      ? Text('No Items found in the history')
                      : ListView.separated(
                        itemBuilder: (context, index) {
                          // final
                          return Container(
                            child: Text(
                              'Product ID : ${orderedProducts[index].name}',
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: orderedProducts.length,
                      ),
          error: (e, st) => Text('Error $e'),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
