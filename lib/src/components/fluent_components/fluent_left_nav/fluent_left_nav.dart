import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentLeftNav extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;
  final Widget? header;
  final FluentAvatar? headerAvatar;

  const FluentLeftNav({
    super.key,
    this.header,
    this.backgroundColor,
    required this.body,
    this.headerAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final header = this.header;
    final headerAvatar = this.headerAvatar;

    return Drawer(
        child: Container(
      color: backgroundColor ??
          colorMode(
            FluentColors.neutralBackground2Rest,
            FluentDarkColors.neutralBackground2Rest,
          ),
      padding: EdgeInsets.only(top: 54),
      child: Column(children: [
        if (headerAvatar != null)
          FluentContainer(
            width: double.maxFinite,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(FluentSize.size160.value),
            child: headerAvatar,
          ),
        if (header != null) ...[
          header,
          FluentStrokeDivider(),
        ],
        body
      ]),
    ));
  }
}
