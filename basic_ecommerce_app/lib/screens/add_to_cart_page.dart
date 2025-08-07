import 'package:basic_ecommerce_app/api%20files/cart_notifiers.dart';
import 'package:basic_ecommerce_app/common_files/add_remove_item_notifier.dart';
import 'package:basic_ecommerce_app/screens/widgets/bottom_checkout_navigator.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCart extends ConsumerStatefulWidget {
  const AddToCart({super.key});

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {
  @override
  void initState() {
    super.initState();

    //debug

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cartProvider.notifier).loadCartItems();
    });
    getCartData();
  }

  Future<void> getCartData() async {
    ref.read(isLoadingCartItems.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    final totalCart = ref.watch(totalCartValue);
    final isLoadingApi = ref.watch(isLoadingCartItems);
    final isCartListEmpty = ref
        .watch(cartProvider)
        .maybeWhen(data: (cartList) => cartList.isEmpty, orElse: () => false);
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
                  ? cartItems.when(
                    loading: () => Center(child: CircularProgressIndicator()),
                    error: (e, st) => Text('Error: $e'),
                    data:
                        (cartItems) =>
                            isCartListEmpty
                                ? Center(
                                  child: Text(
                                    'No Items found in the cart. Please add to proceed.',
                                  ),
                                )
                                : ListView.separated(
                                  shrinkWrap: true,
                                  // physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final item = cartItems[index];
                                    final productID = item.productId!;
                                    final doesLoads =
                                        ref.watch(loaderToOperate)[productID] ??
                                        false;
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            95,
                                            82,
                                            80,
                                            80,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.network(
                                                  height: 100,
                                                  item.imageUrl!,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (
                                                    context,
                                                    child,
                                                    loadingProgress,
                                                  ) {
                                                    if (loadingProgress ==
                                                        null) {
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
                                                      padding:
                                                          const EdgeInsets.all(
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
                                                    '${item.name}',
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text('\$${item.price}'),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child:
                                                  doesLoads
                                                      ? Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal:
                                                                    MediaQuery.of(
                                                                      context,
                                                                    ).size.width *
                                                                    0.09,
                                                                vertical: 4,
                                                              ),
                                                          child:
                                                              CircularProgressIndicator(
                                                                strokeWidth: 2,
                                                              ),
                                                        ),
                                                      )
                                                      : Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.remove,
                                                              size: 16,
                                                            ),
                                                            onPressed: () {
                                                              onRemoveAddActions(
                                                                action:
                                                                    'decrement',
                                                                productID:
                                                                    item.productId!,
                                                                index: index,
                                                                cartItems:
                                                                    cartItems,
                                                                ref: ref,
                                                              );
                                                            },
                                                            padding:
                                                                EdgeInsets.zero,
                                                            constraints:
                                                                BoxConstraints(),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal: 4,
                                                                ),
                                                            child: Text(
                                                              '${item.quantity}',
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 16,
                                                            ),
                                                            onPressed: () {
                                                              onRemoveAddActions(
                                                                action:
                                                                    'increment',
                                                                productID:
                                                                    item.productId!,
                                                                index: index,
                                                                cartItems:
                                                                    cartItems,
                                                                ref: ref,
                                                              );
                                                            },
                                                            padding:
                                                                EdgeInsets.zero,
                                                            constraints:
                                                                BoxConstraints(),
                                                          ),
                                                        ],
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (context, index) => SizedBox(height: 15),
                                  itemCount: cartItems.length,
                                ),
                  )
                  : Center(child: CircularProgressIndicator()),
        ),
      ),
      bottomNavigationBar:
          !isLoadingApi
              ? bottomCheckOutNavigator(
                context: context,
                totalCart: totalCart,
                isCartListEmpty: isCartListEmpty,
              )
              : SizedBox.shrink(),
    );
  }
}
