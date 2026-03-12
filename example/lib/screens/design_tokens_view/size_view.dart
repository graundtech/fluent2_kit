import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class SizeExample {
  final String name;
  final String value;
  final FluentSize size;

  SizeExample({
    required this.name,
    required this.value,
    required this.size,
  });
}

class SizeView extends StatelessWidget {
  const SizeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    final sizes = [
      SizeExample(name: "size20", value: '2', size: FluentSize.size20),
      SizeExample(name: "size40", value: '4', size: FluentSize.size40),
      SizeExample(name: "size60", value: '6', size: FluentSize.size60),
      SizeExample(name: "size80", value: '8', size: FluentSize.size80),
      SizeExample(name: "size100", value: '10', size: FluentSize.size100),
      SizeExample(name: "size120", value: '12', size: FluentSize.size120),
      SizeExample(name: "size160", value: '16', size: FluentSize.size160),
      SizeExample(name: "size200", value: '20', size: FluentSize.size200),
      SizeExample(name: "size240", value: '24', size: FluentSize.size240),
      SizeExample(name: "size280", value: '28', size: FluentSize.size280),
      SizeExample(name: "size320", value: '32', size: FluentSize.size320),
      SizeExample(name: "size360", value: '36', size: FluentSize.size360),
      SizeExample(name: "size400", value: '40', size: FluentSize.size400),
      SizeExample(name: "size480", value: '48', size: FluentSize.size480),
      SizeExample(name: "size520", value: '52', size: FluentSize.size520),
      SizeExample(name: "size560", value: '56', size: FluentSize.size560),
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Sizes",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: FluentContainer(
        color: colorMode(
          FluentColors.neutralBackgroundCanvasRest,
          FluentDarkColors.neutralBackgroundCanvasRest,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionHeader(title: "Fluent Spacing"),
              FluentCardContainer(
                shadow: FluentThemeDataModel.of(context)
                    .fluentShadowTheme
                    ?.shadow16,
                margin:
                    EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
                padding: EdgeInsets.all(FluentSize.size120.value),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FluentContainer(
                      strokeStyle: FluentStrokeStyle(
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth10),
                      child: FluentText(
                        "Page Title",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.title1,
                      ),
                    ),
                    FluentContainer(
                      color: FluentColors.of(context)?.brandBackgroundTintRest,
                      height: FluentSize.size240.value,
                      width: double.maxFinite,
                      child: FluentText(
                        "24px",
                        textAlign: TextAlign.end,
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption2,
                      ),
                    ),
                    FluentContainer(
                      strokeStyle: FluentStrokeStyle(
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth10),
                      child: FluentText(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                        "Ut enim ad minim veniam.",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.body2,
                      ),
                    ),
                    FluentContainer(
                      color: FluentColors.of(context)?.brandBackgroundTintRest,
                      height: FluentSize.size320.value,
                      width: double.maxFinite,
                      child: FluentText(
                        "32px",
                        textAlign: TextAlign.end,
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption2,
                      ),
                    ),
                    FluentContainer(
                      strokeStyle: FluentStrokeStyle(
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth10),
                      child: FluentContainer(
                        padding: EdgeInsets.all(FluentSize.size80.value),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.store_microsoft_16_filled,
                                  size: FluentSize.size160.value,
                                ),
                                FluentContainer(
                                  color: FluentColors.of(context)
                                      ?.brandBackgroundTintRest,
                                  width: FluentSize.size80.value,
                                  height: FluentSize.size80.value,
                                ),
                                FluentText("Item 1"),
                              ],
                            ),
                            SizedBox(width: FluentSize.size120.value),
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.store_microsoft_16_filled,
                                  size: FluentSize.size160.value,
                                ),
                                FluentContainer(
                                  color: FluentColors.of(context)
                                      ?.brandBackgroundTintRest,
                                  width: FluentSize.size80.value,
                                  height: FluentSize.size80.value,
                                ),
                                FluentText("Item 2"),
                              ],
                            ),
                            SizedBox(width: FluentSize.size120.value),
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.store_microsoft_16_filled,
                                  size: FluentSize.size160.value,
                                ),
                                FluentContainer(
                                  color: FluentColors.of(context)
                                      ?.brandBackgroundTintRest,
                                  width: FluentSize.size80.value,
                                  height: FluentSize.size80.value,
                                ),
                                FluentText("Item 3"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    FluentContainer(
                      color: FluentColors.of(context)?.brandBackgroundTintRest,
                      height: FluentSize.size480.value,
                      width: double.maxFinite,
                      child: FluentText(
                        "48px",
                        textAlign: TextAlign.end,
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption2,
                      ),
                    ),
                  ],
                ),
              ),
              FluentCardContainer(
                shadow: FluentThemeDataModel.of(context)
                    .fluentShadowTheme
                    ?.shadow16,
                constraints: BoxConstraints(maxWidth: 116),
                padding: EdgeInsets.symmetric(
                  vertical: FluentSize.size160.value,
                ),
                margin: EdgeInsets.only(
                  top: FluentSize.size160.value,
                  left: FluentSize.size160.value,
                  right: FluentSize.size160.value,
                ),
                child: Wrap(
                  children: [
                    FluentContainer(
                      alignment: Alignment.center,
                      color: FluentColors.of(context)?.brandBackground1Rest,
                      cornerRadius: FluentCornerRadius.small,
                      width: FluentSize.size120.value,
                      child: FluentText(
                        "12",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption2
                            ?.fluentCopyWith(
                                fluentColor: Colors.white, fluentSize: 10),
                      ),
                    ),
                    FluentContainer(
                      strokeStyle: FluentStrokeStyle(
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth10),
                      child: Icon(FluentIcons.share_20_filled),
                    ),
                    FluentContainer(
                      alignment: Alignment.center,
                      color: FluentColors.of(context)?.brandBackground1Rest,
                      cornerRadius: FluentCornerRadius.small,
                      width: FluentSize.size80.value,
                      child: FluentText(
                        "8",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption1Strong
                            ?.fluentCopyWith(
                              fluentColor: Colors.white,
                            ),
                      ),
                    ),
                    FluentContainer(
                      strokeStyle: FluentStrokeStyle(
                          color: FluentColors.of(context)?.brandBackground1Rest,
                          thickness: FluentStrokeThickness.strokeWidth10),
                      child: FluentText(
                        "Share",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.title3,
                      ),
                    ),
                    FluentContainer(
                      alignment: Alignment.center,
                      color: FluentColors.of(context)?.brandBackground1Rest,
                      cornerRadius: FluentCornerRadius.small,
                      width: FluentSize.size120.value,
                      child: FluentText(
                        "12",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.caption2
                            ?.fluentCopyWith(
                                fluentColor: Colors.white, fluentSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: FluentSize.size240.value,
              ),
              for (SizeExample size in sizes) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FluentSize.size160.value,
                    vertical: FluentSize.size120.value,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FluentContainer(
                            cornerRadius: FluentCornerRadius.medium,
                            padding: EdgeInsets.all(FluentSize.size20.value),
                            color: colorMode(
                              FluentColors.neutralBackground2Pressed,
                              FluentDarkColors.neutralBackground2Pressed,
                            ),
                            child: FluentText(
                              "Token: ${size.name}",
                              style: FluentThemeDataModel.of(context)
                                  .fluentTextTheme
                                  ?.caption1,
                            ),
                          ),
                          SizedBox(width: FluentSize.size80.value),
                          FluentContainer(
                            cornerRadius: FluentCornerRadius.medium,
                            padding: EdgeInsets.all(FluentSize.size20.value),
                            color: colorMode(
                              FluentColors.neutralBackground2Pressed,
                              FluentDarkColors.neutralBackground2Pressed,
                            ),
                            child: FluentText(
                              "Value: ${size.value}",
                              style: FluentThemeDataModel.of(context)
                                  .fluentTextTheme
                                  ?.caption1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: FluentSize.size480.value),
                      FluentContainer(
                        color: FluentColors.of(context)?.brandBackground1Rest,
                        cornerRadius: FluentCornerRadius.small,
                        height: FluentSize.size280.value,
                        width: size.size.value,
                      )
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
