import 'package:flutter/material.dart';
import 'package:fluent2ui/src/fluent_models/fluent_corner_radius.dart';
import 'package:fluent2ui/src/fluent_models/fluent_stroke_style.dart';
import 'package:fluent2ui/src/fluent_models/fluent_stroke_thickness.dart';

class MixedFluentStrokeStyle implements FluentStrokeStyle {
  @override
  final FluentStrokeThickness? thickness;

  @override
  final Color? color;

  @override
  final List<double>? dashArray;

  @override
  final double? padding;

  final FluentCornerRadius? cornerRadius;

  /// CustomFluentTextStyle's constructor
  MixedFluentStrokeStyle({
    this.thickness,
    this.color,
    this.dashArray,
    this.padding,
    this.cornerRadius,
  });
}
