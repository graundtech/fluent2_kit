part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonOutlineStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final FluentButtonSize size = fluentButtonStyle.size;
  final WidgetStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final strokeRestColor = colorMode(
    FluentColors.neutralStroke1Rest,
    FluentDarkColors.neutralStroke1Rest,
  );
  final strokePressedColor = colorMode(
    FluentColors.neutralStroke1Pressed,
    FluentDarkColors.neutralStroke1Pressed,
  );
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
            WidgetState.pressed => RoundedRectangleBorder(
                side: BorderSide(
                  color: strokePressedColor,
                ),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              ),
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
        return RoundedRectangleBorder(
          side: BorderSide(
            color: strokeRestColor,
          ),
          borderRadius: BorderRadius.circular(
            size == FluentButtonSize.large
                ? FluentCornerRadius.xLarge.value
                : FluentCornerRadius.large.value,
          ),
        );
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return colorMode(
            FluentColors.neutralForegroundDisabled1Rest,
            FluentDarkColors.neutralForegroundDisabled1Rest,
          );
        }
        return colorMode(
          FluentColors.neutralForeground1Rest,
          FluentDarkColors.neutralForeground1Rest,
        );
      },
    ),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ).merge(_fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle, context: context));
}
