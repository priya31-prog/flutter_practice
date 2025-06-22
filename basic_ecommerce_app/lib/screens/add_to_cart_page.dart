import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCart extends ConsumerStatefulWidget {
  const AddToCart({super.key});

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {
  List<CartProducts> items = [];
  late bool isLoadingApi;

  @override
  void initState() {
    super.initState();

    getCartData();
  }

  void getCartData() async {
    setState(() {
      isLoadingApi = true;
    });

    await GadgetsApi().getCartItems().then((final value) {
      items = value.cartProducts ?? [];
      setState(() {
        isLoadingApi = false;
      });
    });
    log('values from screen ${items.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary.withAlpha(150),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CART'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child:
              !isLoadingApi
                  ? items.isNotEmpty
                      ? Column(children: [Text('Some item found')])
                      : Text('No items found')
                  : Center(child: CircularProgressIndicator()),
        ),
      ),
      bottomNavigationBar:
          !isLoadingApi && items.isNotEmpty
              ? SizedBox(
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
                              text: '\$19.45',
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
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 0,
                              ),
                              child: elevatedButtonWider(
                                onTap: () {},
                                text: 'CHECKOUT',
                                textStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              : SizedBox.shrink(),
    );
  }
}
