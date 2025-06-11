import 'package:basic_ecommerce_app/screens/login_screen.dart';
import 'package:basic_ecommerce_app/screens/onboarding_screen.dart';
import 'package:basic_ecommerce_app/screens/sign_up_screen.dart';
import 'package:basic_ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNavigations {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onboarding';
  static const String loginPage = '/onboarding/login';
  static const String signUpScreen = '/onboarding/login/signup';

  static const String loginPageWithoutOnboard = '/login';

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
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
