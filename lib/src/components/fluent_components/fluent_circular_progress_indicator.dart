import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentCircularProgressIndicator extends StatelessWidget {
  final FluentCircularProgressIndicatorSize size;
  final double? strokeWidth;
  final Color? backgroundColor;
  final String? semanticsLabel;
  final double strokeAlign;
  final String? semanticsValue;
  final StrokeCap? strokeCap;
  final Animation<Color?>? valueColor;
  final double? value;
  final Color? color;

  const FluentCircularProgressIndicator({
    super.key,
    this.color,
    this.value,
    this.strokeCap,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
    this.backgroundColor,
    this.strokeAlign = 0.0,
    this.size = FluentCircularProgressIndicatorSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final ratio = switch (size) {
      FluentCircularProgressIndicatorSize.xSmall => 0.8369,
      FluentCircularProgressIndicatorSize.small => 0.8756,
      FluentCircularProgressIndicatorSize.medium => 0.8369,
      FluentCircularProgressIndicatorSize.large => 0.8131,
      _ => 0.7783, // xLarge
    };

    final fluentStrokeWidth = size.value * ((1 - ratio) / 2);

    return SizedBox(
      width: size.value,
      height: size.value,
      child: CircularProgressIndicator(
        value: value,
        strokeCap: strokeCap,
        valueColor: valueColor,
        strokeAlign: strokeAlign,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        backgroundColor: backgroundColor,
        color: color ??
            colorMode(
              FluentColors.controlsHudForeground2Rest,
              FluentDarkColors.controlsHudForeground2Rest,
            ),
        strokeWidth: strokeWidth ?? fluentStrokeWidth,
      ),
    );
  }
}
