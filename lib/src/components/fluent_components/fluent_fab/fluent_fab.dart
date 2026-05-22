import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

part 'fluent_fab_style_variants/build_fluent_fab_accent_style.dart';
part 'fluent_fab_style_variants/build_fluent_fab_subtle_style.dart';

enum FluentFabVariant { accent, subtle }

enum FluentFabSize { large, small }

class FluentFab extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback? onPressed;
  final FluentFabVariant variant;
  final FluentFabSize size;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? foregroundColor;

  const FluentFab({
    super.key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.variant = FluentFabVariant.accent,
    this.size = FluentFabSize.large,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final iconSize = FluentSize.size240.value;
    final gap = FluentSize.size80.value;
    final shadow = FluentThemeDataModel.of(context).fluentShadowTheme?.shadow8;
    final isEnabled = onPressed != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        boxShadow: isEnabled ? (shadow as MixedFluentShadow?)?.value : null,
      ),
      child: ElevatedButton(
        style: _getStyle(
          fabSize: size,
          fabVariant: variant,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          hasLabel: label != null,
          context: context,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize),
            if (label != null) ...[
              SizedBox(width: gap),
              FluentText(
                label,
                style: FluentThemeDataModel.of(context)
                    .fluentTextTheme
                    ?.body1Strong,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FluentFabStyle {
  final FluentFabSize size;
  final bool hasLabel;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? foregroundColor;

  _FluentFabStyle({
    required this.size,
    required this.hasLabel,
    this.backgroundColor,
    this.foregroundColor,
  });
}

ButtonStyle _getStyle({
  required FluentFabVariant fabVariant,
  required FluentFabSize fabSize,
  required bool hasLabel,
  required BuildContext context,
  WidgetStateProperty<Color?>? backgroundColor,
  WidgetStateProperty<Color?>? foregroundColor,
}) {
  final style = _FluentFabStyle(
    size: fabSize,
    hasLabel: hasLabel,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );
  return switch (fabVariant) {
    FluentFabVariant.accent => _buildFluentFabAccentStyle(style, context),
    FluentFabVariant.subtle => _buildFluentFabSubtleStyle(style, context),
  };
}

ButtonStyle _fluentFabDefaultStyle(_FluentFabStyle style) {
  final double pad = style.size == FluentFabSize.large
      ? FluentSize.size160.value
      : FluentSize.size120.value;
  final double minDim = style.size == FluentFabSize.large ? 56 : 48;
  final EdgeInsets padding = style.hasLabel
      ? EdgeInsets.fromLTRB(pad, pad, pad + FluentSize.size40.value, pad)
      : EdgeInsets.all(pad);

  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(minDim, minDim)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
    ),
    padding: WidgetStateProperty.all(padding),
    elevation: WidgetStateProperty.all(0),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
    animationDuration: Duration.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
