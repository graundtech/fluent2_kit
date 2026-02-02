import 'dart:ui';

import 'package:idc_fluent2_ui/src/fluent_models/fluent_corner_radius.dart';

class MixedFluentCornerRadius implements FluentCornerRadius {
  final FluentCornerRadius _cornerRadius;
  final Radius radius; // Radius that will be defined in material theme.

  /// The encoded integer value of this corner radius.
  @override
  int get index => _cornerRadius.index;

  /// The rounded value of this corner radius.
  @override
  double get value => _cornerRadius.value;

  @override
  String toString() {
    return const <int, String>{
      0: 'MixedFluentCornerRadius.none',
      1: 'MixedFluentCornerRadius.small',
      2: 'MixedFluentCornerRadius.medium',
      3: 'MixedFluentCornerRadius.large',
      4: 'MixedFluentCornerRadius.xLarge',
      5: 'MixedFluentCornerRadius.circle',
    }[index]!;
  }

  MixedFluentCornerRadius._(this._cornerRadius)
      : radius = Radius.circular(_cornerRadius.value);

  /// None
  static MixedFluentCornerRadius none =
      MixedFluentCornerRadius._(FluentCornerRadius.none);

  /// Small
  static MixedFluentCornerRadius small =
      MixedFluentCornerRadius._(FluentCornerRadius.small);

  /// Medium
  static MixedFluentCornerRadius medium =
      MixedFluentCornerRadius._(FluentCornerRadius.medium);

  /// Large
  static MixedFluentCornerRadius large =
      MixedFluentCornerRadius._(FluentCornerRadius.large);

  /// X-large
  static MixedFluentCornerRadius xLarge =
      MixedFluentCornerRadius._(FluentCornerRadius.xLarge);

  /// Circle
  static MixedFluentCornerRadius circle =
      MixedFluentCornerRadius._(FluentCornerRadius.circle);

  /// A list of all the corner radius.
  static List<MixedFluentCornerRadius> values = <MixedFluentCornerRadius>[
    none,
    small,
    medium,
    large,
    xLarge,
    circle,
  ];
}
