import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class InnerAspectRatioView extends StatefulWidget {
  const InnerAspectRatioView({super.key});

  @override
  State<InnerAspectRatioView> createState() => _InnerAspectRatioViewState();
}

class _InnerAspectRatioViewState extends State<InnerAspectRatioView> {
  double aspectRatio = 1.0;

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Inner Aspect Ratio",
          subtitle: "Components > Inner Aspect Ratio",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FluentSectionDescription(
              description:
                  "InnerAspectRatio enforces an aspect ratio on its child relative to the child's longest side.",
            ),
            FluentStrokeDivider(height: FluentSize.size320.value),
            Expanded(
              child: Center(
                child: InnerAspectRatio(
                  aspectRatio: aspectRatio,
                  child: FluentContainer(
                    cornerRadius: FluentCornerRadius.medium,
                    color: colorMode(
                      FluentColors.neutralBackground3Rest,
                      FluentDarkColors.neutralBackground3Rest,
                    ),
                    strokeStyle: FluentStrokeStyle(
                      color: colorMode(
                        FluentColors.neutralStroke1Rest,
                        FluentDarkColors.neutralStroke1Rest,
                      ),
                      thickness: FluentStrokeThickness.strokeWidth10,
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Center(
                        child: FluentText(
                          aspectRatio.toStringAsFixed(2),
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.body1Strong,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: FluentSize.size160.value,
                vertical: FluentSize.size160.value,
              ),
              child: Column(
                children: [
                  FluentText("Aspect ratio: ${aspectRatio.toStringAsFixed(2)}"),
                  Slider(
                    value: aspectRatio,
                    min: 0.5,
                    max: 2.0,
                    onChanged: (value) {
                      setState(() {
                        aspectRatio = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
