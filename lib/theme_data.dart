import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluent2_kit/fluent2_kit.dart';
import 'package:fluent2_kit/src/fluent_with_material/mixed_fluent_stroke_style.dart';
import 'package:fluent2_kit/src/fluent_with_material/mixed_fluent_stroke_theme.dart';

const _brandColor = MaterialColor(
  0XFF0F6CBD,
  <int, Color>{
    50: Color(0XFFddf5ff),
    100: Color(0XFFb2dcfe),
    200: Color(0XFF86c3f9),
    300: Color(0XFF58abf3),
    400: Color(0XFF2a93ee),
    500: Color(0XFF1179d5),
    600: Color(0XFF055ea6),
    700: Color(0XFF004378),
    800: Color(0XFF00284b),
    900: Color(0XFF000e1f),
  },
);
final theme = getTheme(
  brandColor: _brandColor,
);
final darkTheme = getTheme(
  brandColor: _brandColor,
  brightness: Brightness.dark,
);

Fluent2ThemeData getTheme({
  required MaterialColor brandColor,
  Brightness brightness = Brightness.light,
}) {
  final colorMode = createColorMode(brightness);
  final fluentColors = convert(brandColor, brightness);

  return Fluent2ThemeData(
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    useMaterial3: true,
    fontFamily:
        defaultTargetPlatform == TargetPlatform.iOS ? 'SF Pro' : 'Roboto',
    fluentBrandColors: fluentColors,
    fluentTextTheme: MixedFluentTextTheme(
      caption2: MixedFluentTextStyle(
        fluentSize: 12,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      caption1: MixedFluentTextStyle(
        fluentSize: 13,
        fluentLineHeight: 1.4,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      caption1Strong: MixedFluentTextStyle(
        fluentSize: 13,
        fluentLineHeight: 1.4,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      body2: MixedFluentTextStyle(
        fluentSize: 15,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      body2Strong: MixedFluentTextStyle(
        fluentSize: 15,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      body1: MixedFluentTextStyle(
        fluentSize: 17,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      body1Strong: MixedFluentTextStyle(
        fluentSize: 17,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      title3: MixedFluentTextStyle(
        fluentSize: 20,
        fluentLineHeight: 1.25,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      title2: MixedFluentTextStyle(
        fluentSize: 22,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      title1: MixedFluentTextStyle(
        fluentSize: 28,
        fluentLineHeight: 1.22,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
      largeTitle: MixedFluentTextStyle(
        fluentSize: 34,
        fluentLineHeight: 1.21,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
      display: MixedFluentTextStyle(
        fluentSize: 60,
        fluentLineHeight: 1.17,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
    ),
    fluentShadowTheme: MixedFluentShadowTheme(
      shadow2: MixedFluentShadow.lowElevation(2, brightness),
      shadow4: MixedFluentShadow.lowElevation(4, brightness),
      shadow8: MixedFluentShadow.lowElevation(8, brightness),
      shadow16: MixedFluentShadow.lowElevation(16, brightness),
      shadow28: MixedFluentShadow.hightElevation(28, brightness),
      shadow64: MixedFluentShadow.hightElevation(64, brightness),
      brandShadow2:
          MixedFluentShadow.brandColor(2, brandColor, ElevationRamp.low),
      brandShadow4:
          MixedFluentShadow.brandColor(4, brandColor, ElevationRamp.low),
      brandShadow8:
          MixedFluentShadow.brandColor(8, brandColor, ElevationRamp.low),
      brandShadow16:
          MixedFluentShadow.brandColor(16, brandColor, ElevationRamp.low),
      brandShadow28:
          MixedFluentShadow.brandColor(28, brandColor, ElevationRamp.hight),
      brandShadow64:
          MixedFluentShadow.brandColor(64, brandColor, ElevationRamp.hight),
    ),
    fluentStrokeTheme: MixedFluentStrokeTheme(
      stroke1: MixedFluentStrokeStyle(
        color: colorMode(
          FluentColors.neutralStroke1Rest,
          FluentDarkColors.neutralStroke1Rest,
        ),
        thickness: FluentStrokeThickness.strokeWidth05,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      stroke2: MixedFluentStrokeStyle(
        color: colorMode(
          FluentColors.neutralStroke2Rest,
          FluentDarkColors.neutralStroke2Rest,
        ),
        thickness: FluentStrokeThickness.strokeWidth05,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      strokeAccessible: MixedFluentStrokeStyle(
        color: colorMode(
          FluentColors.neutralStrokeAccessibleRest,
          FluentDarkColors.neutralStrokeAccessibleRest,
        ),
        thickness: FluentStrokeThickness.strokeWidth10,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      strokeDisabled: MixedFluentStrokeStyle(
        color: colorMode(
          FluentColors.neutralStrokeDisabledRest,
          FluentDarkColors.neutralStrokeDisabledRest,
        ),
        thickness: FluentStrokeThickness.strokeWidth10,
        cornerRadius: MixedFluentCornerRadius.xLarge,
      ),
    ),
    scaffoldBackgroundColor: colorMode(FluentColors.neutralBackground1Rest,
        FluentDarkColors.neutralBackground1Rest),
    dialogBackgroundColor: colorMode(FluentColors.neutralBackground1Rest,
        FluentDarkColors.neutralBackground1Rest),
    colorScheme: ColorScheme.fromSeed(
      seedColor: brandColor,
      brightness: brightness,
    ),
  );
}

FluentColors convert(MaterialColor materialColor,
    [Brightness brightness = Brightness.light]) {
  final fluentColor = <int, Color>{};
  for (var i = 0; i <= 15; i++) {
    const materialStep = 900 / 16;
    final materialLevel = 900 - i * materialStep;
    final rest = (materialLevel % 100).toInt();
    final percentage = rest / 100;
    final lower = materialLevel ~/ 100 * 100;
    final higher = rest == 0 ? lower : lower + 100;
    final lowerColor = materialColor[lower] ?? Colors.white;
    final higherColor = materialColor[higher] ?? Colors.black;
    fluentColor[(i + 1) * 10] = ColorTween(
      begin: lowerColor,
      end: higherColor,
    ).lerp(percentage)!;
  }

  return switch (brightness) {
    Brightness.light => FluentColors(
        brandBackground1Rest: fluentColor[80]!,
        brandBackground1Pressed: fluentColor[50]!,
        brandBackground1Selected: fluentColor[60]!,
        brandBackground2Rest: fluentColor[70]!,
        brandBackground2Pressed: fluentColor[40]!,
        brandBackground2Selected: fluentColor[50]!,
        brandBackground3Rest: fluentColor[60]!,
        brandBackgroundTintRest: fluentColor[150]!,
        brandBackgroundDisabledRest: fluentColor[140]!,
        brandForeground1Rest: fluentColor[80]!,
        brandForeground1Pressed: fluentColor[50]!,
        brandForeground1Selected: fluentColor[60]!,
        brandForegroundTintRest: fluentColor[60]!,
        brandForegroundDisabled1Rest: fluentColor[90]!,
        brandForegroundDisabled2Rest: fluentColor[140]!,
        brandStroke1Rest: fluentColor[80]!,
        brandStroke1Pressed: fluentColor[50]!,
        brandStroke1Selected: fluentColor[60]!,
      ),
    Brightness.dark => FluentColors(
        brandBackground1Rest: fluentColor[100]!,
        brandBackground1Pressed: fluentColor[130]!,
        brandBackground1Selected: fluentColor[120]!,
        brandBackground2Rest: Colors.transparent,
        brandBackground2Pressed: Colors.transparent,
        brandBackground2Selected: Colors.transparent,
        brandBackground3Rest: Colors.transparent,
        brandBackgroundTintRest: fluentColor[40]!,
        brandBackgroundDisabledRest: fluentColor[40]!,
        brandForeground1Rest: fluentColor[100]!,
        brandForeground1Pressed: fluentColor[130]!,
        brandForeground1Selected: fluentColor[120]!,
        brandForegroundTintRest: fluentColor[130]!,
        brandForegroundDisabled1Rest: fluentColor[90]!,
        brandForegroundDisabled2Rest: fluentColor[40]!,
        brandStroke1Rest: fluentColor[100]!,
        brandStroke1Pressed: fluentColor[130]!,
        brandStroke1Selected: fluentColor[120]!,
      ),
  };
}
