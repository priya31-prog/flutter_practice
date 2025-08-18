import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:basic_ecommerce_app/screens/product_list_screen/grid_view_products.dart';
import 'package:flutter/material.dart';

class BrandedProducts extends StatelessWidget {
  const BrandedProducts({super.key, required this.brandedProductsArgs});

  final BrandedProductsArgs brandedProductsArgs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsGeometry.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Text(
                      brandedProductsArgs.brandedProducts[0].brand,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      child: Icon(Icons.close, weight: 1),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              getAllProducts(
                context: context,
                products: brandedProductsArgs.brandedProducts,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrandedProductsArgs {
  final List<Products> brandedProducts;
  BrandedProductsArgs({required this.brandedProducts});
}
