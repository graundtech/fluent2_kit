import 'package:flutter/widgets.dart';
import 'package:fluent2_kit/src/fluent_models/fluent_theme_variation.dart';

class FluentNavBarActionScope extends InheritedWidget {
  final FluentThemeColorVariation themeColorVariation;

  const FluentNavBarActionScope({
    super.key,
    required this.themeColorVariation,
    required super.child,
  });

  static FluentNavBarActionScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FluentNavBarActionScope>();
  }

  @override
  bool updateShouldNotify(FluentNavBarActionScope oldWidget) {
    return themeColorVariation != oldWidget.themeColorVariation;
  }
}
