import 'dart:async';
import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/screens/login_profile/profile_drawer.dart';
import 'package:basic_ecommerce_app/screens/product_details/promo_card.dart';
import 'package:basic_ecommerce_app/screens/product_list_screen/branded_products.dart';
import 'package:basic_ecommerce_app/screens/product_list_screen/grid_view_products.dart';
import 'package:basic_ecommerce_app/state_management/branded_products_notifier.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final _searchController;
  late List<Products> products;
  List<String> brand = [];
  List<Products> searchProducts = [];
  Timer? _debounce;
  final FocusNode _searchFocusNode = FocusNode();
  final ValueNotifier<bool> isSearchFocused = ValueNotifier(false);
  // List<Products> brandedProduct = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode.addListener(() {
      isSearchFocused.value = _searchFocusNode.hasFocus;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    // isSearchFocused.value = false;
  }

  void _loadData() {
    var totalGadget = ref.watch(gadgetsList);

    Future.delayed(Duration(seconds: 2), () {
      ref.read(brandsList.notifier).state =
          totalGadget.products.map((ele) => ele.brand).toSet().toList();

      ref.read(productsList.notifier).state = totalGadget.products;
    });

    log('category -- $brand');
  }

  void performSearch(String val, List<Products> allProducts) {
    final results =
        allProducts
            .where(
              (element) => element.title.toLowerCase().trim().contains(
                val.trim().toLowerCase(),
              ),
            )
            .toList();
    ref.read(searchedProducts.notifier).state = results;
  }

  @override
  Widget build(BuildContext context) {
    brand = ref.watch(brandsList);
    products = ref.watch(productsList);
    searchProducts = ref.watch(searchedProducts);
    // final items = ref.watch(brandFilterNotifier);

    ref.listen<List<Products>>(brandFilterNotifier, (prev, next) {
      log('priniting inside listen');
      if (!context.mounted) return;
      if (prev?.isEmpty == true && next.isNotEmpty) {
        Navigator.pushNamed(
          context,
          RouteNavigations.brandedProductPage,
          arguments: BrandedProductsArgs(brandedProducts: next),
        );
        //Each time this makes the prev empty so that everytime this if condition becomes true and navigates
        ref.read(brandFilterNotifier.notifier).clear();
      }
    });

    return PopScope(
      canPop: isSearchFocused.value ? false : true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              // backgroundColor: Colors.white,
              child: profileDrawer(context: context),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            onTapOutside: (event) {
                              // FocusScope.of(context).unfocus();
                            },
                            onChanged: (final text) {
                              // Timer? _debounce;

                              if (_debounce?.isActive ?? false)
                                _debounce!.cancel();
                              _debounce = Timer(
                                Duration(milliseconds: 300),
                                () {
                                  performSearch(text, products);
                                },
                              );
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondary.withAlpha(200),
                              ),

                              hintStyle: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondary.withAlpha(200),
                              ),
                              fillColor: Theme.of(
                                context,
                              ).colorScheme.secondary.withAlpha(50),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        InkWell(
                          onTap: () {
                            log("tapping inside profile..");
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withAlpha(50),
                            ),
                            child: Icon(Icons.person_2_outlined),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                PromoCard(
                                  title: 'Summer Tech Sale upto 30% off',
                                ),
                              ],
                            ),

                            brand.isNotEmpty
                                ? SizedBox(
                                  height: 45,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: brand.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          ref
                                              .read(
                                                brandFilterNotifier.notifier,
                                              )
                                              .filterBrand(
                                                brand[index],
                                                products,
                                              );
                                          // filterBrand(brand[index], products);
                                          if (!context.mounted) return;
                                          // if (brandedProduct != null) {
                                          // Do it later

                                          // }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          margin: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary
                                                .withAlpha(50),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Text(brand[index]),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                : SizedBox(
                                  height: 50,
                                  child: Shimmer.fromColors(
                                    baseColor: const Color.fromARGB(
                                      255,
                                      48,
                                      46,
                                      46,
                                    ),
                                    highlightColor: const Color.fromARGB(
                                      255,
                                      143,
                                      142,
                                      142,
                                    ),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {},

                                          child: Container(
                                            width: 100,
                                            height: 40,
                                            margin: const EdgeInsets.only(
                                              right: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                            SizedBox(height: 30),

                            ValueListenableBuilder<bool>(
                              valueListenable: isSearchFocused,
                              builder: (context, isSearchFocused, _) {
                                return isSearchFocused
                                    ? getAllProducts(
                                      context: context,
                                      products:
                                          searchProducts.isEmpty
                                              ? []
                                              : searchProducts,
                                      isSearchedProduct: true,
                                      ontap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        _searchController.clear();
                                      },
                                    )
                                    : getAllProducts(
                                      context: context,
                                      products: products,
                                      ontap: () {
                                        FocusScope.of(context).unfocus();
                                      },
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
