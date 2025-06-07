import 'package:flutter/material.dart';
import 'package:isolates_mixins/home_page.dart';
import 'package:isolates_mixins/mixins/hero%20widget/hero_wiget_screen.dart';
import 'package:isolates_mixins/mixins/hero%20widget/pagination.dart';
import 'package:isolates_mixins/mixins/hero%20widget/sliders.dart';
import 'package:isolates_mixins/mixins/mixin_main.dart';

class RouteNavigation {
  static const String homepage = '/';
  static const String mixinPage = '/mixinPage';
  static const String sliders = '/mixinPage/sliders';
  static const String heroWidget = '/mixinPage/heroWidget';
  static const String pagination = '/mixinPage/pagination';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case mixinPage:
        return MaterialPageRoute(builder: (_) => CustomWidget());
      case sliders:
        return MaterialPageRoute(builder: (_) => SlidersClass());
      case heroWidget:
        return MaterialPageRoute(builder: (_) => HeroWigetScreen());
      case pagination:
        return MaterialPageRoute(builder: (_) => Pagination());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
