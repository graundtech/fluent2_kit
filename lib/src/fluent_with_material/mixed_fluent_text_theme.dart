import 'package:flutter/material.dart';
import 'package:fluent2_kit/src/fluent_models/fluent_text_theme.dart';
import 'package:fluent2_kit/src/fluent_with_material/mixed_fluent_text_style.dart';

class MixedFluentTextTheme extends TextTheme implements FluentTextTheme {
  @override
  final MixedFluentTextStyle? caption1;

  @override
  final MixedFluentTextStyle? caption1Strong;

  @override
  final MixedFluentTextStyle? caption2;

  @override
  final MixedFluentTextStyle? body2;

  @override
  final MixedFluentTextStyle? body2Strong;

  @override
  final MixedFluentTextStyle? body1;

  @override
  final MixedFluentTextStyle? body1Strong;

  @override
  final MixedFluentTextStyle? title3;

  @override
  final MixedFluentTextStyle? title2;

  @override
  final MixedFluentTextStyle? title1;

  @override
  final MixedFluentTextStyle? largeTitle;

  @override
  final MixedFluentTextStyle? display;

  /// CustomFluentTextTheme's constructor who is passing the textTheme properties to TextTheme
  MixedFluentTextTheme({
    required this.caption2,
    required this.caption1,
    required this.caption1Strong,
    required this.body2,
    required this.body2Strong,
    required this.body1,
    required this.body1Strong,
    required this.title3,
    required this.title2,
    required this.title1,
    required this.largeTitle,
    required this.display,
  }) : super(
          bodyMedium: body2,
          bodyLarge: body1,
          titleLarge: title1,
          titleMedium: title2,
          titleSmall: title3,
          displayLarge: display,
        );
}
