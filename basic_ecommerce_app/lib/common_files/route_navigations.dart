import 'package:basic_ecommerce_app/api%20files/models/products_model.dart';
import 'package:basic_ecommerce_app/screens/login_profile/user_address.dart';
import 'package:basic_ecommerce_app/screens/orders/order_history.dart';
import 'package:basic_ecommerce_app/screens/product_details/add_to_cart_page.dart';
import 'package:basic_ecommerce_app/screens/product_list_screen/branded_products.dart';
import 'package:basic_ecommerce_app/screens/product_list_screen/home_screen.dart';
import 'package:basic_ecommerce_app/screens/login_profile/login_screen.dart';
import 'package:basic_ecommerce_app/screens/onboarding_screen.dart';
import 'package:basic_ecommerce_app/screens/orders/order_placed_success.dart';
import 'package:basic_ecommerce_app/screens/product_details/product_detail_screen.dart';
import 'package:basic_ecommerce_app/screens/login_profile/sign_up_screen.dart';
import 'package:basic_ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNavigations {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onboarding';
  static const String loginPage = '/onboarding/login';
  static const String signUpScreen = '/onboarding/login/signup';
  static const String homeScreenWithoutSkip =
      '/onboarding/login/signup/homeScreen';
  static const String productDetailPage =
      '/onboarding/login/signup/homeScreen/productPage';
  static const String addToCartPage =
      '/onboarding/login/signup/homeScreen/productPage/addToCartPage';
  static const String userAddressPage = '/userAddressPage';

  static const String loginPageWithoutOnboard = '/login';
  static const String homeScreenSkip = '/onboarding/homeScreenSkip';
  static const String productDetailPageSkip =
      '/onboarding/login/signup/homeScreen/productPageSkip';
  static const String addToCartPageSkip =
      '/onboarding/login/signup/homeScreen/productPageSkip/addToCartPageSkip';
  static const String productAdded = 'addToCartPage/productAdded';
  static const String orderHistory =
      'homeScreenSkip/orderHistory'; //this should be disabled after login implementation is done , user should checkout / see the order history only after login

  static const String brandedProductPage = "/homeScreenSkip/brandedProductPage";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case userAddressPage:
        return MaterialPageRoute(
          builder:
              (_) => UserAddress(
                userAddressParams: settings.arguments as UserAddressParams,
              ),
        );
      case homeScreenSkip:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case homeScreenWithoutSkip:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case addToCartPage:
        return MaterialPageRoute(builder: (_) => AddToCart());
      case addToCartPageSkip:
        return MaterialPageRoute(builder: (_) => AddToCart());
      case productAdded:
        return MaterialPageRoute(builder: (_) => OrderPlacedSuccess());
      case brandedProductPage:
        return MaterialPageRoute(
          builder:
              (_) => BrandedProducts(
                brandedProductsArgs: settings.arguments as BrandedProductsArgs,
              ),
        );
      case productDetailPage:
        return MaterialPageRoute(
          builder:
              (_) => ProductDetailScreen(
                productDetails: settings.arguments as Products,
              ),
        );
      case productDetailPageSkip:
        return MaterialPageRoute(
          builder:
              (_) => ProductDetailScreen(
                productDetails: settings.arguments as Products,
              ),
        );
      case orderHistory:
        return MaterialPageRoute(builder: (_) => OrderHistory());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
