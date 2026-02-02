import 'package:idc_fluent2_ui/src/fluent_models/fluent_size.dart';

class MixedFluentSize {
  final FluentSize _size;

  int get index => _size.index;

  double get value => _size.value;

  const MixedFluentSize._(this._size);

  /// Size none
  static const MixedFluentSize sizeNone = MixedFluentSize._(
    FluentSize.sizeNone,
  );

  /// Size 2
  static const MixedFluentSize size20 = MixedFluentSize._(
    FluentSize.size20,
  );

  /// Size 4
  static const MixedFluentSize size40 = MixedFluentSize._(
    FluentSize.size40,
  );

  /// Size 6
  static const MixedFluentSize size60 = MixedFluentSize._(
    FluentSize.size60,
  );

  /// Size 8
  static const MixedFluentSize size80 = MixedFluentSize._(
    FluentSize.size80,
  );

  /// Size 10
  static const MixedFluentSize size100 = MixedFluentSize._(
    FluentSize.size100,
  );

  /// Size 12
  static const MixedFluentSize size120 = MixedFluentSize._(
    FluentSize.size120,
  );

  /// Size 16
  static const MixedFluentSize size160 = MixedFluentSize._(
    FluentSize.size160,
  );

  /// Size 20
  static const MixedFluentSize size200 = MixedFluentSize._(
    FluentSize.size200,
  );

  /// Size 24
  static const MixedFluentSize size240 = MixedFluentSize._(
    FluentSize.size240,
  );

  /// Size 28
  static const MixedFluentSize size280 = MixedFluentSize._(
    FluentSize.size280,
  );

  /// Size 32
  static const MixedFluentSize size320 = MixedFluentSize._(
    FluentSize.size320,
  );

  /// Size 36
  static const MixedFluentSize size360 = MixedFluentSize._(
    FluentSize.size360,
  );

  /// Size 40
  static const MixedFluentSize size400 = MixedFluentSize._(
    FluentSize.size400,
  );

  /// Size 48
  static const MixedFluentSize size480 = MixedFluentSize._(
    FluentSize.size480,
  );

  /// Size 52
  static const MixedFluentSize size520 = MixedFluentSize._(
    FluentSize.size520,
  );

  /// Size 56
  static const MixedFluentSize size560 = MixedFluentSize._(
    FluentSize.size560,
  );

  @override
  String toString() {
    return <int, String>{
      0: 'MixedFluentSize.sizeNone',
      1: 'MixedFluentSize.size20',
      2: 'MixedFluentSize.size40',
      3: 'MixedFluentSize.size60',
      4: 'MixedFluentSize.size80',
      5: 'MixedFluentSize.size100',
      6: 'MixedFluentSize.size120',
      7: 'MixedFluentSize.size160',
      8: 'MixedFluentSize.size200',
      9: 'MixedFluentSize.size240',
      10: 'MixedFluentSize.size280',
      11: 'MixedFluentSize.size320',
      12: 'MixedFluentSize.size360',
      13: 'MixedFluentSize.size400',
      14: 'MixedFluentSize.size480',
      15: 'MixedFluentSize.size20',
      16: 'MixedFluentSize.size20',
    }[index]!;
  }
}
