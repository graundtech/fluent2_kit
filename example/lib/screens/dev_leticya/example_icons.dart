import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class ExampleIcons extends StatelessWidget {
  ExampleIcons({super.key});

  final List<String> iconVariants = [
    'Filled',
    'Accent Color',
    'Outline Icon',
    'Outline Primary Color',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: FluentSize.size280.value,
        horizontal: FluentSize.size160.value,
      ),
      child: Column(
        children: [
          FluentText('Here are the fluent icons variations'),
          SizedBox(
            height: FluentSize.size60.value,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: FluentSize.size40.value,
              children: iconVariants
                  .map(
                    (variant) => FluentContainer(
                      color: Theme.of(context)
                          .primaryColor
                          .withAlpha((0.2 * 255).round()),
                      padding: EdgeInsets.symmetric(
                          horizontal: FluentSize.size20.value,
                          vertical: FluentSize.size40.value),
                      cornerRadius: FluentCornerRadius.medium,
                      child: FluentText(variant,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.caption2),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: FluentSize.size200.value,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluentIcon(
                    FluentIcons.person_12_filled,
                  ),
                  SizedBox(
                    width: 50,
                    child: FluentText(
                      'filled',
                      textAlign: TextAlign.center,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption2,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluentIcon.accentIcon(
                    FluentIcons.person_12_filled,
                  ),
                  SizedBox(
                    width: 50,
                    child: FluentText(
                      'accent Icon',
                      textAlign: TextAlign.center,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption2,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluentIcon.outlineIcon(
                      colorScheme: Colors.indigo,
                      FluentIcons.person_12_regular),
                  SizedBox(
                    width: 50,
                    child: FluentText(
                      'outline Icon',
                      textAlign: TextAlign.center,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption2,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluentIcon.outlinedPrimaryIcon(
                    FluentIcons.person_12_regular,
                  ),
                  SizedBox(
                    width: 50,
                    child: FluentText(
                      'outline Primary Icon',
                      textAlign: TextAlign.center,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          FluentContainer(
            color: FluentColors.neutralBackground5Rest,
            padding: EdgeInsets.all(FluentSize.size80.value),
            cornerRadius: FluentCornerRadius.large,
            shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow4,
            margin: EdgeInsets.only(
              right: FluentSize.size160.value,
              left: FluentSize.size160.value,
              top: FluentSize.size160.value,
            ),
            child: Column(
              children: [
                FluentText(
                  'Exemplo com outlineIcon com colorScheme pink, dentro de um avatar',
                  textAlign: TextAlign.center,
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.caption2
                      ?.fluentCopyWith(
                          fluentColor: Colors.pink.shade700,
                          fluentWeight: FluentFontWeight.semibold),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentAvatar(
                  size: FluentAvatarSize.size36,
                  child: FluentIcon.outlineIcon(
                    FluentIcons.person_12_regular,
                    colorScheme: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          FluentContainer(
            color: FluentColors.neutralBackground5Rest,
            padding: EdgeInsets.all(FluentSize.size80.value),
            cornerRadius: FluentCornerRadius.large,
            shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow4,
            margin: EdgeInsets.only(
              right: FluentSize.size160.value,
              left: FluentSize.size160.value,
              top: FluentSize.size160.value,
            ),
            child: Column(
              children: [
                FluentText(
                  'Exemplo com accentIcon com colorScheme pink, dentro de um avatar',
                  textAlign: TextAlign.center,
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.caption2
                      ?.fluentCopyWith(
                          fluentColor: Colors.pink.shade700,
                          fluentWeight: FluentFontWeight.semibold),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentAvatar(
                  size: FluentAvatarSize.size36,
                  child: FluentIcon.accentIcon(
                    FluentIcons.person_12_filled,
                    colorScheme: Colors.pink,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
