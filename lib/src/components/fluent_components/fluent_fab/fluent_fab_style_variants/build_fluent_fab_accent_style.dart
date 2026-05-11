part of '../fluent_fab.dart';

ButtonStyle _buildFluentFabAccentStyle(
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
            return FluentColors.of(context)?.brandBackground1Pressed;
          }
          if (states.contains(WidgetState.focused)) {
            return FluentColors.of(context)?.brandBackground1Selected;
          }
          return FluentColors.of(context)?.brandBackground1Rest;
        }),
    foregroundColor: style.foregroundColor ??
        WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorMode(
              FluentColors.neutralForegroundDisabled1Rest,
              FluentDarkColors.neutralForegroundDisabled1Rest,
            );
          }
          return Colors.white;
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
