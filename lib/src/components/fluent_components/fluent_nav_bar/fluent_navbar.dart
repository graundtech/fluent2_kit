import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

import 'fluent_navbar_action_scope.dart';

Color? _controlsNavBarBackground1Rest(BuildContext context) =>
    FluentColors.of(context)?.brandBackground1Rest;
const _darkControlsNavBarBackground1Rest =
    FluentDarkColors.neutralBackground3Rest;

class FluentNavBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final NavTitleVariation? title;
  final Widget? leading;
  final Color? foregroundColor;
  final Widget? child;
  final FluentThemeColorVariation themeColorVariation;
  final Color? backgroundColor;
  final Gradient? gradient;
  final EdgeInsets? childPadding;

  /// FluentNavBar's constructor
  const FluentNavBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.foregroundColor,
    this.child,
    this.themeColorVariation = FluentThemeColorVariation.neutral,
    this.backgroundColor,
    this.gradient,
    this.childPadding,
  });

  @override
  Size get preferredSize => Size.fromHeight(child != null ? 96 : 48);

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final title = this.title;

    final bool isTitleCentered =
        title is NavCenterTitle || title is NavCenterSubtitle;

    final child = this.child;

    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            title?.avatar ?? const SizedBox(),
            if (title?.avatar != null) const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: isTitleCentered
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  FluentText(
                    title?.title ?? '',
                    style: title is NavLeftTitle
                        ? FluentThemeDataModel.of(
                            context,
                          ).fluentTextTheme?.title1?.fluentCopyWith(
                            fluentColor:
                                foregroundColor ??
                                (themeColorVariation ==
                                        FluentThemeColorVariation.brand
                                    ? colorMode(
                                        FluentColors
                                            .controlsNavBarForeground1Rest,
                                        FluentDarkColors
                                            .controlsNavBarForeground1Rest,
                                      )
                                    : colorMode(
                                        FluentColors.neutralForeground1Rest,
                                        FluentDarkColors.neutralForeground1Rest,
                                      )),
                          )
                        : FluentThemeDataModel.of(
                            context,
                          ).fluentTextTheme?.body1Strong?.fluentCopyWith(
                            fluentColor:
                                foregroundColor ??
                                (themeColorVariation ==
                                        FluentThemeColorVariation.brand
                                    ? colorMode(
                                        FluentColors
                                            .controlsNavBarForeground1Rest,
                                        FluentDarkColors
                                            .controlsNavBarForeground1Rest,
                                      )
                                    : colorMode(
                                        FluentColors.neutralForeground1Rest,
                                        FluentDarkColors.neutralForeground1Rest,
                                      )),
                            fluentWeight: FluentFontWeight.bold,
                          ),
                  ),
                  if (title?.subtitle != null)
                    FluentText(
                      title?.subtitle ?? '',
                      textOverflow: TextOverflow.ellipsis,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption2
                          ?.fluentCopyWith(
                            fluentColor:
                                foregroundColor ??
                                (themeColorVariation ==
                                        FluentThemeColorVariation.brand
                                    ? colorMode(
                                        FluentColors
                                            .controlsNavBarForeground2Rest,
                                        FluentDarkColors
                                            .controlsNavBarForeground2Rest,
                                      )
                                    : colorMode(
                                        FluentColors.neutralForeground2Rest,
                                        FluentDarkColors.neutralForeground2Rest,
                                      )),
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
        titleSpacing: 16,
        leading: leading,
        centerTitle: isTitleCentered,
        actions: actions
            ?.map(
              (action) => Padding(
                padding: title is NavLeftTitle
                    ? const EdgeInsets.only(right: 20)
                    : const EdgeInsets.only(right: 16),
                child: FluentNavBarActionScope(
                  themeColorVariation: themeColorVariation,
                  child: action,
                ),
              ),
            )
            .toList(),
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: gradient)),
        backgroundColor:
            backgroundColor ??
            (themeColorVariation == FluentThemeColorVariation.brand
                ? colorMode(
                    _controlsNavBarBackground1Rest(context),
                    _darkControlsNavBarBackground1Rest,
                  )
                : colorMode(
                    FluentColors.neutralBackground3Rest,
                    FluentDarkColors.neutralBackground3Rest,
                  )),
        foregroundColor:
            foregroundColor ??
            (themeColorVariation == FluentThemeColorVariation.brand
                ? Colors.white
                : colorMode(
                    FluentColors.neutralForeground2Rest,
                    FluentDarkColors.neutralForeground2Rest,
                  )),
        bottom: child != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          childPadding ??
                          EdgeInsets.only(
                            right: FluentSize.size160.value,
                            left: FluentSize.size160.value,
                            bottom: FluentSize.size80.value,
                          ),
                      child: child,
                    ),
                    FluentStrokeDivider(),
                  ],
                ),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Column(
                  children: [
                    SizedBox(height: FluentSize.size80.value),
                    FluentStrokeDivider(),
                  ],
                ),
              ),
      ),
    );
  }
}
