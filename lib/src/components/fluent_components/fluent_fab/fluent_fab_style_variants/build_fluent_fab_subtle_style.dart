part of '../fluent_fab.dart';

ButtonStyle _buildFluentFabSubtleStyle(
  _FluentFabStyle style,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);

  return ButtonStyle(
    backgroundColor: style.backgroundColor ??
        WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorMode(
              FluentColors.neutralBackground5Rest,
              FluentDarkColors.neutralBackground5Rest,
            );
          }
          if (states.contains(WidgetState.pressed)) {
            return colorMode(
              FluentColors.neutralBackground1Pressed,
              FluentDarkColors.neutralBackground1Pressed,
            );
          }
          return colorMode(
            FluentColors.neutralBackground1Rest,
            FluentDarkColors.neutralBackground1Rest,
          );
        }),
    foregroundColor: style.foregroundColor ??
        WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorMode(
              FluentColors.neutralForegroundDisabled1Rest,
              FluentDarkColors.neutralForegroundDisabled1Rest,
            );
          }
          return colorMode(
            FluentColors.neutralForeground2Rest,
            FluentDarkColors.neutralForeground2Rest,
          );
        }),
    side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
      if (states.contains(WidgetState.focused)) {
        return BorderSide(
          color: colorMode(
            FluentColors.neutralStrokeFocus2Rest,
            FluentDarkColors.neutralStrokeFocus2Rest,
          ),
          width: FluentStrokeThickness.strokeWidth20.value,
        );
      }
      return null;
    }),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ).merge(_fluentFabDefaultStyle(style));
}
