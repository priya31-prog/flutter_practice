import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:flutter/material.dart';

Widget bottomNavigator({required BuildContext context}) {
  return SizedBox(
    height: 60,
    child: Row(
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
                onPressed: () {},
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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNavigations.addToCartPageSkip,
                  );
                },
                icon: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    Text(
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
    ),
  );
}
