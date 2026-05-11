part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonAccentStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final WidgetStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final WidgetStateProperty<Color?>? foregroundColor =
      fluentButtonStyle.foregroundColor;

  return ButtonStyle(
    backgroundColor: backgroundColor ??
        WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.length == 1) {
              return switch (states.single) {
                WidgetState.pressed =>
                  FluentColors.of(context)?.brandBackground1Pressed,
                WidgetState.focused =>
                  FluentColors.of(context)?.brandBackground1Selected,
                WidgetState.disabled => colorMode(
                    FluentColors.neutralBackground5Rest,
                    FluentDarkColors.neutralBackground5Rest,
                  ),
                _ => null,
              };
            }
            return FluentColors.of(context)?.brandBackground1Rest;
          },
        ),
    foregroundColor: foregroundColor ??
        WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return colorMode(
                FluentColors.neutralForegroundDisabled1Rest,
                FluentDarkColors.neutralForegroundDisabled1Rest,
              );
            }
            return Colors.white;
          },
        ),
  ).merge(
    _fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle,
      context: context,
    ),
  );
}
