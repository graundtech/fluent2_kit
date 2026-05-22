import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentCard extends StatelessWidget {
  final Widget? coverImage;
  final String text;
  final String? subText;
  final double? leadingBoxSize;
  final Widget? leading;
  final VoidCallback? onPressed;
  final Color? highlightColor;
  final bool isFullWidth;

  /// FluentCard's constructor
  FluentCard({
    super.key,
    required this.text,
    this.subText,
    this.coverImage,
    this.isFullWidth = false,
    this.onPressed,
    this.highlightColor,
    this.leadingBoxSize = 24,
    this.leading,
  });

  Widget conditionalButton({required Widget child}) {
    if (onPressed == null) {
      return child;
    }
    Size size = Size.zero;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Stack(
          fit: StackFit.passthrough,
          children: [
            Builder(builder: (context) {
              if (size == Size.zero) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() => size = context.size ?? size);
                });
              }
              return child;
            }),
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(FluentCornerRadius.large.value),
              child: RawMaterialButton(
                highlightColor: highlightColor,
                visualDensity: VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                onPressed: onPressed,
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coverImage = this.coverImage;
    final leading = this.leading;
    final subText = this.subText;
    final colorMode = createColorMode(Theme.of(context).brightness);

    return conditionalButton(
      child: FluentCardContainer(
        width: isFullWidth ? double.maxFinite : 280,
        constraints: coverImage != null ? BoxConstraints(maxHeight: 192) : null,
        child: Column(
          children: [
            if (coverImage != null)
              Expanded(
                child: coverImage,
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  if (leading != null)
                    if (leading is Icon) ...[
                      IconTheme(
                        data: IconThemeData(
                            color: colorMode(
                          FluentColors.neutralForeground3Rest,
                          FluentDarkColors.neutralForeground3Rest,
                        )),
                        child: leading,
                      ),
                      const SizedBox(width: 12),
                    ] else ...[
                      FluentContainer(
                        width: leadingBoxSize,
                        height: leadingBoxSize,
                        child: leading,
                      ),
                      const SizedBox(width: 12),
                    ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentText(
                          text,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.body2,
                        ),
                        if (subText != null)
                          FluentText(
                            subText,
                            textOverflow: TextOverflow.ellipsis,
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
