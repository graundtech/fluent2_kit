import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentProgressIndicatorsView extends StatefulWidget {
  const FluentProgressIndicatorsView({super.key});

  @override
  State<FluentProgressIndicatorsView> createState() =>
      _FluentProgressIndicatorsViewState();
}

class _FluentProgressIndicatorsViewState
    extends State<FluentProgressIndicatorsView> {
  bool isUpdating = false;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future updateDate({bool showHUD = false}) async {
    bool canceled = false;

    Future tryUpdateDate({bool? setIsUpdatingToFalse}) async {
      final newDateTime = await fetchNewDateTime();
      if (!canceled && mounted) {
        setState(() {
          now = newDateTime;
          if (setIsUpdatingToFalse == true) {
            isUpdating = false;
          }
        });
      }
    }

    showProgressBar() {
      setState(() {
        isUpdating = true;
      });

      tryUpdateDate(setIsUpdatingToFalse: true);
    }

    if (showHUD) {
      final future = tryUpdateDate();

      FluentHeadsUpDisplayDialog(
        future: future,
        confirmStopMessage: "Não quer saber mais a data?",
        hud: FluentHeadsUpDisplay(
          text: "Atualizando Data...",
        ),
      ).show(context).then((_canceled) {
        if (_canceled == true) {
          canceled = true;
        }
      });
    } else {
      showProgressBar();
    }
  }

  Future<DateTime> fetchNewDateTime() async {
    await Future.delayed(Duration(seconds: 2));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Progress Indicators",
          subtitle: "Components > Fluent Progress Indicators",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (isUpdating)
              FluentProgressBar(
                value: null,
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size200.value),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: FluentSize.size120.value,
                children: [
                  FluentText(
                    "Data agora:",
                    style:
                        FluentThemeDataModel.of(context).fluentTextTheme?.body2,
                  ),
                  FluentContainer(
                    color: colorMode(FluentColors.neutralBackground1Pressed,
                        FluentDarkColors.neutralBackground1Pressed),
                    cornerRadius: FluentCornerRadius.medium,
                    padding: EdgeInsets.symmetric(
                      horizontal: FluentSize.size160.value,
                      vertical: FluentSize.size80.value,
                    ),
                    child: FluentText(
                      now.toString(),
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.body2,
                    ),
                  ),
                ],
              ),
            ),
            FluentSectionHeader(title: "Fluent Progress Bar"),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: FluentText(
                "A progress bar lets someone know there’s a background task in progress. Use progress bars for loading states that take longer than one second but avoid them for long loading processes.",
                style: FluentThemeDataModel.of(context).fluentTextTheme?.body2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
              child: FluentButton(
                title: "Atualizar data",
                onPressed: updateDate,
              ),
            ),
            FluentSectionHeader(title: "HUD"),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: FluentText(
                "The heads-up display, or HUD, is a progress indicator that appears on a backplate and can give additional text information about the background task that’s occurring.",
                style: FluentThemeDataModel.of(context).fluentTextTheme?.body2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
              child: FluentButton(
                title: "Atualizar data",
                onPressed: () => updateDate(showHUD: true),
              ),
            ),
            FluentSectionHeader(title: "Fluent Circular Progress Indicator"),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: FluentText(
                "Circular indicators come in five sizes and support both indeterminate and determinate progress.",
                style: FluentThemeDataModel.of(context).fluentTextTheme?.body2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: FluentSize.size240.value,
                runSpacing: FluentSize.size160.value,
                children: [
                  for (final size in FluentCircularProgressIndicatorSize.values)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FluentCircularProgressIndicator(size: size),
                        SizedBox(height: FluentSize.size80.value),
                        FluentText(
                          size
                              .toString()
                              .split('.')
                              .last,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.caption2,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: FluentText(
                "Determinate (value: 0.4):",
                style: FluentThemeDataModel.of(context).fluentTextTheme?.body2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
              child: FluentCircularProgressIndicator(
                size: FluentCircularProgressIndicatorSize.large,
                value: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
