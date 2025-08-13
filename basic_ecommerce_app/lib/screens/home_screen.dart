import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/screens/promo_card.dart';
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

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _loadData() {
    var totalGadget = ref.watch(gadgetsList);

    Future.delayed(Duration(seconds: 3), () {
      ref.read(brandsList.notifier).state =
          totalGadget.products.map((ele) => ele.brand).toSet().toList();

      ref.read(productsList.notifier).state = totalGadget.products;
    });

    log('category -- $brand');
  }

  @override
  Widget build(BuildContext context) {
    brand = ref.watch(brandsList);
    products = ref.watch(productsList);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // backgroundColor: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                padding: EdgeInsetsGeometry.all(25),
                margin: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(color: Colors.cyan),
                child: Text('User Name', style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              title: Text('Order history'),
              leading: Icon(Icons.shopping_cart_sharp),
              onTap: () {},
            ),
            ListTile(
              title: Text('View Profile'),
              leading: Icon(Icons.manage_accounts_sharp),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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

                Row(
                  children: [PromoCard(title: 'Summer Tech Sale upto 30% off')],
                ),

                brand.isNotEmpty
                    ? SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: brand.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withAlpha(50),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              brand[index],
                            ), // You can vary the text here
                          );
                        },
                      ),
                    )
                    : SizedBox(
                      height: 50,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 48, 46, 46),
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
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary.withAlpha(50),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                SizedBox(height: 30),

                GridView.builder(
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
                        print('printing inside on tap function..');
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
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withAlpha(30),
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

                                  loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                  ) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
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
                                style: TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
