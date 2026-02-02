import 'dart:ui';

import 'package:idc_fluent2_ui/src/fluent_models/fluent_font_weight.dart';

class MixedFluentFontWeight implements FluentFontWeight {
  final FluentFontWeight _weight;
  final FontWeight fontWeight;

  @override
  int get index => _weight.index;

  @override
  int get value => _weight.value;

  @override
  String toString() {
    return const <int, String>{
      0: 'MixedFluentFontWeight.regular',
      1: 'MixedFluentFontWeight.semibold',
      2: 'MixedFluentFontWeight.bold',
    }[index]!;
  }

  // Use FontWeight because FontWeight don't have any named constructor
  MixedFluentFontWeight._(this._weight)
      : fontWeight = switch (_weight.index) {
          0 => FontWeight.w400,
          1 => FontWeight.w600,
          2 => FontWeight.w700,
          _ => throw Exception('Invalid value')
        };

  static MixedFluentFontWeight regular =
      MixedFluentFontWeight._(FluentFontWeight.regular);

  static MixedFluentFontWeight semibold =
      MixedFluentFontWeight._(FluentFontWeight.semibold);

  static MixedFluentFontWeight bold =
      MixedFluentFontWeight._(FluentFontWeight.bold);

  static List<MixedFluentFontWeight> values = <MixedFluentFontWeight>[
    regular,
    semibold,
    bold
  ];
}
