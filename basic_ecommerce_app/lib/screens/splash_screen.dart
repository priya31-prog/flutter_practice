// import 'dart:developer';

// import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/api_call.dart';
import 'package:basic_ecommerce_app/common_files/gradient_theme.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  void _fetchData() {
    GadgetsApi().fetchApiResponse().then((final value) {
      ref.read(gadgetsList.notifier).state = value;
      Future.delayed(Duration(seconds: 1), () {
        ref.read(isDataLoaded.notifier).state = false;
        if (!mounted) return;
        Navigator.pushNamed(context, RouteNavigations.onBoardingScreen);
      });

      // log('printing set state ${isLoading}');

      // var datas = ref.watch(gadgetsList);
      // log('ref watch data ${datas.status}');
    });
  }

  // bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isDataLoaded);
    return Scaffold(
      body: SafeArea(
        child: Center(
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
      ),
    );
  }
}
