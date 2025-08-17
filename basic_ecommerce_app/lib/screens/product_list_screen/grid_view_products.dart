import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:flutter/material.dart';

Widget getAllProducts({
  required BuildContext context,
  required List<Products> products,
  required VoidCallback ontap,
}) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      mainAxisExtent: 280,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          log('printing inside on tap function..');
          ontap();
          Navigator.pushNamed(
            context,
            RouteNavigations.productDetailPageSkip,
            arguments: products[index],
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 22,
            // right: 12,
            // left: 12,
            bottom: 6,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withAlpha(30),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),

                  child: Image.network(
                    products[index].thumbnail,
                    fit: BoxFit.contain,
                    height: 150,

                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      log('error msg --$error');
                      return Icon(Icons.error);
                    },
                  ),
                ),
              ),

              //   child: CachedNetworkImage(
              //     imageUrl: products[index].imageUrl,
              //   ),
              // ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 12,
                  left: 12,
                  // bottom: 5,
                ),
                child: Text(
                  products[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  // top: 12,
                  right: 12,
                  left: 12,
                  bottom: 5,
                ),

                child: Text(
                  '\$${products[index].price}',
                  style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
