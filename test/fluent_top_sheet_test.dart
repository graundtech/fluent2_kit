import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent2_kit/theme_data.dart';

Widget _harness(Widget child) {
  return MaterialApp(
    theme: theme,
    home: FluentProvider(
      child: Scaffold(body: child),
    ),
  );
}

Widget _opener() {
  return Builder(
    builder: (context) => Center(
      child: ElevatedButton(
        onPressed: () => showFluentTopSheet(
          context: context,
          headerTitle: const Text('Header'),
          child: const Text('Top sheet body'),
        ),
        child: const Text('open'),
      ),
    ),
  );
}

void main() {
  testWidgets('opens, reveals header and body', (tester) async {
    await tester.pumpWidget(_harness(_opener()));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Top sheet body'), findsOneWidget);
  });

  testWidgets('tapping the scrim closes the sheet', (tester) async {
    await tester.pumpWidget(_harness(_opener()));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Top sheet body'), findsOneWidget);

    // The scrim covers the area below the (short) sheet; tap near the bottom.
    await tester.tapAt(const Offset(400, 580));
    await tester.pumpAndSettle();

    expect(find.text('Top sheet body'), findsNothing);
  });

  testWidgets('swiping the header up dismisses the sheet', (tester) async {
    await tester.pumpWidget(_harness(_opener()));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Header'), findsOneWidget);

    await tester.drag(find.text('Header'), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(find.text('Header'), findsNothing);
  });
}
