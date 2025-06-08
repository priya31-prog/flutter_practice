import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/common_files/route_navigation.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mixins and Isolates',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 43, 114, 164),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNavigation.homepage,
      onGenerateRoute: RouteNavigation.generateRoute,
      // home: ScrollViewPagination(),
    );
  }
}
