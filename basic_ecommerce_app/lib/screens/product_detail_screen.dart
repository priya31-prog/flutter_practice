import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/common_files/common_utils.dart';
import 'package:basic_ecommerce_app/common_files/star_rating.dart';
import 'package:basic_ecommerce_app/common_files/table_row_widget.dart';
import 'package:basic_ecommerce_app/screens/images_slider.dart';
import 'package:basic_ecommerce_app/screens/widgets/bottom_navigator.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.productDetails});

  final Products productDetails;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  bool isApiLoaded = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCartData();
    });
  }

  void _getCartData() {
    GadgetsApi().getCartItems().then((final value) {
      ref.read(allProducts.notifier).state = value.cartProducts!;
      setState(() {
        isApiLoaded = true;
      });
      ref.read(isAlreadyAddedToCart.notifier).state = value.cartProducts!.any((
        final ele,
      ) {
        final price = double.parse(ele.price ?? '0');
        ref.read(totalCartValue.notifier).state += price;
        if (ele.productId == widget.productDetails.id &&
            (ele.quantity ?? 0) >= 1) {
          return true;
        } else {
          return false;
        }
      });
    });
  }

  bool showDetailedDesc = false;
  @override
  Widget build(BuildContext context) {
    final isAlreadyAdded = ref.watch(isAlreadyAddedToCart);
    // final cartProduct = ref.watch(allProducts);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CommonUtils.firstLetterCaps(name: widget.productDetails.title),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 193, 187, 187),
                ),
                // color: Colors.white,
                child: ImagesSlider(images: widget.productDetails.images!),
              ),
              // SizedBox(height: 10),
              Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.productDetails.brand,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ${widget.productDetails.title}',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
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

                    Row(
                      spacing: 15,
                      children: [
                        Text(
                          '\$${widget.productDetails.price}',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                        Text(
                          '\$${CommonUtils.discountedPrice(price: widget.productDetails.price, discount: widget.productDetails.discountPercent)}',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
                    SizedBox(height: 15),

                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.local_shipping),
                        Text(widget.productDetails.shippingInfo),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text('Expected date of arrival - '),
                  ],
                ),
              ),
              Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
              ),

              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Product Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
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
              ),

              Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
              ),
              Center(
                child: Text(
                  // textAlign: TextAlign.center,
                  widget.productDetails.warrentyInfo,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rating and Reviews',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 15),

                    ListView.separated(
                      separatorBuilder:
                          (context, index) => SizedBox(height: 15),
                      shrinkWrap: true,
                      itemCount: widget.productDetails.reviews!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          spacing: 5,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildStarRating(
                              rating:
                                  widget.productDetails.reviews![index].rating!
                                      .toDouble(),
                            ),
                            Text(
                              widget
                                  .productDetails
                                  .reviews![index]
                                  .reviewerName!,
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.w400,
                              ),
                            ),

                            Text(
                              widget.productDetails.reviews![index].comment!,
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.w400,
                              ),
                            ),

                            Text(
                              'posted ${widget.productDetails.reviews![index].date!}',
                              style: TextStyle(
                                fontSize: 13,
                                // fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar:
          widget.productDetails.availabiltySts == 'In Stock'
              ? bottomNavigator(
                context: context,
                products: widget.productDetails,
                isApiLoaded: isApiLoaded,
                goToCart: isAlreadyAdded,
              )
              : SizedBox.shrink(),
    );
  }
}
