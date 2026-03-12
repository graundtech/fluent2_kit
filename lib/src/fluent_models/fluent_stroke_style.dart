import 'dart:ui';

import 'package:fluent2ui/src/fluent_models/fluent_stroke_thickness.dart';

class FluentStrokeStyle {
  final FluentStrokeThickness? thickness;
  final Color? color;
  final List<double>? dashArray;
  final double? padding;

  FluentStrokeStyle({this.thickness, this.color, this.dashArray, this.padding});
}
