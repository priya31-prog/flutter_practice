import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/common_files/gradient_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    GadgetsApi().fetchApiResponse().then((final value) {
      if (value.status.toLowerCase() == 'success') {
        setState(() {
          isLoading = false;
        });

        log('printing set state ${isLoading}');
      }
    });
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ShaderMask(
              // to give the gradient color to the icon
              shaderCallback: (Rect bounds) {
                return Theme.of(context)
                    .extension<GradientTheme>()!
                    .primaryGradient
                    .createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Icon(
                Icons.shopping_cart_outlined,
                size: MediaQuery.of(context).size.height * 0.25,
                color: Colors.white,
              ),
            ),

            Text(
              'ElectroCart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text(
              'Shop the Future',
              style: TextStyle(fontSize: 15, color: Colors.white24),
            ),

            SizedBox(height: 60),
            isLoading
                ? Padding(
                  padding: EdgeInsets.all(8),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return Theme.of(context)
                          .extension<GradientTheme>()!
                          .primaryGradient
                          .createShader(bounds);
                    },
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.cyan,
                    ),
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
