import 'package:fluent2_kit/src/fluent_models/fluent_stroke_style.dart';

class FluentStrokeTheme {
  final FluentStrokeStyle? stroke1;
  final FluentStrokeStyle? stroke2;
  final FluentStrokeStyle? strokeAccessible;
  final FluentStrokeStyle? strokeDisabled;

  /// FluentStrokeTheme's constructor defines fluent stroke styles.
  FluentStrokeTheme({
    this.stroke1,
    this.stroke2,
    this.strokeAccessible,
    this.strokeDisabled,
  });
}
