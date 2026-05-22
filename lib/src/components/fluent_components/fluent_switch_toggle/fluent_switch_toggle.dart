import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

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
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: FluentColors.of(context)?.brandBackground1Rest,
      inactiveTrackColor: colorMode(
        FluentColors.neutralBackground5Rest,
        FluentDarkColors.neutralBackground5Rest,
      ),
    );
  }
}
