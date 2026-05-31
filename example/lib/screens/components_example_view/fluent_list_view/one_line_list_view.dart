import 'package:example/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class OneLineListExampleView extends StatefulWidget {
  const OneLineListExampleView({super.key});

  @override
  State<OneLineListExampleView> createState() => _OneLineListExampleViewState();
}

class _OneLineListExampleViewState extends State<OneLineListExampleView> {
  bool optionalConnectedExperiences1 = true;
  bool optionalConnectedExperiences2 = true;

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return SafeArea(
      child: FluentContainer(
        color: colorMode(FluentColors.neutralBackgroundCanvasRest,
            FluentDarkColors.neutralBackgroundCanvasRest),
        width: double.maxFinite,
        padding: EdgeInsets.only(top: FluentSize.size120.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentText(
                "One-line",
                style: FluentThemeDataModel.of(context).fluentTextTheme?.title2,
              ),
              FluentText("Lists organize data in rows.",
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.caption1),
              FluentList.oneLine(
                sectionHeaderTitle: "Notifications",
                separator: FluentStrokeDivider(
                  startIndent: FluentStrokeBorderIndent.strokeIndent16,
                ),
                listItems: [
                  FluentListItemOneLine(
                    text: " Text",
                    leading: FluentIcon(FluentIcons.alert_12_regular),
                  ),
                  FluentListItemOneLine(
                    text: "New Replies",
                    leading: FluentIcon(FluentIcons.alert_12_regular),
                  ),
                  FluentListItemOneLine(
                    text: "Slides Edits",
                    leading: FluentIcon(FluentIcons.alert_12_regular),
                  )
                ],
              ),
              FluentList.oneLine(
                sectionHeaderTitle: "Preferences",
                separator: FluentStrokeDivider(),
                listItems: [
                  FluentListItemOneLine(
                    text: "FY24 Planning",
                  ),
                  FluentListItemOneLine(
                    text: "Optional Connected Experiences",
                  ),
                  FluentListItemOneLine(
                    text: "Tagged",
                  ),
                  FluentListItemOneLine(
                    text: "Clear Search History",
                    textColor: colorMode(
                        FluentColors.statusDangerForeground2Rest,
                        FluentDarkColors.statusDangerForeground2Rest),
                    trailing: FluentIcon(
                      FluentIcons.chevron_right_20_filled,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(Routes.clearSearchHistoryView);
                    },
                  ),
                ],
              ),
              FluentList.oneLine(
                sectionHeaderTitle: "Connected experiences",
                sectionHeaderTitleVariant: SectionHeaderTitleVariant.subtle,
                listItems: [
                  FluentListItemOneLine(
                    text: "Optional Connected Experiences",
                    trailing: FluentSwitchToggle(
                      value: optionalConnectedExperiences1,
                      onChanged: (value) {
                        setState(() {
                          optionalConnectedExperiences1 = value;
                        });
                      },
                    ),
                  ),
                  FluentListItemOneLine(
                    text: "Optional Connected Experiences",
                    trailing: FluentSwitchToggle(
                      value: optionalConnectedExperiences2,
                      onChanged: (value) {
                        setState(() {
                          optionalConnectedExperiences2 = value;
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
