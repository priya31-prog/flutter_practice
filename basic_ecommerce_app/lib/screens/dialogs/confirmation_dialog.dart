// import 'package:basic_ecommerce_app/common_files/route_navigations.dart';a
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:flutter/material.dart';

class OrderDialog extends StatefulWidget {
  const OrderDialog({super.key});

  @override
  State<OrderDialog> createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
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
