import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentProgressBar extends StatelessWidget {
  final double? value;

  const FluentProgressBar({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final value = this.value;
    return SizedBox(
      width: double.maxFinite,
      height: double.minPositive,
      child: OverflowBox(
        maxHeight: 2,
        minHeight: 2,
        alignment: Alignment.topCenter,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: 20,
            color: colorMode(
              FluentColors.neutralStroke1Rest,
              FluentDarkColors.neutralStroke1Rest,
            ),
            padding: value == null
                ? null
                : EdgeInsets.only(
                    right: max(0, (1 - value) * constraints.maxWidth)),
            //constraints.maxWidth*(value??0),
            child: value == null
                ? _Animated()
                : Container(
                    color: FluentColors.of(context)!.brandBackground1Rest,
                  ),
          );
        }),
      ),
    );
  }
}

class _Animated extends StatefulWidget {
  @override
  State<_Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<_Animated> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OverflowBox(
        alignment: Alignment.centerLeft,
        maxWidth: constraints.maxWidth * 2,
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset(
                -constraints.maxWidth * controller.value,
                0,
              ),
              child: child,
            );
          },
          child: Row(
            children: [
              _Gradient(width: constraints.maxWidth),
              _Gradient(width: constraints.maxWidth)
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _Gradient extends StatelessWidget {
  final double width;

  const _Gradient({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.transparent,
            Colors.transparent,
            FluentColors.of(context)!.brandBackground1Rest,
            Colors.transparent,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
