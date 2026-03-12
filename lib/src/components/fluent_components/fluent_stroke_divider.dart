import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';
import 'package:fluent2ui/src/components/fluent_components/fluent_stroke_border.dart';

class FluentStrokeDivider extends StatelessWidget {
  final FluentStrokeStyle? style;
  final FluentStrokeBorderIndent? startIndent;
  final FluentStrokeBorderIndent? endIndent;
  final double? height;
  final FluentCornerRadius? cornerRadius;

  /// FluentStrokeDivider's constructor
  const FluentStrokeDivider({
    this.style,
    this.startIndent,
    this.endIndent,
    this.height,
    this.cornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final thickness = style?.thickness;
    final indent = startIndent;
    final height = this.height;

    final double strokeGapWithoutThickness =
        max(0, height != null ? ((height - (thickness?.value ?? 0.1)) / 2) : 0);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: height ??
              thickness?.value ??
              FluentStrokeBorder.defaultStrokeThickness.value,
          child: OverflowBox(
            maxHeight: height ?? thickness?.value ?? 6,
            maxWidth: constraints.maxWidth,
            minWidth: constraints.maxWidth,
            minHeight: height ?? thickness?.value ?? 6,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.only(
                  left: indent?.value ?? 0,
                  right: endIndent?.value ?? 0,
                  top: strokeGapWithoutThickness,
                  bottom: strokeGapWithoutThickness,
                ),
                child: FluentStrokeBorder(
                    cornerRadius: cornerRadius ?? FluentCornerRadius.circle,
                    strokeStyle: style),
              ),
            ),
          ),
        );
      },
    );
  }
}
