// import 'dart:developer';

import 'dart:developer';

// import 'package:basic_ecommerce_app/api%20files/api_call.dart';
// import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
// import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCart extends ConsumerStatefulWidget {
  const AddToCart({super.key});

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {
  // List<CartProducts> items = [];

  @override
  void initState() {
    super.initState();
    getCartData();
  }

  Future<void> getCartData() async {
    // log('get data is being called..');
    // ref.read(isLoadingCartItems.notifier).state = true;
    // GadgetsApi().getCartItems().then((final value) {
    // items = widget.allProducts;
    ref.read(isLoadingCartItems.notifier).state = false;
    // });
    // log('values from screen ${items[0].imageUrl}');
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(allProducts);
    final totalCart = ref.watch(totalCartValue);
    // final noOfItems = ref.watch(itemQuantity);
    log('cart items -- ${items[0].addedToCartAt}');
    final isLoadingApi = ref.watch(isLoadingCartItems);
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
                      ? ListView.separated(
                        shrinkWrap: true,
                        // physics: BouncingScrollPhysics(),
                        itemBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(95, 82, 80, 80),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          height: 100,
                                          items[index].imageUrl!,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return CircularProgressIndicator();
                                          },
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                25.0,
                                              ),
                                              child: Icon(Icons.error),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${items[index].name}',
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text('\$${items[index].price}'),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          230,
                                          89,
                                          88,
                                          88,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove, size: 16),
                                            onPressed: () {},
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            child: Text(
                                              '${items[index].quantity}',
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add, size: 16),
                                            onPressed: () {
                                              AddCartItem()
                                                  .addItem(
                                                    product: items[index],
                                                  )
                                                  .then((final value) {
                                                    log('cart value added ---');
                                                  });
                                            },
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder:
                            (context, index) => SizedBox(height: 15),
                        itemCount: items.length,
                      )
                      : Center(child: Text('No items found'))
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
                              text: '\$$totalCart',
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
