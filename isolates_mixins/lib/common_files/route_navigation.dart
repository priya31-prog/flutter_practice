import 'package:flutter/material.dart';
import 'package:isolates_mixins/home_page.dart';

class RouteNavigation {
  static const String homepage = '/';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
