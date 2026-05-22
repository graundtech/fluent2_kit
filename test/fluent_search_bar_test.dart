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

void main() {
  testWidgets(
    'tapping "Cancelar" clears the text and unfocuses the input',
    (tester) async {
      await tester.pumpWidget(
        _harness(
          FluentSearchBar.leftAligned(
            onSearch: (_) async {},
            onCancelOperation: () {},
          ),
        ),
      );

      final textFieldFinder = find.byType(TextField);
      final focusNode = tester.widget<TextField>(textFieldFinder).focusNode!;
      final textController =
          tester.widget<TextField>(textFieldFinder).controller!;

      // Focus and type. enterText() focuses the field and fires onChanged,
      // which schedules the 800ms debouncer. The debouncer eventually calls
      // setState, which is what makes the "Cancelar" button appear.
      await tester.enterText(textFieldFinder, 'hello');
      await tester.pump(const Duration(milliseconds: 850));

      expect(focusNode.hasFocus, isTrue, reason: 'field should be focused');
      expect(textController.text, 'hello');
      expect(find.text('Cancelar'), findsOneWidget);

      // The change under test: tap Cancelar.
      await tester.tap(find.text('Cancelar'));
      await tester.pump();

      expect(textController.text, isEmpty, reason: 'text should be cleared');
      expect(focusNode.hasFocus, isFalse,
          reason: 'field should lose focus after Cancelar');
      expect(find.text('Cancelar'), findsNothing,
          reason: 'Cancelar button should disappear once unfocused and empty');
    },
  );
}
