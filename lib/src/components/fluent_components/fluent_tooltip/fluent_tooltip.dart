import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const FluentTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return Tooltip(
      preferBelow: true,
      decoration: ShapeDecoration(
        // cannot correctly place the tip of the tooltip using ShapeDecoration
        // TODO: consider using a custom tooltip
        color: colorMode(FluentColors.neutralBackgroundStaticDarkRest,
            FluentDarkColors.neutralBackgroundStaticLightRest),
        shape: CustomShape(),
      ),
      message: message,
      child: child,
    );
  }
}

class CustomShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(8)))
      ..moveTo(rect.topCenter.dx - 7, rect.topCenter.dy)
      ..relativeLineTo(7, -7)
      ..relativeLineTo(7, 7)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
