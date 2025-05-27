import 'package:flutter/material.dart';
import 'package:isolates_mixins/common_files/route_navigation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNavigation.mixinPage);
              },
              child: Text('Mixins'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Isolates')),
          ],
        ),
      ),
    );
  }
}
