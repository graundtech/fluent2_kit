import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentChip extends StatelessWidget {
  final Widget? avatar;
  final Widget? icon;
  final FluentChipColor chipColor;
  final FluentChipColorStyle chipColorsStyle;
  final String text;

  const FluentChip.person({
    super.key,
    this.avatar,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  }) : icon = null;

  const FluentChip.icon({
    super.key,
    required this.icon,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  }) : avatar = null;

  const FluentChip.none({
    super.key,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  })  : avatar = null,
        icon = null;

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final textColor = switch (chipColorsStyle) {
      FluentChipColorStyle.tint => switch (chipColor) {
          FluentChipColor.brand =>
            FluentColors.of(context)?.brandForegroundTintRest,
          FluentChipColor.danger => colorMode(
              FluentColors.statusDangerForeground1Rest,
              FluentDarkColors.statusDangerForeground1Rest,
            ),
          FluentChipColor.severe => colorMode(
              FluentColors.statusSevereForeground1Rest,
              FluentDarkColors.statusSevereForeground1Rest,
            ),
          FluentChipColor.warning => colorMode(
              FluentColors.statusWarningForeground1Rest,
              FluentDarkColors.statusWarningForeground1Rest,
            ),
          FluentChipColor.success => colorMode(
              FluentColors.statusSuccessForeground1Rest,
              FluentDarkColors.statusSuccessForeground1Rest,
            ),
          FluentChipColor.neutral => colorMode(
              FluentColors.neutralForeground2Rest,
              FluentDarkColors.neutralForeground2Rest,
            ),
        },
      FluentChipColorStyle.filled => chipColor == FluentChipColor.neutral
          ? colorMode(
              FluentColors.neutralForeground1Rest,
              FluentDarkColors.neutralForeground1Rest,
            )
          : colorMode(
              FluentColors.neutralForegroundStaticLightRest,
              FluentDarkColors.neutralForegroundStaticLightRest,
            ),
      FluentChipColorStyle.disabled => colorMode(
          FluentColors.neutralForegroundDisabled1Rest,
          FluentDarkColors.neutralForegroundDisabled1Rest,
        ),
    };
    final backgroundColor = switch (chipColorsStyle) {
      FluentChipColorStyle.tint => switch (chipColor) {
          FluentChipColor.brand =>
            FluentColors.of(context)?.brandBackgroundTintRest,
          FluentChipColor.danger => colorMode(
              FluentColors.statusDangerBackground1Rest,
              FluentDarkColors.statusDangerBackground1Rest,
            ),
          FluentChipColor.severe => colorMode(
              FluentColors.statusSevereBackground1Rest,
              FluentDarkColors.statusSevereBackground1Rest,
            ),
          FluentChipColor.warning => colorMode(
              FluentColors.statusWarningBackground1Rest,
              FluentDarkColors.statusWarningBackground1Rest,
            ),
          FluentChipColor.success => colorMode(
              FluentColors.statusSuccessBackground1Rest,
              FluentDarkColors.statusSuccessBackground1Rest,
            ),
          FluentChipColor.neutral => colorMode(
              FluentColors.neutralBackground5Rest,
              FluentDarkColors.neutralBackground5Rest,
            ),
        },
      FluentChipColorStyle.filled => switch (chipColor) {
          FluentChipColor.brand =>
            FluentColors.of(context)?.brandBackground1Rest,
          FluentChipColor.danger => colorMode(
              FluentColors.statusDangerBackground2Rest,
              FluentDarkColors.statusDangerBackground2Rest,
            ),
          FluentChipColor.severe => colorMode(
              FluentColors.statusSevereBackground2Rest,
              FluentDarkColors.statusSevereBackground2Rest,
            ),
          FluentChipColor.warning => colorMode(
              FluentColors.statusWarningBackground2Rest,
              FluentDarkColors.statusWarningBackground2Rest,
            ),
          FluentChipColor.success => colorMode(
              FluentColors.statusSuccessBackground2Rest,
              FluentDarkColors.statusSuccessBackground2Rest,
            ),
          FluentChipColor.neutral => colorMode(
              FluentColors.neutralBackground5Selected,
              FluentDarkColors.neutralBackground5Selected,
            ),
        },
      FluentChipColorStyle.disabled => colorMode(
          FluentColors.neutralBackground5Rest,
          FluentDarkColors.neutralBackground5Rest,
        ),
    };

    final avatar = this.avatar;
    final icon = this.icon;
    return FluentContainer(
      cornerRadius: FluentCornerRadius.medium,
      color: backgroundColor,
      height: 24,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (avatar != null)
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: avatar,
                ),
              ),
            if (icon != null)
              IconTheme(
                data: IconThemeData(color: textColor, size: 16),
                child: icon,
              ),
            if (avatar != null || icon != null)
              SizedBox(
                width: 8,
              ),
            FluentText(
              text,
              style: FluentThemeDataModel.of(context)
                  .fluentTextTheme
                  ?.body2
                  ?.fluentCopyWith(
                    fluentColor: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

enum FluentChipColor {
  brand,
  danger,
  severe,
  warning,
  success,
  neutral,
}

enum FluentChipColorStyle {
  tint,
  filled,
  disabled,
}
