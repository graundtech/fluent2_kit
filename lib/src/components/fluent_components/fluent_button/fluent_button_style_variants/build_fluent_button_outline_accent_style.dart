part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonOutlineAccentStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final FluentButtonSize size = fluentButtonStyle.size;
  final WidgetStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final strokeRestColor = FluentColors.of(context)?.brandStroke1Rest;
  final strokePressedColor = FluentColors.of(context)?.brandStroke1Pressed;
  final strokeFocusedColor = colorMode(
    FluentColors.neutralStrokeFocus2Rest,
    FluentDarkColors.neutralStrokeFocus2Rest,
  );
  final strokeDisabledColor = colorMode(
    FluentColors.neutralStrokeDisabledRest,
    FluentDarkColors.neutralStrokeDisabledRest,
  );

  return ButtonStyle(
    backgroundColor:
        backgroundColor ?? WidgetStateProperty.all(Colors.transparent),
    shape: WidgetStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            WidgetState.pressed => strokePressedColor != null
                ? RoundedRectangleBorder(
                    side: BorderSide(
                      color: strokePressedColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      size == FluentButtonSize.large
                          ? FluentCornerRadius.xLarge.value
                          : FluentCornerRadius.large.value,
                    ),
                  )
                : null,
            WidgetState.focused => RoundedRectangleBorder(
                side: BorderSide(
                    color: strokeFocusedColor,
                    width: size == FluentButtonSize.large
                        ? FluentStrokeThickness.strokeWidth30.value
                        : FluentStrokeThickness.strokeWidth20.value),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              ),
            WidgetState.disabled => RoundedRectangleBorder(
                side: BorderSide(
                  color: strokeDisabledColor,
                ),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              ),
            _ => null,
          };
        }
        return strokeRestColor != null
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: strokeRestColor,
                ),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              )
            : null;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            WidgetState.pressed =>
              FluentColors.of(context)?.brandForeground1Pressed,
            WidgetState.focused =>
              FluentColors.of(context)?.brandForeground1Rest,
            WidgetState.disabled => colorMode(
                FluentColors.neutralForegroundDisabled1Rest,
                FluentDarkColors.neutralForegroundDisabled1Rest,
              ),
            _ => null,
          };
        }
        if (states.contains(WidgetState.disabled)) {
          return colorMode(
            FluentColors.neutralForegroundDisabled1Rest,
            FluentDarkColors.neutralForegroundDisabled1Rest,
          );
        }
        return FluentColors.of(context)?.brandForeground1Rest;
      },
    ),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ).merge(_fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle, context: context));
}
