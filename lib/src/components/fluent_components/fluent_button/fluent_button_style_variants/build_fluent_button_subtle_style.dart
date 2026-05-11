part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonSubtleStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final FluentButtonSize size = fluentButtonStyle.size;
  final WidgetStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final Color? foregroundPressedColor =
      FluentColors.of(context)?.brandForeground1Pressed;
  final Color? foregroundFocusedColor =
      FluentColors.of(context)?.brandForeground1Rest;
  final Color foregroundDisabledColor = colorMode(
    FluentColors.neutralForegroundDisabled1Rest,
    FluentDarkColors.neutralForegroundDisabled1Rest,
  );
  final Color? foregroundRestColor =
      FluentColors.of(context)?.brandForeground1Rest;

  return ButtonStyle(
    backgroundColor:
        backgroundColor ?? WidgetStateProperty.all(Colors.transparent),
    shape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return RoundedRectangleBorder(
          side: BorderSide(
            color: colorMode(
              FluentColors.neutralStrokeFocus2Rest,
              FluentDarkColors.neutralStrokeFocus2Rest,
            ),
            width: size == FluentButtonSize.large
                ? FluentStrokeThickness.strokeWidth30.value
                : FluentStrokeThickness.strokeWidth20.value,
          ),
          borderRadius: BorderRadius.circular(
            size == FluentButtonSize.large
                ? FluentCornerRadius.xLarge.value
                : FluentCornerRadius.large.value,
          ),
        );
      }
      return null;
    }),
    foregroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            WidgetState.pressed => foregroundPressedColor,
            WidgetState.focused => foregroundFocusedColor,
            WidgetState.disabled => foregroundDisabledColor,
            _ => null,
          };
        }
        return foregroundRestColor;
      },
    ),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ).merge(_fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle, context: context));
}
