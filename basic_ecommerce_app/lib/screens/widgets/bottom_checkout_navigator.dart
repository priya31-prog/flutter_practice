import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/api%20files/models/order_history_model.dart';
import 'package:basic_ecommerce_app/screens/dialogs/confirmation_dialog.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
import 'package:flutter/material.dart';

Widget bottomCheckOutNavigator({
  required BuildContext context,
  required double totalCart,
  required bool isCartListEmpty,
  required List<CartProducts> cartItems,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.18,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          RichText(
            text: TextSpan(
              text: 'Total cart items ',
              style: TextStyle(color: Colors.white, fontSize: 17),

              children: <TextSpan>[
                TextSpan(
                  text: '\$${totalCart.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // child:
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: elevatedButtonWider(
                    onTap: () {
                      final List<OrderHistoryModel> orderedItems =
                          cartItems.map((element) {
                            return OrderHistoryModel(
                              id: element.id,
                              brand: element.brand,
                              imageUrl: element.imageUrl,
                              message: element.message,
                              name: element.name,
                              price: element.price,
                              productId: element.productId,
                              shippingInfo: element.shippingInfo,
                              warrentyInfo: element.warrentyInfo,
                              quantity: element.quantity,
                            );
                          }).toList();
                      showDialog(
                        context: context,
                        builder:
                            (context) =>
                                OrderDialog(orderedItems: orderedItems),
                      );
                      // OrderDialog();
                    },
                    text: 'CHECKOUT',
                    textStyle: TextStyle(color: Colors.black),
                    isDisabled: isCartListEmpty,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
