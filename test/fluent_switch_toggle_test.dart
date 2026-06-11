import 'package:flutter/cupertino.dart';
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

Widget _navBarHarness({
  required FluentThemeColorVariation themeColorVariation,
}) {
  return MaterialApp(
    theme: theme,
    home: FluentProvider(
      child: Scaffold(
        appBar: FluentNavBar(
          title: NavLeftSubtitle(title: 'Title', subtitle: 'Subtitle'),
          themeColorVariation: themeColorVariation,
          actions: [FluentSwitchToggle(value: true, onChanged: (_) {})],
        ),
        body: const SizedBox(),
      ),
    ),
  );
}

void main() {
  testWidgets('matches Fluent iOS switch color specification', (tester) async {
    await tester.pumpWidget(
      _harness(FluentSwitchToggle(value: true, onChanged: (_) {})),
    );

    final switchToggle = tester.widget<CupertinoSwitch>(
      find.byType(CupertinoSwitch),
    );
    final context = tester.element(find.byType(FluentSwitchToggle));
    final colorMode = createColorMode(Theme.of(context).brightness);

    expect(
      switchToggle.activeTrackColor,
      FluentColors.of(context)?.brandBackground1Rest,
      reason: 'Figma uses brand/background/1/rest for the on track.',
    );
    expect(
      switchToggle.inactiveTrackColor,
      colorMode(
        FluentColors.neutralBackground5Rest,
        FluentDarkColors.neutralBackground5Rest,
      ),
      reason: 'Figma uses neutral/background/5/rest for the off track.',
    );
    expect(
      switchToggle.trackOutlineColor,
      isNull,
      reason: 'The base Figma switch track has no explicit stroke.',
    );
    expect(switchToggle.trackOutlineWidth, isNull);
  });

  testWidgets('adds selected outline in brand nav bar actions', (tester) async {
    await tester.pumpWidget(
      _navBarHarness(themeColorVariation: FluentThemeColorVariation.brand),
    );

    final switchToggle = tester.widget<CupertinoSwitch>(
      find.byType(CupertinoSwitch),
    );
    final context = tester.element(find.byType(FluentSwitchToggle));
    final colorMode = createColorMode(Theme.of(context).brightness);

    expect(
      switchToggle.activeTrackColor,
      FluentColors.of(context)?.brandBackground1Rest,
    );
    expect(
      switchToggle.trackOutlineColor?.resolve({WidgetState.selected}),
      colorMode(
        FluentColors.controlsNavBarForeground1Rest,
        FluentDarkColors.controlsNavBarForeground1Rest,
      ),
    );
    expect(switchToggle.trackOutlineColor?.resolve({}), isNull);
    expect(
      switchToggle.trackOutlineWidth?.resolve({WidgetState.selected}),
      FluentStrokeThickness.strokeWidth10.value,
    );
    expect(switchToggle.trackOutlineWidth?.resolve({}), isNull);
  });

  testWidgets('keeps neutral nav bar actions on the base switch spec', (
    tester,
  ) async {
    await tester.pumpWidget(
      _navBarHarness(themeColorVariation: FluentThemeColorVariation.neutral),
    );

    final switchToggle = tester.widget<CupertinoSwitch>(
      find.byType(CupertinoSwitch),
    );

    expect(switchToggle.trackOutlineColor, isNull);
    expect(switchToggle.trackOutlineWidth, isNull);
  });
}
