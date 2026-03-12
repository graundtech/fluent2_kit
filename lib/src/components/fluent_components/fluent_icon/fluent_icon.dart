import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentIcon extends StatelessWidget {
  final IconData icon;

  final FluentIconVariant iconVariant;

  /// The width and height of the icon's container.
  final double? boxSize;

  /// The size of the icon.
  final double? iconSize;

  /// This color will be use for background and icon color variations.
  final Color? colorScheme;

  /// the icon's container background.
  final Color? backgroundColor;

  /// the icon color.
  final Color? iconColor;

  /// The corner radius of icon's container
  final FluentCornerRadius? cornerRadius;

  /// Creates an filled icon with a specified [icon] that must be filled.
  ///
  /// You can pass backgroundColor and iconColor to change styles
  ///
  /// Default color is primary.
  ///
  /// Filled theme icons are used for highlighting selected states or for smaller moments that need a little more weight and readabililty.
  ///
  const FluentIcon(
    this.icon, {
    super.key,
    this.boxSize,
    this.iconSize,
    this.iconColor,
    this.backgroundColor,
    this.cornerRadius,
  })  : iconVariant = FluentIconVariant.filled,
        colorScheme = null;

  /// Creates an filled icon with a specified [icon] that must be filled.
  ///
  /// You can pass colorScheme to change the background and icon color
  ///
  /// Default color is primary.
  ///
  /// Filled theme icons are used for highlighting selected states or for smaller moments that need a little more weight and readabililty.
  ///
  const FluentIcon.accentIcon(
    this.icon, {
    super.key,
    this.boxSize,
    this.iconSize,
    this.colorScheme,
    this.cornerRadius,
  })  : iconVariant = FluentIconVariant.accentIcon,
        backgroundColor = null,
        iconColor = null;

  /// Creates an outlined primary icon with a specified [icon] that must be regular.
  ///
  /// Regular themed icons are used primarily as a wayfinding device to help people identify and select available actions.
  ///
  /// The primary color will be used in icon color and background
  ///
  const FluentIcon.outlinedPrimaryIcon(
    this.icon, {
    super.key,
    this.boxSize,
    this.iconSize,
    this.cornerRadius,
  })  : iconVariant = FluentIconVariant.outlinedPrimaryIcon,
        colorScheme = null,
        backgroundColor = null,
        iconColor = null;

  /// Creates an outlined icon with a specified [icon] that must be regular.
  ///
  /// Regular themed icons are used primarily as a wayfinding device to help people identify and select available actions.
  ///
  /// You can pass colorScheme to change the background and icon color
  ///
  ///
  const FluentIcon.outlineIcon(
    this.icon, {
    super.key,
    this.boxSize,
    this.iconSize,
    this.colorScheme,
    this.cornerRadius,
  })  : iconVariant = FluentIconVariant.outlineIcon,
        backgroundColor = null,
        iconColor = null;

  Color? getBackgroundColor(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return switch (iconVariant) {
      FluentIconVariant.filled => backgroundColor ?? Colors.transparent,
      FluentIconVariant.accentIcon =>
        colorScheme ?? FluentColors.of(context)?.brandBackground1Rest,
      FluentIconVariant.outlinedPrimaryIcon =>
        FluentColors.of(context)?.brandBackgroundTintRest,
      FluentIconVariant.outlineIcon => colorScheme?.withAlpha((255*0.3).toInt()) ??
          colorMode(
            FluentColors.neutralBackground5Rest,
            FluentDarkColors.neutralBackground5Rest,
          ),
    };
  }

  Color? getIconColor(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return switch (iconVariant) {
      FluentIconVariant.filled =>
        iconColor ?? FluentColors.of(context)?.brandForeground1Rest,
      FluentIconVariant.accentIcon => Colors.white,
      FluentIconVariant.outlinedPrimaryIcon =>
        FluentColors.of(context)?.brandForegroundTintRest,
      FluentIconVariant.outlineIcon => colorScheme ??
          colorMode(
            FluentColors.neutralForeground2Rest,
            FluentDarkColors.neutralForeground2Rest,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FluentContainer(
      alignment: Alignment.center,
      padding: EdgeInsets.all(FluentSize.size40.value),
      cornerRadius: cornerRadius ?? FluentCornerRadius.circle,
      width: boxSize,
      height: boxSize,
      color: getBackgroundColor(context),
      child: Icon(
        icon,
        size: iconSize,
        color: getIconColor(context),
      ),
    );
  }
}

enum FluentIconVariant {
  filled,
  accentIcon,
  outlineIcon,
  outlinedPrimaryIcon,
}
