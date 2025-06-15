import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/common_files/common_utils.dart';
import 'package:basic_ecommerce_app/common_files/star_rating.dart';
import 'package:basic_ecommerce_app/common_files/table_row_widget.dart';
import 'package:basic_ecommerce_app/screens/images_slider.dart';
import 'package:basic_ecommerce_app/screens/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productDetails});

  final Products productDetails;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showDetailedDesc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CommonUtils.firstLetterCaps(name: widget.productDetails.category),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary.withAlpha(150),
          ),

          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 193, 187, 187),
                  ),
                  // color: Colors.white,
                  child: ImagesSlider(images: widget.productDetails.images!),
                ),
                // SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '${widget.productDetails.brand}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ${widget.productDetails.title}',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10),
                Row(
                  spacing: 10,
                  children: [
                    buildStarRating(rating: widget.productDetails.rating),
                    RichText(
                      text: TextSpan(
                        text: '${widget.productDetails.rating}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' Ratings by users',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Text(
                  '\$${widget.productDetails.price}',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      showDetailedDesc = !showDetailedDesc;
                    });
                  },
                  child:
                      showDetailedDesc
                          ? Text(
                            widget.productDetails.description,
                            style: TextStyle(fontSize: 15),
                          )
                          : Text(
                            widget.productDetails.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          ),
                ),
                Text(
                  'Product Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Table(
                  border: TableBorder.all(color: Colors.grey),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    tableRowWidget(
                      titleText: 'Brand',
                      nextRowText: widget.productDetails.brand,
                    ),
                    tableRowWidget(
                      titleText: 'Info',
                      nextRowText: widget.productDetails.sku,
                    ),
                    tableRowWidget(
                      titleText: 'Weight',
                      nextRowText: '${widget.productDetails.weight} kg',
                    ),
                    tableRowWidget(
                      titleText: 'Dimensions',
                      nextRowText:
                          '''Width : ${widget.productDetails.dimension.width}\nHeight : ${widget.productDetails.dimension.height}\nDepth : ${widget.productDetails.dimension.depth}''',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}
