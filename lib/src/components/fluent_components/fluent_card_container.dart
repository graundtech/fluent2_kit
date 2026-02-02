import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentCardContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsets? padding;
  final FluentShadow? shadow;
  final AlignmentGeometry? alignment;
  final FluentCornerRadius cornerRadius;
  final BoxConstraints? constraints;

  const FluentCardContainer({
    super.key,
    this.cornerRadius = FluentCornerRadius.large,
    this.constraints,
    this.alignment,
    this.padding,
    this.margin,
    this.shadow,
    this.height,
    this.color,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentContainer(
      padding: padding,
      alignment: alignment,
      margin: margin,
      width: width,
      height: height,
      constraints: constraints,
      color: color ??
          colorMode(
            FluentColors.neutralBackground2Rest,
            FluentDarkColors.neutralBackground2Rest,
          ),
      cornerRadius: cornerRadius,
      shadow:
          shadow ?? FluentThemeDataModel.of(context).fluentShadowTheme?.shadow2,
      child: child,
    );
  }
}
