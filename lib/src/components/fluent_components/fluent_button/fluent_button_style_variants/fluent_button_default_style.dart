part of '../fluent_button.dart';

ButtonStyle _fluentButtonDefaultStyle(
    {required FluentButtonStyle fluentButtonStyle,
    required BuildContext context}) {
  final fluentTheme = FluentThemeDataModel.of(context) as Fluent2ThemeData;

  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(Size(
        64,
        fluentButtonStyle.size == FluentButtonSize.small
            ? 28
            : fluentButtonStyle.size == FluentButtonSize.medium
                ? 40
                : 52)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: fluentButtonStyle.size == FluentButtonSize.large
            ? BorderRadius.circular(FluentCornerRadius.xLarge.value)
            : BorderRadius.circular(FluentCornerRadius.large.value),
      ),
    ),
    padding: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return switch (fluentButtonStyle.size) {
          FluentButtonSize.small => EdgeInsets.symmetric(
              vertical: 0, horizontal: FluentSize.size80.value),
          FluentButtonSize.medium => EdgeInsets.symmetric(
              vertical: 0, horizontal: FluentSize.size120.value),
          FluentButtonSize.large => EdgeInsets.symmetric(
              vertical: 0, horizontal: FluentSize.size200.value),
        };
      },
    ),
    textStyle: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return switch (fluentButtonStyle.size) {
          FluentButtonSize.small => fluentTheme.fluentTextTheme?.caption1Strong,
          FluentButtonSize.medium =>
            fluentTheme.fluentTextTheme?.caption1Strong,
          FluentButtonSize.large => fluentTheme.fluentTextTheme?.body1Strong,
        };
      },
    ),
    iconSize: fluentButtonStyle.size == FluentButtonSize.small
        ? WidgetStateProperty.all(FluentSize.size160.value)
        : WidgetStateProperty.all(FluentSize.size200.value),
    animationDuration: Duration.zero,
  );
}
