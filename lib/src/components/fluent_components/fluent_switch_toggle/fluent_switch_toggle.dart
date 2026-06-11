import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent2_kit/src/components/fluent_components/fluent_nav_bar/fluent_navbar_action_scope.dart';

class FluentSwitchToggle extends StatelessWidget {
  final bool value;
  final void Function(bool value)? onChanged;

  const FluentSwitchToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final isInBrandNavBarAction =
        FluentNavBarActionScope.maybeOf(context)?.themeColorVariation ==
        FluentThemeColorVariation.brand;

    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: FluentColors.of(context)?.brandBackground1Rest,
      inactiveTrackColor: colorMode(
        FluentColors.neutralBackground5Rest,
        FluentDarkColors.neutralBackground5Rest,
      ),
      trackOutlineColor: isInBrandNavBarAction
          ? WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorMode(
                  FluentColors.controlsNavBarForeground1Rest,
                  FluentDarkColors.controlsNavBarForeground1Rest,
                );
              }
              return null;
            })
          : null,
      trackOutlineWidth: isInBrandNavBarAction
          ? WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return FluentStrokeThickness.strokeWidth10.value;
              }
              return null;
            })
          : null,
    );
  }
}
