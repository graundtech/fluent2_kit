import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class ShadowExampleItem {
  final String name;
  final FluentShadow? shadow;
  final FluentShadow? brandShadow;

  ShadowExampleItem({
    required this.name,
    required this.shadow,
    this.brandShadow,
  });
}

class ShadowView extends StatelessWidget {
  const ShadowView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    print(
        "LOOK IF BRWAND COLOR CHANGE => ${FluentColors.of(context)?.brandBackground1Rest}");

    final lowElevationRamp = [
      ShadowExampleItem(
        name: "Shadow 2",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow2,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow2,
      ),
      ShadowExampleItem(
        name: "Shadow 4",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow4,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow4,
      ),
      ShadowExampleItem(
        name: "Shadow 8",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow8,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow8,
      ),
      ShadowExampleItem(
        name: "Shadow 16",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow16,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow16,
      ),
    ];

    final highElevationRamp = [
      ShadowExampleItem(
        name: "Shadow 28",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow28,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow28,
      ),
      ShadowExampleItem(
        name: "Shadow 64",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow64,
        brandShadow:
            FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow64,
      ),
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Shadows",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: FluentContainer(
        color: colorMode(FluentColors.neutralBackgroundCanvasRest,
            FluentDarkColors.neutralBackgroundCanvasRest),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description:
                    "Elevation is the perceived distance between an object and"
                    " the surface behind it using shadows and light. Elevate UI "
                    "elements to create visual cues, aid scannability, and convey levels of importance.",
              ),
              FluentStrokeDivider(height: FluentSize.size240.value),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: FluentSize.size80.value),
                child: FluentText(
                  "Low elevation ramp",
                  style:
                      FluentThemeDataModel.of(context).fluentTextTheme?.title2,
                ),
              ),
              for (ShadowExampleItem shadow in lowElevationRamp) ...[
                FluentSectionHeader(
                  title: shadow.name,
                  titleVariant: SectionHeaderTitleVariant.subtle,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 284),
                  child: Wrap(
                    children: [
                      FluentContainer(
                        color: colorMode(
                          FluentColors.neutralBackground2Rest,
                          FluentDarkColors.neutralBackground3Rest,
                        ),
                        padding: EdgeInsets.all(FluentSize.size360.value),
                        child: FluentContainer(
                          color: colorMode(
                            FluentColors.neutralBackground3Rest,
                            FluentDarkColors.neutralBackground4Rest,
                          ),
                          width: 70,
                          height: 70,
                          shadow: shadow.shadow,
                          cornerRadius: FluentCornerRadius.large,
                        ),
                      ),
                      FluentContainer(
                        color: colorMode(
                          FluentDarkColors.neutralBackground3Rest,
                          FluentColors.neutralBackground3Rest,
                        ),
                        padding: EdgeInsets.all(FluentSize.size360.value),
                        child: FluentContainer(
                          width: 70,
                          height: 70,
                          shadow: shadow.shadow,
                          color: colorMode(
                            FluentDarkColors.neutralBackground4Rest,
                            FluentColors.neutralBackground3Rest,
                          ),
                          cornerRadius: FluentCornerRadius.large,
                        ),
                      ),
                    ],
                  ),
                ),
                FluentSectionHeader(
                  title: "Brand ${shadow.name}",
                  titleVariant: SectionHeaderTitleVariant.subtle,
                ),
                FluentContainer(
                  constraints: BoxConstraints(maxWidth: 284),
                  width: double.maxFinite,
                  color: colorMode(
                    FluentColors.neutralBackground3Rest,
                    FluentDarkColors.neutralBackground3Rest,
                  ),
                  padding: EdgeInsets.all(FluentSize.size360.value),
                  margin: EdgeInsets.only(bottom: FluentSize.size120.value),
                  child: FluentContainer(
                    width: 70,
                    height: 70,
                    shadow: shadow.brandShadow,
                    color: FluentColors.of(context)?.brandBackground1Rest,
                    cornerRadius: FluentCornerRadius.large,
                  ),
                )
              ],
              Padding(
                padding: EdgeInsets.only(
                    top: FluentSize.size320.value,
                    bottom: FluentSize.size200.value),
                child: FluentText(
                  "High elevation ramp",
                  style:
                      FluentThemeDataModel.of(context).fluentTextTheme?.title2,
                ),
              ),
              for (ShadowExampleItem shadow in highElevationRamp) ...[
                FluentSectionHeader(
                  title: shadow.name,
                  titleVariant: SectionHeaderTitleVariant.subtle,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 284),
                  child: Wrap(
                    children: [
                      FluentContainer(
                        color: colorMode(
                          FluentColors.neutralBackground2Rest,
                          FluentDarkColors.neutralBackground3Rest,
                        ),
                        padding: EdgeInsets.all(FluentSize.size360.value),
                        child: FluentContainer(
                          color: colorMode(
                            FluentColors.neutralBackground3Rest,
                            FluentDarkColors.neutralBackground4Rest,
                          ),
                          width: 70,
                          height: 70,
                          shadow: shadow.shadow,
                          cornerRadius: FluentCornerRadius.large,
                        ),
                      ),
                      FluentContainer(
                        color: colorMode(
                          FluentDarkColors.neutralBackground3Rest,
                          FluentColors.neutralBackground3Rest,
                        ),
                        padding: EdgeInsets.all(FluentSize.size360.value),
                        child: FluentContainer(
                          width: 70,
                          height: 70,
                          shadow: shadow.shadow,
                          color: colorMode(
                            FluentDarkColors.neutralBackground4Rest,
                            FluentColors.neutralBackground3Rest,
                          ),
                          cornerRadius: FluentCornerRadius.large,
                        ),
                      ),
                    ],
                  ),
                ),
                FluentSectionHeader(
                  title: "Brand ${shadow.name}",
                  titleVariant: SectionHeaderTitleVariant.subtle,
                ),
                FluentContainer(
                  constraints: BoxConstraints(maxWidth: 284),
                  width: double.maxFinite,
                  color: colorMode(
                    FluentColors.neutralBackground3Rest,
                    FluentDarkColors.neutralBackground3Rest,
                  ),
                  padding: EdgeInsets.all(FluentSize.size360.value),
                  margin: EdgeInsets.only(bottom: FluentSize.size120.value),
                  child: FluentContainer(
                    width: 70,
                    height: 70,
                    shadow: shadow.brandShadow,
                    color: FluentColors.of(context)?.brandBackground1Rest,
                    cornerRadius: FluentCornerRadius.large,
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
