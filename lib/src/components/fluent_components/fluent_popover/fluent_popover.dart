import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

part 'fluent_popover_controller.dart';

class FluentPopover extends StatefulWidget {
  final FluentPopoverController? controller;
  final Widget? title;
  final Widget? subtitle;
  final Widget body;
  final Widget child;
  final Axis axis;
  final double offset;
  final VoidCallback? onOpen;

  FluentPopover({
    super.key,
    this.controller,
    this.title,
    this.subtitle,
    required this.body,
    required this.child,
    this.axis = Axis.vertical,
    this.offset = 19.0,
    this.onOpen,
  });

  @override
  State<FluentPopover> createState() => _FluentPopoverState();
}

class _FluentPopoverState extends State<FluentPopover> {
  late final FluentPopoverController controller =
      widget.controller ?? _InternalFluentPopoverController();

  Widget overlayChildBuilder(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final OverlayState overlayState =
        Overlay.of(context, debugRequiredFor: widget);
    final RenderBox box = this.context.findRenderObject()! as RenderBox;
    final Offset target = box.localToGlobal(
      box.size.center(Offset.zero),
      ancestor: overlayState.context.findRenderObject(),
    );
    final overlayRenderBox =
        overlayState.context.findRenderObject()! as RenderBox;
    final overlayCenter = overlayRenderBox.size.center(Offset.zero);
    const top = 1, bottom = 2, left = 3, right = 4;
    final popOverDirection = switch (widget.axis) {
      Axis.vertical => target.dy > overlayCenter.dy ? top : bottom,
      Axis.horizontal => target.dx > overlayCenter.dx ? left : right,
    };
    print(popOverDirection);

    final popOverColor = colorMode(FluentColors.neutralBackground4Rest,
        FluentDarkColors.neutralBackground4Rest);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: controller.hide,
      child: Padding(
        padding: switch (popOverDirection) {
          left => EdgeInsets.only(
              top: max(0, 2 * (target.dy - overlayCenter.dy)),
              bottom: max(0, 2 * (overlayCenter.dy - target.dy)),
              right: overlayRenderBox.size.width - target.dx + widget.offset,
            ),
          right => EdgeInsets.only(
              top: max(0, 2 * (target.dy - overlayCenter.dy)),
              bottom: max(0, 2 * (overlayCenter.dy - target.dy)),
              left: target.dx + widget.offset,
            ),
          top => EdgeInsets.only(
              left: max(0, 2 * (target.dx - overlayCenter.dx)),
              right: max(0, 2 * (overlayCenter.dx - target.dx)),
              bottom: overlayRenderBox.size.height - target.dy + widget.offset,
            ),
          bottom => EdgeInsets.only(
              left: max(0, 2 * (target.dx - overlayCenter.dx)),
              right: max(0, 2 * (overlayCenter.dx - target.dx)),
              top: target.dy + widget.offset,
            ),
          int() => throw "Invalid direction",
        },
        child: Align(
          alignment: switch (popOverDirection) {
            top => Alignment.bottomCenter,
            bottom => Alignment.topCenter,
            left => Alignment.centerRight,
            right => Alignment.centerLeft,
            int() => throw "Invalid direction",
          },
          child: _Animation(
            direction: switch (popOverDirection) {
              top => _AnimationDirection.top,
              bottom => _AnimationDirection.bottom,
              left => _AnimationDirection.left,
              right => _AnimationDirection.right,
              int() => throw "Invalid direction",
            },
            child: Flex(
              direction: widget.axis,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (popOverDirection == bottom) _Arrow.top(color: popOverColor),
                if (popOverDirection == right) _Arrow.left(color: popOverColor),
                Flexible(
                  child: FluentContainer(
                    cornerRadius: FluentCornerRadius.xLarge,
                    shadow: FluentThemeDataModel.of(context)
                        .fluentShadowTheme
                        ?.shadow16,
                    color: popOverColor,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if ((widget.title ?? widget.subtitle) != null) ...[
                            Column(
                              children: [
                                SizedBox(
                                  height: 44,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (widget.title != null)
                                        DefaultTextStyle.merge(
                                            style:
                                                FluentThemeDataModel.of(context)
                                                            .fluentTextTheme
                                                            ?.body1Strong
                                                        as TextStyle? ??
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                            child: widget.title!),
                                      if (widget.subtitle != null)
                                        DefaultTextStyle.merge(
                                          style:
                                              FluentThemeDataModel.of(context)
                                                          .fluentTextTheme
                                                          ?.caption2
                                                      as TextStyle? ??
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                          child: widget.subtitle!,
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                  child: ClipRRect(
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: FluentContainer(
                                        strokeStyle:
                                            FluentThemeDataModel.of(context)
                                                .fluentStrokeTheme
                                                ?.stroke1,
                                        child: Opacity(
                                            opacity: 0,
                                            child: Column(
                                              children: [
                                                widget.body,
                                                if (widget.title != null)
                                                  widget.title!,
                                                if (widget.subtitle != null)
                                                  widget.subtitle!,
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          Flexible(
                            child: SingleChildScrollView(
                              child: widget.body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (popOverDirection == top) _Arrow.bottom(color: popOverColor),
                if (popOverDirection == left) _Arrow.right(color: popOverColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    controller.show();
    widget.onOpen?.call();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        controller: controller.overlayController,
        overlayChildBuilder: overlayChildBuilder,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            widget.child,
            Positioned.fill(
              child: RawMaterialButton(
                visualDensity: VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                onPressed: onPressed,
                child: Opacity(
                  opacity: 0,
                  child: widget.child,
                ),
              ),
            )
          ],
        ));
  }
}

enum _ArrowDirection {
  top,
  bottom,
  left,
  right,
}

class _Arrow extends StatelessWidget {
  final _ArrowDirection direction;
  final Color color;

  const _Arrow.top({required this.color}) : direction = _ArrowDirection.top;

  const _Arrow.bottom({required this.color})
      : direction = _ArrowDirection.bottom;

  const _Arrow.left({required this.color}) : direction = _ArrowDirection.left;

  const _Arrow.right({required this.color}) : direction = _ArrowDirection.right;

  @override
  Widget build(BuildContext context) {
    if (direction == _ArrowDirection.left ||
        direction == _ArrowDirection.right) {
      return SizedBox(
        width: 13,
        height: 47,
        child: OverflowBox(
          maxWidth: 14,
          child: ClipPath(
            clipper: _ArrowCustomClipper(direction),
            child: Container(
              width: 14,
              height: 47,
              color: color,
            ),
          ),
        ),
      );
    }
    return SizedBox(
      width: 47,
      height: 13,
      child: OverflowBox(
        maxHeight: 14,
        child: ClipPath(
          clipper: _ArrowCustomClipper(direction),
          child: Container(
            width: 47,
            height: 14,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _ArrowCustomClipper extends CustomClipper<Path> {
  final _ArrowDirection direction;

  _ArrowCustomClipper(this.direction);

  @override
  Path getClip(Size size) {
    return switch (direction) {
      _ArrowDirection.top => _top(size),
      _ArrowDirection.bottom => _bottom(size),
      _ArrowDirection.left => _left(size),
      _ArrowDirection.right => _right(size),
    };
  }

  Path _top(Size size) {
    return Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height - 0.5)
      ..cubicTo(
          size.width / 3, size.height, size.width * 2 / 5, 0, size.width / 2, 0)
      ..cubicTo(size.width * 3 / 5, 0, size.width * 2 / 3, size.height,
          size.width, size.height - 0.5)
      ..lineTo(size.width, size.height);
  }

  Path _bottom(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, 0.5)
      ..cubicTo(size.width / 3, 0, size.width * 2 / 5, size.height,
          size.width / 2, size.height)
      ..cubicTo(size.width * 3 / 5, size.height, size.width * 2 / 3, 0,
          size.width, 0.5)
      ..lineTo(size.width, 0);
  }

  Path _left(Size size) {
    return Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width - 0.5, 0)
      ..cubicTo(size.width, size.height / 3, 0, size.height * 2 / 5, 0,
          size.height / 2)
      ..cubicTo(0, size.height * 3 / 5, size.width, size.height * 2 / 3,
          size.width - 0.5, size.height)
      ..lineTo(size.width, size.height);
  }

  Path _right(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0.5, 0)
      ..cubicTo(0, size.height / 3, size.width, size.height * 2 / 5, size.width,
          size.height / 2)
      ..cubicTo(size.width, size.height * 3 / 5, 0, size.height * 2 / 3, 0.5,
          size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

enum _AnimationDirection { top, bottom, left, right }

class _Animation extends StatelessWidget {
  final Widget child;
  final _AnimationDirection direction;

  const _Animation({required this.child, required this.direction});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(milliseconds: 200),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.scale(
            alignment: switch (direction) {
              _AnimationDirection.top => Alignment.bottomCenter,
              _AnimationDirection.bottom => Alignment.topCenter,
              _AnimationDirection.left => Alignment.centerRight,
              _AnimationDirection.right => Alignment.centerLeft,
            },
            scale: value,
            child: child,
          );
        },
        child: child);
  }
}

class _InternalFluentPopoverController extends FluentPopoverController {}
