import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';
import 'package:idc_fluent2_ui/src/components/dotted_border/dotted_border.dart';

class FluentStrokeBorder extends StatelessWidget {
  final Widget? child;
  final FluentStrokeStyle? strokeStyle;
  final FluentCornerRadius? cornerRadius;

  static final defaultCornerRadius = FluentCornerRadius.circle;
  static final defaultStrokeThickness = FluentStrokeThickness.strokeWidth05;
  static final defaultDashArray = <double>[1, 0, 1, 0];

  /// FluentStroke's constructor
  FluentStrokeBorder({
    super.key,
    this.child,
    required this.strokeStyle,
    this.cornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final defaultStrokeColor = colorMode(
      FluentColors.neutralStroke2Rest,
      FluentDarkColors.neutralStroke2Rest,
    );

    return DottedBorder(
      padding: EdgeInsets.all(strokeStyle?.padding ??
          (strokeStyle?.thickness?.value ?? defaultStrokeThickness.value) / 2),
      strokeCap: StrokeCap.square,
      borderType: child != null ? BorderType.rRect : BorderType.line,
      radius: Radius.circular(cornerRadius?.value ?? defaultCornerRadius.value),
      color: strokeStyle?.color ?? defaultStrokeColor,
      strokeWidth: (strokeStyle?.thickness ?? defaultStrokeThickness).value,
      dashPattern: strokeStyle?.dashArray ?? defaultDashArray,
      child: child ?? const SizedBox(),
    );
  }
}
