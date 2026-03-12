import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';
import 'package:fluent2ui/src/components/conditional_parent_widget/conditional_parent_widget.dart';
import 'package:fluent2ui/src/components/fluent_components/fluent_stroke_border.dart';

class FluentContainer extends StatelessWidget {
  final Widget? child;
  final FluentStrokeStyle? strokeStyle;
  final FluentCornerRadius? cornerRadius;
  final FluentShadow? shadow;
  final Gradient? gradient;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;

  // Other 'Container' props
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  /// FluentContainer's constructor
  const FluentContainer({
    super.key,
    this.child,
    this.strokeStyle,
    this.cornerRadius,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.shadow,
    this.gradient,
    this.alignment,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final cornerRadius = this.cornerRadius;

    return Container(
      margin: margin,
      child: ConditionalParentWidget(
        condition: strokeStyle != null,
        parentBuilder: (BuildContext context, Widget child) {
          return FluentStrokeBorder(
            strokeStyle: strokeStyle,
            cornerRadius: cornerRadius != null
                ? FluentCornerRadius(
                    6,
                    cornerRadius.value + (strokeStyle?.padding ?? 1),
                  )
                : FluentCornerRadius.none,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                cornerRadius?.value ?? 0,
              ),
              child: child,
            ),
          );
        },
        child: ConditionalParentWidget(
          condition: cornerRadius != null,
          parentBuilder: (BuildContext context, Widget child) {
            // We can user ! here,
            // since the condition above will guarantee that it will never be null
            final cornerRadius = this.cornerRadius!;
            return Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: (shadow as MixedFluentShadow?)?.value,
                  borderRadius: BorderRadius.circular(cornerRadius.value),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(cornerRadius.value),
                  child: child,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              gradient: gradient,
              boxShadow: cornerRadius != null
                  ? null
                  : (shadow as MixedFluentShadow?)?.value,
            ),
            alignment: alignment,
            constraints: constraints,
            width: width,
            height: height,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
    // return Conditional
  }
}
