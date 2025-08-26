// import 'package:basic_ecommerce_app/common_files/route_navigations.dart';a
import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/state_management/cart_notifiers.dart';
import 'package:basic_ecommerce_app/api%20files/models/order_history_model.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDialog extends ConsumerStatefulWidget {
  const OrderDialog({super.key, required this.orderedItems});
  final List<OrderHistoryModel> orderedItems;

  @override
  ConsumerState<OrderDialog> createState() => _OrderDialogState();
}

class _OrderDialogState extends ConsumerState<OrderDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Order Confirmation'),
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titlePadding: EdgeInsets.only(top: 25, left: 22, right: 24),
      contentPadding: EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(255, 96, 94, 94),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 22,
              right: 24,
              bottom: 20,
            ),
            child: Text('Please confirm your order to proceed.'),
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(color: Colors.cyan, thickness: 1, height: 0),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text('No'),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.cyan, thickness: 1, width: 0),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      try {
                        final user = ref.watch(userId);

                        final docRef = FirebaseFirestore.instance
                            .collection('order_history')
                            .doc(user);
                        final data =
                            widget.orderedItems.map((products) {
                              final json = products.toJson();
                              if (products.quantity == null) {
                                json['quantity'] = 1;
                              }
                              json['orderDate'] =
                                  DateTime.now().toIso8601String();

                              json['quantity'] = products.quantity ?? 1;
                              // json['quantity'] = 1;
                              return json;
                            }).toList();

                        await docRef.set({
                          'items': data,
                          'ordered_at': FieldValue.serverTimestamp(),
                        });

                        await AddCartItem().deleteItem(action: 'delete');
                        ref
                            .read(cartProvider.notifier)
                            .deleteItem()
                            .then((value) {});

                        // log('populated data success');
                      } catch (e) {
                        log('errir in updtaing ${e}');
                      }

                      if (!context.mounted) return;
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        RouteNavigations.productAdded,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(color: Colors.cyan, thickness: 1, height: 0),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
