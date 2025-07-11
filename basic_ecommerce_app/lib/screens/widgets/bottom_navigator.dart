import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
// import 'package:basic_ecommerce_app/api%20files/models/cart_products.dart';
import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:flutter/material.dart';

Widget bottomNavigator({
  required BuildContext context,
  required Products products,
  required bool isApiLoaded,
  required bool goToCart,
}) {
  return SizedBox(
    height: 60,
    child:
        isApiLoaded
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.ce,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  // flex: ,
                  child: Container(
                    // height: 60,
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          addToCartFn(
                            context: context,
                            products: products,
                            goToCart: goToCart,
                          );
                        },
                        icon: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text(
                              'Buy now',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 123, 121, 121),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () async {
                          addToCartFn(
                            context: context,
                            products: products,
                            goToCart: goToCart,
                          );
                        },
                        icon: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            goToCart
                                ? Text(
                                  'Go to Cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                )
                                : Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(color: Colors.teal),
              ),
            ),
  );
}

Future<void> addToCartFn({
  required Products products,
  required BuildContext context,
  required bool goToCart,
}) async {
  final discount = products.discountPercent.toString();
  final price = products.price.toString();

  if (!goToCart) {
    await AddCartItem()
        .addItem(
          product: CartProducts(
            addedToCartAt: DateTime.now(),
            shippingInfo: DateTime.now(),
            brand: products.brand,
            name: products.title,
            discountPercent: discount,
            productId: products.id,
            isAvailable: products.availabiltySts == 'In Stock' ? true : false,
            price: price,
            stock: products.stock,
            warrentyInfo: products.warrentyInfo,
            imageUrl: products.thumbnail,
          ),
          action: 'increment',
        )
        .then((final value) {
          // if success show a  toast msg of added to cart successfully
          //if buy now -> go to cart with the newly added item and the exisiting item
          // re
          if (!context.mounted) return;
          Navigator.pushNamed(context, RouteNavigations.addToCartPageSkip);
        });
  } else {
    // print('printing inside the go to cart page..');
    if (!context.mounted) return;
    Navigator.pushNamed(context, RouteNavigations.addToCartPageSkip);
  }
}
