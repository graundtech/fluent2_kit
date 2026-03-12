import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

part 'fluent_banner_color.dart';

class FluentBanner extends StatelessWidget {
  final FluentBannerColor bannerColor;
  final String text;

  const FluentBanner({
    super.key,
    required this.bannerColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final textColor = switch (bannerColor) {
      FluentBannerColor.accent =>
        FluentColors.of(context)?.brandForegroundTintRest,
      FluentBannerColor.subtle =>
        FluentColors.of(context)?.brandForeground1Rest,
      FluentBannerColor.neutral => colorMode(
          FluentColors.neutralForeground2Rest,
          FluentDarkColors.neutralForeground2Rest,
        ),
    };
    final backgroundColor = switch (bannerColor) {
      FluentBannerColor.accent =>
        FluentColors.of(context)?.brandBackgroundTintRest,
      FluentBannerColor.subtle => colorMode(
          FluentColors.neutralBackground1Rest,
          FluentDarkColors.neutralBackground1Rest,
        ),
      FluentBannerColor.neutral => colorMode(
          FluentColors.neutralBackground5Rest,
          FluentDarkColors.neutralBackground5Rest,
        ),
    };

    var buildBorder = ({required Widget child}) => child;

    if (bannerColor == FluentBannerColor.subtle) {
      buildBorder = ({required Widget child}) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [FluentStrokeDivider(), child],
        );
      };
    }

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: buildBorder(
          child: SizedBox(
            width: double.maxFinite,
            height: 52,
            child: Center(
              child: FluentText(
                text,
                style: FluentThemeDataModel.of(context)
                    .fluentTextTheme
                    ?.body2
                    ?.fluentCopyWith(
                      fluentColor: textColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
