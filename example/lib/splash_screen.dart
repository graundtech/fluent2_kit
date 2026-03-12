import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentScaffold(
      body: FluentContainer(
          color: colorMode(
            FluentColors.neutralBackground1Rest,
            FluentDarkColors.neutralBackground1Rest,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/gbt_fluent2_ui.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/gbt_logo.png",
                      width: FluentSize.size200.value,
                      height: FluentSize.size200.value,
                    ),
                    SizedBox(
                      width: FluentSize.size80.value,
                    ),
                    FluentText("GRBTEC",
                        style: FluentThemeDataModel.of(context)
                            .fluentTextTheme
                            ?.body2)
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
