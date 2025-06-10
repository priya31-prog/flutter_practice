import 'package:basic_ecommerce_app/common_files/gradient_theme.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    extensions: <ThemeExtension<dynamic>>[
      const GradientTheme(
        primaryGradient: LinearGradient(
          colors: [Colors.tealAccent, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElectroCart',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: darkTheme,
      onGenerateRoute: RouteNavigations.onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
