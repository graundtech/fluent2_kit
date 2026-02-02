import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class TextFieldTrailingIcon extends StatelessWidget {
  final void Function() onTapCancelIcon;
  final Widget? suffixIcon;
  final bool isNotEmpty;
  final bool hasFocus;

  TextFieldTrailingIcon({
    super.key,
    required this.hasFocus,
    required this.isNotEmpty,
    required this.onTapCancelIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final suffixIcon = this.suffixIcon;

    final Widget trailingWidget = suffixIcon != null
        ? IconTheme(
            data: IconThemeData(
              size: FluentSize.size240.value,
              color: colorMode(
                FluentColors.neutralForeground2Rest,
                FluentDarkColors.neutralForeground2Rest,
              ),
            ),
            child: suffixIcon,
          )
        : SizedBox();

    return FluentContainer(
      child: isNotEmpty && hasFocus
          ? GestureDetector(
              onTap: onTapCancelIcon,
              child: Icon(
                FluentIcons.dismiss_circle_24_filled,
                size: FluentSize.size240.value,
                color: colorMode(
                  FluentColors.neutralForeground3Rest,
                  FluentDarkColors.neutralForeground3Rest,
                ),
              ),
            )
          : trailingWidget,
    );
  }
}
