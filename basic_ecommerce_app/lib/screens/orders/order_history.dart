// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:basic_ecommerce_app/state_management/order_history_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                      : ListView.builder(
                        itemBuilder: (context, index) {
                          return Material(
                            elevation: 25,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                // vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.cyan),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.cyan.withAlpha(20),
                                    spreadRadius: 8,
                                    blurRadius: 10,
                                    offset: Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 90,
                                    width: 50,
                                    child: Image.network(
                                      orderedProducts[index].imageUrl ?? '',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        !getIsProductDelivered(
                                              orderedProducts[index]
                                                      .shippingInfo ??
                                                  DateTime.now(),
                                            )
                                            ? 'Delivery Expected by ${getDateFormatted(orderedProducts[index].shippingInfo ?? DateTime.now().add(Duration(days: 2)))}'
                                            : 'Delivered on  ${getDateFormatted(orderedProducts[index].shippingInfo ?? DateTime.now())}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        '${orderedProducts[index].brand} - ${orderedProducts[index].name}',
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        // separatorBuilder: (context, index) => Divider(),
                        itemCount: orderedProducts.length,
                      ),
          error: (e, st) => Text('Error $e'),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

String getDateFormatted(DateTime date) {
  // final dartDate = DateTime.now();

  final formatter = DateFormat('E MMM dd');
  final formattedDate = formatter.format(date);

  return formattedDate;
}

bool getIsProductDelivered(DateTime shippingDate) {
  final today = DateTime.now();
  if (today.isAfter(shippingDate)) {
    return true;
  }
  return false;
}
