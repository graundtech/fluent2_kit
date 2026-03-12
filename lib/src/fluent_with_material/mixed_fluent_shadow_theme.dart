import 'package:fluent2ui/src/fluent_models/fluent_shadow_theme.dart';
import 'package:fluent2ui/src/fluent_with_material/mixed_fluent_shadow.dart';

class MixedFluentShadowTheme implements FluentShadowTheme {
  @override
  final MixedFluentShadow? brandShadow16;

  @override
  final MixedFluentShadow? brandShadow2;

  @override
  final MixedFluentShadow? brandShadow28;

  @override
  final MixedFluentShadow? brandShadow4;

  @override
  final MixedFluentShadow? brandShadow64;

  @override
  final MixedFluentShadow? brandShadow8;

  @override
  final MixedFluentShadow? shadow16;

  @override
  final MixedFluentShadow? shadow2;

  @override
  final MixedFluentShadow? shadow28;

  @override
  final MixedFluentShadow? shadow4;

  @override
  final MixedFluentShadow? shadow64;

  @override
  final MixedFluentShadow? shadow8;

  MixedFluentShadowTheme({
    this.brandShadow2,
    this.brandShadow4,
    this.brandShadow8,
    this.brandShadow16,
    this.brandShadow28,
    this.brandShadow64,
    this.shadow16,
    this.shadow2,
    this.shadow28,
    this.shadow4,
    this.shadow64,
    this.shadow8,
  });
}
