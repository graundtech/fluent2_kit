import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent2_kit/theme_data.dart';

Widget _harness(Widget child) {
  return MaterialApp(
    theme: theme,
    home: FluentProvider(
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

Widget _otp({
  FluentOtpCodeFieldController? controller,
  int maxLength = FluentOtpCodeField.codeLength,
  bool enabled = true,
  bool hasError = false,
  void Function(String value)? onChanged,
  void Function(String value)? onCompleted,
}) {
  return FluentOtpCodeField(
    controller: controller,
    maxLength: maxLength,
    enabled: enabled,
    hasError: hasError,
    onChanged: onChanged,
    onCompleted: onCompleted,
    child: FluentOtpCodeGroup(
      children: [
        for (var index = 0; index < maxLength; index++) ...[
          if (index == 3) const FluentOtpCodeSeparator(),
          FluentOtpCodeSlot(index: index),
        ],
      ],
    ),
  );
}

Finder get _otpInput =>
    find.byKey(const ValueKey('fluent_otp_code_field_input'));

void main() {
  testWidgets('slots render characters by index and separator is present', (
    tester,
  ) async {
    final controller = FluentOtpCodeFieldController()
      ..textEditingController.text = '123456';

    await tester.pumpWidget(_harness(_otp(controller: controller)));

    for (var index = 1; index <= 6; index++) {
      expect(find.text('$index'), findsOneWidget);
    }
    expect(find.text('-'), findsOneWidget);

    controller.dispose();
  });

  testWidgets('accepts only numbers and limits the value to maxLength', (
    tester,
  ) async {
    final controller = FluentOtpCodeFieldController();

    await tester.pumpWidget(
      _harness(_otp(controller: controller, maxLength: 4)),
    );

    await tester.enterText(_otpInput, '12ab345678');
    await tester.pump();

    expect(controller.text, '1234');
    expect(find.text('1'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsNothing);

    controller.dispose();
  });

  testWidgets('handles pasted values longer than the OTP length', (
    tester,
  ) async {
    final controller = FluentOtpCodeFieldController();

    await tester.pumpWidget(_harness(_otp(controller: controller)));

    await tester.enterText(_otpInput, '9876543210');
    await tester.pump();

    expect(controller.text, '987654');

    controller.dispose();
  });

  testWidgets('calls onCompleted when the code reaches maxLength', (
    tester,
  ) async {
    final completedValues = <String>[];

    await tester.pumpWidget(_harness(_otp(onCompleted: completedValues.add)));

    await tester.enterText(_otpInput, '12345');
    await tester.pump();
    expect(completedValues, isEmpty);

    await tester.enterText(_otpInput, '123456');
    await tester.pump();
    expect(completedValues, ['123456']);

    await tester.enterText(_otpInput, '123456');
    await tester.pump();
    expect(completedValues, ['123456']);
  });

  testWidgets('controller clear empties the displayed code', (tester) async {
    final controller = FluentOtpCodeFieldController();

    await tester.pumpWidget(_harness(_otp(controller: controller)));

    await tester.enterText(_otpInput, '123456');
    await tester.pump();

    controller.clear();
    await tester.pump();

    expect(controller.text, isEmpty);
    expect(find.text('1'), findsNothing);

    controller.dispose();
  });

  testWidgets('disabled blocks editing', (tester) async {
    final controller = FluentOtpCodeFieldController()
      ..textEditingController.text = '123456';

    await tester.pumpWidget(
      _harness(_otp(controller: controller, enabled: false)),
    );

    final textField = tester.widget<TextField>(_otpInput);
    expect(textField.enabled, isFalse);

    await tester.enterText(_otpInput, '654321');
    await tester.pump();

    expect(controller.text, '123456');

    controller.dispose();
  });

  testWidgets('error state changes the slot border color', (tester) async {
    await tester.pumpWidget(_harness(_otp(hasError: true)));

    final slot = tester.widget<AnimatedContainer>(
      find.descendant(
        of: find.byKey(const ValueKey('fluent_otp_code_slot_0')),
        matching: find.byType(AnimatedContainer),
      ),
    );
    final decoration = slot.decoration as BoxDecoration;

    expect(
      decoration.border,
      Border.all(
        color: FluentColors.statusDangerStroke1Rest,
        width: FluentStrokeThickness.strokeWidth10.value,
      ),
    );
  });

  testWidgets('onChanged reports the current controlled value', (tester) async {
    final controller = FluentOtpCodeFieldController();
    String currentValue = "";

    await tester.pumpWidget(
      _harness(
        _otp(
          controller: controller,
          onChanged: (value) {
            currentValue = value;
          },
        ),
      ),
    );

    await tester.enterText(_otpInput, '22223');
    await tester.pump();

    expect(currentValue, '22223');
    expect(controller.text, '22223');

    controller.dispose();
  });
}
