import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentListItemMultiLine extends StatelessWidget {
  final TextOverflow? textTextOverflow;
  final int? textMaxLines;
  final Widget? leading;
  final double? leadingBoxSize;
  final Widget? trailing;
  final double? trailingHeight;
  final String? text;
  final String? subtext;
  final Widget? additionalContent;
  final Color? tileColor;
  final void Function()? onTap;
  final void Function()? onLongPress;

  /// FluentList's constructor
  const FluentListItemMultiLine({
    super.key,
    this.leading,
    this.textMaxLines,
    this.textTextOverflow,
    this.trailingHeight = 40,
    this.trailing,
    this.tileColor,
    this.text,
    this.leadingBoxSize = 40,
    this.onTap,
    this.onLongPress,
    this.subtext,
    this.additionalContent,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final text = this.text;
    final subtext = this.subtext;
    final additionalContent = this.additionalContent;

    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: FluentSize.size160.value,
        vertical: FluentSize.size120.value,
      ),
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      onLongPress: onLongPress,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            additionalContent != null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            FluentContainer(
              width: leadingBoxSize,
              height: leadingBoxSize,
              child: leading,
            ),
            SizedBox(width: FluentSize.size160.value),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (text != null)
                  FluentText(
                    text,
                    maxLines: textMaxLines,
                    textOverflow: textTextOverflow,
                    style: FluentThemeDataModel.of(
                      context,
                    ).fluentTextTheme?.body1?.fluentCopyWith(
                      fluentColor: colorMode(
                        FluentColors.neutralForeground1Rest,
                        FluentDarkColors.neutralForeground1Rest,
                      ),
                    ),
                  ),
                if (subtext != null)
                  Padding(
                    padding: EdgeInsets.only(right: FluentSize.size40.value),
                    child: FluentText(
                      subtext,
                      textOverflow: TextOverflow.ellipsis,
                      style: FluentThemeDataModel.of(
                        context,
                      ).fluentTextTheme?.caption1?.fluentCopyWith(
                        fluentColor: colorMode(
                          FluentColors.neutralForeground2Rest,
                          FluentDarkColors.neutralForeground2Rest,
                        ),
                      ),
                    ),
                  ),
                if (additionalContent != null) additionalContent,
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: FluentSize.size80.value),
            FluentContainer(height: trailingHeight, child: trailing),
          ],
        ],
      ),
    );
  }
}
