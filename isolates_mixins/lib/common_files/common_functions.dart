// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isolates_mixins/common_files/route_navigation.dart';

class CommonUtils {
  static String updateInputValue(String value, bool height) {
    String errorText = '';

    double parsedValue = double.tryParse(value) ?? 0;
    if (parsedValue < 1 || height ? parsedValue > 250 : parsedValue > 150) {
      return errorText = 'Value must be between 1 and 250';
    } else {
      return errorText;
    }
  }

  static Future<String> getBMI({
    double height = 1.0,
    double weight = 1.0,
  }) async {
    var bmi = getBmiValue(height: height, weight: weight);

    if (bmi >= 16 && bmi <= 18.5) {
      return 'under weight';
    } else if (bmi > 18.5 && bmi <= 25) {
      return 'normal';
    } else if (bmi > 25 && bmi <= 35) {
      return 'over weight';
    } else if (bmi > 35) {
      return 'obsese';
    } else {
      return '';
    }
  }

  static double getBmiValue({required double height, required double weight}) {
    return (weight / ((height / 100) * (height / 100)));
  }

  static void clearText() {}

  static void heroWigetNav({
    required String page,
    required BuildContext context,
  }) {
    switch (page) {
      case AppConstants.heroWiget:
        // Navigator.pushNamed(context, routeName)
        log('You are inside hero nav');
        Navigator.pushNamed(context, RouteNavigation.heroWidget);
      case AppConstants.sliders:
        Navigator.pushNamed(context, RouteNavigation.sliders);
      case AppConstants.pagination:
        log('You are inside pagination');
        Navigator.pushNamed(context, RouteNavigation.pagination);

      default:
        log('default message..');
        Navigator.pushNamed(context, RouteNavigation.homepage);
    }
  }
}

class AppConstants {
  static const String heroWiget = 'Hero Widget';
  static const String gridView = 'Grid View';
  static const String layoutBuilder = 'Layout Builder';
  static const String animations = 'Animations';
  static const String sliders = 'Sliders';
  static const String pagination = 'Pagination';
}
