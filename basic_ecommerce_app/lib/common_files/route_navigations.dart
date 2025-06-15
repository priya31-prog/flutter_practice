import 'package:basic_ecommerce_app/api%20files/products_model.dart';
import 'package:basic_ecommerce_app/screens/home_screen.dart';
import 'package:basic_ecommerce_app/screens/login_screen.dart';
import 'package:basic_ecommerce_app/screens/onboarding_screen.dart';
import 'package:basic_ecommerce_app/screens/product_detail_screen.dart';
import 'package:basic_ecommerce_app/screens/sign_up_screen.dart';
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

  static const String loginPageWithoutOnboard = '/login';
  static const String homeScreenSkip = '/onboarding/homeScreenSkip';
  static const String productDetailPageSkip =
      '/onboarding/login/signup/homeScreen/productPageSkip';

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
      case homeScreenSkip:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case homeScreenWithoutSkip:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
