// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isolates_mixins/common_files/route_navigation.dart';
import 'package:isolates_mixins/home_page.dart';

void main() {
  testWidgets('Home page with mixin and isolates', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          RouteNavigation.mixinPage:
              (context) => Scaffold(body: Text('Mixin Page')),
        },
        home: const MyHomePage(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Mixins'), findsOneWidget);
    expect(find.text('Isolates'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('Mixins'));
    await tester.pumpAndSettle();

    // await tester.tap(find.text('Isolates'));
    // await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('Mixin Page'), findsOneWidget);
    // expect(find.text('1'), findsOneWidget);
  });
}
