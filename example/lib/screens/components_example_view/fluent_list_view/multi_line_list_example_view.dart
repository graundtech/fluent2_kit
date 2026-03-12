import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class ExampleListUser {
  final String name;
  final String text;
  final Widget trailing;
  final String coverImageUrl;
  final String? aditionalText;

  ExampleListUser({
    required this.name,
    required this.text,
    required this.trailing,
    this.aditionalText,
    required this.coverImageUrl,
  });
}

class MultiLineListExampleView extends StatelessWidget {
  MultiLineListExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final exampleListUsers = [
      ExampleListUser(
        name: "Bessie Cooper",
        text: "You: Let's do it",
        coverImageUrl: 'assets/images/avatars/avatar1.jpeg',
        trailing: FluentText(
          "1m ago",
          style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
        ),
      ),
      ExampleListUser(
          name: "Darrel Steward",
          text: "Sounds good -- thanks!",
          coverImageUrl: 'assets/images/avatars/avatar2.jpeg',
          trailing: FluentText(
            "3:19 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "Katri Ahokas",
          text: "Sure thing :)",
          coverImageUrl: 'assets/images/avatars/avatar3.jpeg',
          trailing: FluentText(
            "2:30 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "Juliet Finch",
          text: "i am available for a sync when you",
          coverImageUrl: 'assets/images/avatars/avatar4.jpeg',
          trailing: FluentText(
            "2:13 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "jon Harrington",
          text: "Thanks, i will respond to the request",
          coverImageUrl: 'assets/images/avatars/avatar5.jpeg',
          trailing: FluentText(
            "1:59 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
        name: "Darrel Steward",
        text: "Amazing! Thanks!",
        trailing: FluentText(
          "4:02 PM",
          style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
        ),
        coverImageUrl: 'assets/images/avatars/avatar3.jpeg',
      ),
      ExampleListUser(
        name: "Jane Cooper",
        text: "Product design",
        trailing: FluentIcon(FluentIcons.chevron_right_12_filled),
        aditionalText: "Office",
        coverImageUrl: 'assets/images/avatars/avatar1.jpeg',
      )
    ];

    return FluentContainer(
      padding: EdgeInsets.only(top: FluentSize.size120.value),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FluentText(
              "Multi-line",
              style: FluentThemeDataModel.of(context).fluentTextTheme?.title2,
            ),
            FluentText(
              "Lists organize data in rows.",
              style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
            ),
            FluentList.multiLine(
              sectionHeaderTitle: "Messages",
              separator: FluentStrokeDivider(
                height: 0,
              ),
              listItems: [
                ...exampleListUsers.map(
                  (user) => FluentListItemMultiLine(
                    text: user.name,
                    subtext: user.text,
                    trailing: user.trailing,
                    leading: FluentAvatar(
                      child: Image.asset(
                        user.coverImageUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FluentList.multiLine(
              sectionHeaderTitle: "Recent Files",
              separator: FluentStrokeDivider(),
              listItems: [
                FluentListItemMultiLine(
                  text: "S&A Brainstorm",
                  subtext: "Audrey Webb sent • 2 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground3Rest),
                          )),
                ),
                FluentListItemMultiLine(
                  text: "FY25 Sales Projection",
                  subtext: "Kristine Mitchell sent • 3 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground3Rest),
                          )),
                ),
                FluentListItemMultiLine(
                  text: "Edge Brand growth MSAI ",
                  subtext: "Aubrey Edwards sent • 3 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground3Rest),
                          )),
                ),
                FluentListItemMultiLine(
                  text: "Design hiring matrix",
                  subtext: "Dustin Steward sent • 4 days ago",
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                                FluentColors.neutralForeground2Rest,
                                FluentDarkColors.neutralForeground3Rest),
                          )),
                  leading: FluentIcon(FluentIcons.square_12_filled),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
