import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/src/fluent_models/fluent_shadow.dart';

class MixedFluentShadow implements FluentShadow {
  final BoxShadow boxShadow1;
  final BoxShadow boxShadow2;

  @override
  final double blurShadow1;

  @override
  final double blurShadow2;

  @override
  final double opacityShadow1;

  @override
  final double opacityShadow2;

  @override
  final double xAxis;

  @override
  final double yAxisShadow1;

  @override
  final double yAxisShadow2;

  List<BoxShadow> get value => [boxShadow1, boxShadow2];

  MixedFluentShadow._({
    required this.boxShadow1,
    required this.boxShadow2,
    required this.blurShadow1,
    required this.blurShadow2,
    required this.xAxis,
    required this.yAxisShadow1,
    required this.yAxisShadow2,
    required this.opacityShadow1,
    required this.opacityShadow2,
  });

  static double _getColorLuminosity(Color color) {
    return (0.2126 * color.r * 255) +
        (0.7152 * color.g * 255) +
        (0.0722 * color.b * 255);
  }

  factory MixedFluentShadow.lowElevation(int shadowNumber,
      [Brightness brightness = Brightness.light]) {
    final double blurShadow1 = 1.0 * shadowNumber;
    final double blurShadow2 = 1.0 * shadowNumber;
    const double xAxis = 0;
    final double yAxisShadow1 = 0.5 * shadowNumber;
    final double yAxisShadow2 = 0.5 * shadowNumber;
    const double opacityShadow2 = 0.14;
    final double opacityShadow1 = brightness == Brightness.light ? 0.14 : 0.28;

    final BoxShadow boxShadow1 = BoxShadow(
      blurRadius: blurShadow1,
      offset: Offset(xAxis, yAxisShadow1),
      color: Colors.black.withAlpha((255*opacityShadow1).toInt()),
    );
    final BoxShadow boxShadow2 = BoxShadow(
      blurRadius: blurShadow2,
      offset: Offset(xAxis, yAxisShadow2),
      color: Colors.black.withAlpha((255*opacityShadow2).toInt()),
    );

    return MixedFluentShadow._(
      boxShadow1: boxShadow1,
      boxShadow2: boxShadow2,
      blurShadow1: blurShadow1,
      blurShadow2: blurShadow2,
      xAxis: xAxis,
      yAxisShadow1: yAxisShadow1,
      yAxisShadow2: yAxisShadow2,
      opacityShadow1: opacityShadow1,
      opacityShadow2: opacityShadow2,
    );
  }

  factory MixedFluentShadow.hightElevation(int shadowNumber,
      [Brightness brightness = Brightness.light]) {
    final double blurShadow1 = 1.0 * shadowNumber;
    final double blurShadow2 = brightness == Brightness.light ? 8 : 2;
    const double xAxis = 0;
    final double yAxisShadow1 = 0.5 * shadowNumber;
    const double yAxisShadow2 = 0;
    final double opacityShadow1 = brightness == Brightness.light ? 0.24 : 0.28;
    const double opacityShadow2 = 0.20;

    final BoxShadow boxShadow1 = BoxShadow(
      blurRadius: blurShadow1,
      offset: Offset(xAxis, yAxisShadow1),
      color: Colors.black.withAlpha((255*opacityShadow1).toInt()),
    );
    final BoxShadow boxShadow2 = BoxShadow(
      blurRadius: blurShadow2,
      offset: const Offset(xAxis, yAxisShadow2),
      color: Colors.black.withAlpha((255*opacityShadow2).toInt()),
    );

    return MixedFluentShadow._(
      boxShadow1: boxShadow1,
      boxShadow2: boxShadow2,
      blurShadow1: blurShadow1,
      blurShadow2: blurShadow2,
      xAxis: xAxis,
      yAxisShadow1: yAxisShadow1,
      yAxisShadow2: yAxisShadow2,
      opacityShadow1: opacityShadow1,
      opacityShadow2: opacityShadow2,
    );
  }

  factory MixedFluentShadow.brandColor(
    int shadowNumber,
    Color brandColor,
    ElevationRamp elevation,
  ) {
    final double blurShadow1 = 1.0 * shadowNumber;
    final double blurShadow2 =
        elevation == ElevationRamp.low ? 1.0 * shadowNumber : 8;

    const double xAxis = 0;

    final double yAxisShadow1 = 0.5 * shadowNumber;
    final double yAxisShadow2 =
        elevation == ElevationRamp.low ? 0.5 * shadowNumber : 0;

    final luminosity = _getColorLuminosity(brandColor);

    final double opacityShadow1 = (42 - (0.116 * luminosity)).round() / 100;
    final double opacityShadow2 = (34 - (0.09 * luminosity)).round() / 100;

    final BoxShadow boxShadow1 = BoxShadow(
      blurRadius: blurShadow1,
      offset: Offset(xAxis, yAxisShadow1),
      color: Colors.black.withAlpha((255*opacityShadow1).toInt()),
    );
    final BoxShadow boxShadow2 = BoxShadow(
      blurRadius: blurShadow2,
      offset: Offset(xAxis, yAxisShadow2),
      color: Colors.black.withAlpha((255*opacityShadow2).toInt()),
    );

    return MixedFluentShadow._(
      boxShadow1: boxShadow1,
      boxShadow2: boxShadow2,
      blurShadow1: blurShadow1,
      blurShadow2: blurShadow2,
      xAxis: xAxis,
      yAxisShadow1: yAxisShadow1,
      yAxisShadow2: yAxisShadow2,
      opacityShadow1: opacityShadow1,
      opacityShadow2: opacityShadow2,
    );
  }
}

enum ElevationRamp { low, hight }
