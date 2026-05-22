import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentSectionHeader extends StatelessWidget {
  final IconData? titleIcon;
  final FluentSectionHeaderActions? actions;
  final String title;
  final SectionHeaderTitleVariant? titleVariant;
  final Color? backgroundColor;

  /// FluentSectionHeader's constructor
  const FluentSectionHeader({
    required this.title,
    super.key,
    this.actions,
    this.titleIcon,
    this.backgroundColor,
    this.titleVariant = SectionHeaderTitleVariant.bold,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final actions = this.actions;
    final action1 = actions?.action1;
    final action2 = actions?.action2;

    return FluentContainer(
      color: backgroundColor,
      height: FluentSize.size480.value,
      padding: EdgeInsets.only(
        left: FluentSize.size160.value,
        right: FluentSize.size160.value,
        bottom: FluentSize.size80.value,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: [
                if (titleIcon != null) ...[
                  Icon(
                    titleIcon,
                    size: FluentSize.size240.value,
                    color: colorMode(
                      FluentColors.neutralForeground3Rest,
                      FluentDarkColors.neutralForeground3Rest,
                    ),
                  ),
                  SizedBox(width: FluentSize.size80.value),
                ],
                Expanded(
                  child: FluentText(
                    title,
                    textOverflow: TextOverflow.ellipsis,
                    style: titleVariant == SectionHeaderTitleVariant.bold
                        ? FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.body1Strong
                            ?.fluentCopyWith(
                                fluentColor: colorMode(
                                  FluentColors.neutralForeground1Rest,
                                  FluentDarkColors.neutralForeground1Rest,
                                ),
                                fluentWeight: FluentFontWeight.semibold)
                        : FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption1
                            ?.fluentCopyWith(
                              fluentColor: colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground2Rest,
                              ),
                            ),
                  ),
                )
              ],
            ),
          ),
          if (actions != null)
            Row(
              children: [
                if (action1 != null) ...[
                  if (action1 is Icon)
                    IconTheme.merge(
                        data: IconThemeData(size: FluentSize.size200.value),
                        child: action1)
                  else
                    action1,
                ],
                if (action2 != null) ...[
                  SizedBox(width: FluentSize.size200.value),
                  if (action2 is Icon)
                    IconTheme.merge(
                        data: IconThemeData(size: FluentSize.size200.value),
                        child: action2)
                  else
                    action2,
                ]
              ],
            ),
        ],
      ),
    );
  }
}

class FluentSectionHeaderActions {
  final Widget action1;
  final Widget? action2;

  final List<Widget?> value;

  /// FluentSectionHeaderActions's constructor
  FluentSectionHeaderActions({
    required this.action1,
    this.action2,
  }) : value = [action1, action2];
}

enum SectionHeaderTitleVariant { bold, subtle }
