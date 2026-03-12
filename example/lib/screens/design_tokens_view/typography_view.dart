import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class TypographyItem {
  final String name;
  final FluentTextStyle? textStyle;

  TypographyItem({required this.name, required this.textStyle});
}

class TypographyView extends StatelessWidget {
  TypographyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    final typography = [
      TypographyItem(
        name: "caption 2",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.caption2,
      ),
      TypographyItem(
        name: "caption 1",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
      ),
      TypographyItem(
        name: "caption 1 strong",
        textStyle:
            FluentThemeDataModel.of(context).fluentTextTheme?.caption1Strong,
      ),
      TypographyItem(
        name: "body 2",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.body2,
      ),
      TypographyItem(
        name: "body 2 strong",
        textStyle:
            FluentThemeDataModel.of(context).fluentTextTheme?.body2Strong,
      ),
      TypographyItem(
        name: "body 1",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.body1,
      ),
      TypographyItem(
        name: "body 1 strong",
        textStyle:
            FluentThemeDataModel.of(context).fluentTextTheme?.body1Strong,
      ),
      TypographyItem(
        name: "title 3",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.title3,
      ),
      TypographyItem(
        name: "title 2",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.title2,
      ),
      TypographyItem(
        name: "title 1",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.title1,
      ),
      TypographyItem(
        name: "large title",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.largeTitle,
      ),
      TypographyItem(
        name: "display",
        textStyle: FluentThemeDataModel.of(context).fluentTextTheme?.display,
      )
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Typography",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ColoredBox(
            color: colorMode(FluentColors.neutralBackgroundCanvasRest,
                FluentDarkColors.neutralBackgroundCanvasRest),
            child: Column(
              children: [
                FluentSectionDescription(
                  description: "Clear typographical hierarchy organizes"
                      " and structures content, making it easy for people to find their way through an experience.",
                ),
                FluentStrokeDivider(height: FluentSize.size400.value),
                for (TypographyItem value in typography) ...[
                  FluentSectionHeader(title: value.name),
                  FluentCardContainer(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(
                        horizontal: FluentSize.size160.value),
                    padding: EdgeInsets.all(FluentSize.size160.value),
                    shadow: FluentThemeDataModel.of(context)
                        .fluentShadowTheme
                        ?.shadow4,
                    child: FluentText(
                      "This is ${value.name} text",
                      style: value.textStyle,
                    ),
                  ),
                  FluentSectionDescription(
                    description:
                        "weight: regular > size: 12pt ? line-height: 16pt",
                  ),
                  SizedBox(
                    height: FluentSize.size240.value,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
