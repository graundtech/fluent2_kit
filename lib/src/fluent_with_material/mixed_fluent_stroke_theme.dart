import 'package:fluent2ui/src/fluent_models/fluent_stroke_theme.dart';
import 'package:fluent2ui/src/fluent_with_material/mixed_fluent_stroke_style.dart';

class MixedFluentStrokeTheme implements FluentStrokeTheme {
  @override
  final MixedFluentStrokeStyle? stroke1;
  @override
  final MixedFluentStrokeStyle? stroke2;
  @override
  final MixedFluentStrokeStyle? strokeAccessible;
  @override
  final MixedFluentStrokeStyle? strokeDisabled;

  /// CustomFluentTextTheme's constructor
  MixedFluentStrokeTheme({
    required this.stroke1,
    required this.stroke2,
    required this.strokeAccessible,
    required this.strokeDisabled,
  });
}
