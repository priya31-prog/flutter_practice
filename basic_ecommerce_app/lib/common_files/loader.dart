import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void loader(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 40,
        width: 40,
        child: Lottie.asset('assets/json/circular_loader.json'),
      );
    },
  );
}
