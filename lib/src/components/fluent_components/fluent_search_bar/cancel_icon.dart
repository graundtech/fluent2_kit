import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class CancelIcon extends StatelessWidget {
  final bool isLoading;
  final void Function() onTap;
  final FluentThemeColorVariation? themeColorVariation;

  const CancelIcon({
    super.key,
    this.isLoading = false,
    this.themeColorVariation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNeutral = themeColorVariation != null &&
        themeColorVariation == FluentThemeColorVariation.neutral;

    final colorMode = createColorMode(Theme.of(context).brightness);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: FluentSize.size240.value,
          height: FluentSize.size240.value,
          child: isLoading
              ? CircularProgressIndicator(
                  color: colorMode(
                    isNeutral
                        ? FluentColors.neutralForeground3Rest
                        : FluentDarkColors.neutralForeground1Rest,
                    FluentDarkColors.neutralForeground3Rest,
                  ),
                  strokeWidth: FluentStrokeThickness.strokeWidth20.value,
                )
              : null,
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.cancel,
            size: FluentSize.size200.value,
            color: colorMode(
              isNeutral
                  ? FluentColors.neutralForeground3Rest
                  : FluentDarkColors.neutralForeground1Rest,
              FluentDarkColors.neutralForeground2Rest,
            ),
          ),
        )
      ],
    );
  }
}
