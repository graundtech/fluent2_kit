import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

abstract interface class FluentThemeDataModel {
  final FluentTextTheme? fluentTextTheme;
  final FluentStrokeTheme? fluentStrokeTheme;
  final FluentShadowTheme? fluentShadowTheme;

  final FluentColors? fluentBrandColors;

  static FluentThemeDataModel of(BuildContext context) {
    return Theme.of(context) as FluentThemeDataModel;
  }

  /// FluentThemeData's constructor
  FluentThemeDataModel({
    this.fluentTextTheme,
    this.fluentShadowTheme,
    this.fluentStrokeTheme,
    this.fluentBrandColors,
  });
}
