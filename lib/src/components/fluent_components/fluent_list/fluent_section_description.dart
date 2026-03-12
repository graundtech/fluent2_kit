import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentSectionDescription extends StatelessWidget {
  final Widget? leading;
  final String description;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;

  /// FluentSectionDescription's constructor
  const FluentSectionDescription({
    required this.description,
    super.key,
    this.leading,
    this.backgroundColor,
    this.padding,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final leading = this.leading;
    return FluentContainer(
      color: backgroundColor,
      width: double.infinity,
      padding: padding ??
          EdgeInsets.only(
            top: FluentSize.size240.value,
            right: FluentSize.size160.value,
            bottom: FluentSize.size80.value,
            left: FluentSize.size160.value,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading is Icon) ...[
            IconTheme(
              data: IconThemeData(
                color: foregroundColor ??
                    colorMode(
                      FluentColors.neutralForeground2Rest,
                      FluentDarkColors.neutralForeground2Rest,
                    ),
                size: FluentSize.size160.value,
              ),
              child: leading,
            ),
            SizedBox(width: FluentSize.size120.value)
          ],
          if (leading != null && leading is! Icon) ...[
            Container(
              width: FluentSize.size160.value,
              height: FluentSize.size160.value,
              child: leading,
            ),
            SizedBox(width: FluentSize.size120.value)
          ],
          Expanded(
            child: FluentText(
              description,
              style: FluentThemeDataModel.of(context)
                  .fluentTextTheme
                  ?.caption1
                  ?.fluentCopyWith(
                    fluentColor: foregroundColor ??
                        colorMode(
                          FluentColors.neutralForeground2Rest,
                          FluentDarkColors.neutralForeground2Rest,
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
