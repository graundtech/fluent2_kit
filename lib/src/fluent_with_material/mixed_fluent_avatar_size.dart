import 'package:fluent2_kit/src/fluent_models/fluent_avatar_size.dart';

class MixedFluentAvatarSize implements FluentAvatarSize {
  final FluentAvatarSize _size;

  @override
  int get index => _size.index;

  @override
  double get value => _size.value;

  MixedFluentAvatarSize._(this._size);

  @override
  String toString() {
    return const <int, String>{
      0: 'MixedFluentAvatarSize.size16',
      1: 'MixedFluentAvatarSize.size20',
      2: 'MixedFluentAvatarSize.size24',
      3: 'MixedFluentAvatarSize.size28',
      4: 'MixedFluentAvatarSize.size32',
      5: 'MixedFluentAvatarSize.size36',
      6: 'MixedFluentAvatarSize.size40',
      7: 'MixedFluentAvatarSize.size48',
      8: 'MixedFluentAvatarSize.size56',
      9: 'MixedFluentAvatarSize.size64',
      10: 'MixedFluentAvatarSize.size72',
      11: 'MixedFluentAvatarSize.size96',
      12: 'MixedFluentAvatarSize.size120',
      13: 'MixedFluentAvatarSize.size128',
    }[index]!;
  }

  /// Size 16
  static MixedFluentAvatarSize size16 = MixedFluentAvatarSize._(
    FluentAvatarSize.size16,
  );

  /// Size 20
  static MixedFluentAvatarSize size20 = MixedFluentAvatarSize._(
    FluentAvatarSize.size20,
  );

  /// Size 24
  static MixedFluentAvatarSize size24 = MixedFluentAvatarSize._(
    FluentAvatarSize.size24,
  );

  /// Size 28
  static MixedFluentAvatarSize size28 = MixedFluentAvatarSize._(
    FluentAvatarSize.size28,
  );

  /// Size 32
  static MixedFluentAvatarSize size32 = MixedFluentAvatarSize._(
    FluentAvatarSize.size32,
  );

  /// Size 36
  static MixedFluentAvatarSize size36 = MixedFluentAvatarSize._(
    FluentAvatarSize.size36,
  );

  /// Size 40
  static MixedFluentAvatarSize size40 = MixedFluentAvatarSize._(
    FluentAvatarSize.size40,
  );

  /// Size 48
  static MixedFluentAvatarSize size48 = MixedFluentAvatarSize._(
    FluentAvatarSize.size48,
  );

  /// Size 56
  static MixedFluentAvatarSize size56 = MixedFluentAvatarSize._(
    FluentAvatarSize.size56,
  );

  /// Size 64
  static MixedFluentAvatarSize size64 = MixedFluentAvatarSize._(
    FluentAvatarSize.size64,
  );

  /// Size 72
  static MixedFluentAvatarSize size72 = MixedFluentAvatarSize._(
    FluentAvatarSize.size72,
  );

  /// Size 96
  static MixedFluentAvatarSize size96 = MixedFluentAvatarSize._(
    FluentAvatarSize.size96,
  );

  /// Size 120
  static MixedFluentAvatarSize size120 = MixedFluentAvatarSize._(
    FluentAvatarSize.size120,
  );

  /// Size 128
  static MixedFluentAvatarSize size128 = MixedFluentAvatarSize._(
    FluentAvatarSize.size128,
  );
}
