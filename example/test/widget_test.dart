// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/my_app.dart';
import 'package:example/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final routes = <String>[
    Routes.fluentListView,
    Routes.fluentAvatarView,
    Routes.fluentButtonView,
    Routes.fluentBannerView,
    Routes.fluentCardView,
    Routes.fluentToastView,
    Routes.fluentProgressIndicatorsView,
    Routes.fluentControlsView,
    Routes.shadowView,
    Routes.shapesView,
    Routes.sizeView,
    Routes.typographyView,
  ];

  for (String route in routes) {
    testWidgets('Pump MyApp with ${route}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp(
        home: buildByRoute(route),
      ));
    });
  }
}

Widget buildByRoute(String route) {
  return Builder(
    builder: (context) {
      return Routes.routingTable[route]!(context);
    },
  );
}
