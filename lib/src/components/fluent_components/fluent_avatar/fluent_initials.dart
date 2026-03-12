import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentInitials extends StatelessWidget {
  final String name;

  /// The color with opacity for the background.
  final Color? backgroundColor;

  /// The color that will be used in initials.
  final Color? foregroundColor;

  /// The Size of container, if not passed, the size will be double.maxFinite.
  final Size? size;

  /// The fontSize of the initials.
  final double? fontSize;

  /// The fontWeight of the initials.
  ///
  /// Can be passed the InitialsFontWeight.regular and InitialsFontWeight.medium values.
  final InitialsFontWeight? fontWeight;

  /// Show the initials of a person's name. This component must be used within FluentAvatar.
  const FluentInitials({
    required this.name,
    super.key,
    this.foregroundColor,
    this.backgroundColor,
    this.size,
    this.fontSize,
    this.fontWeight = InitialsFontWeight.regular,
  });

  String _getInitials(String name) {
    final List<String> nameParts = name.split(' ');
    String initials = '';

    for (var i = 0; i < nameParts.length && i < 3; i++) {
      final part = nameParts[i];

      if (part.isNotEmpty) {
        final firstLetter = part[0].toUpperCase();

        initials += firstLetter;
      }
    }

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: backgroundColor ??
          FluentColors.of(context)?.brandForegroundDisabled2Rest,
      width: size?.width ?? double.maxFinite,
      height: size?.height ?? double.maxFinite,
      alignment: Alignment.center,
      child: FluentText(
        _getInitials(name),
        style: FluentThemeDataModel.of(context)
            .fluentTextTheme
            ?.caption2
            ?.fluentCopyWith(
              fluentColor:
                  foregroundColor ?? Theme.of(context).colorScheme.primary,
              fluentSize: fontSize,
              fluentWeight: fontWeight == InitialsFontWeight.medium
                  ? MixedFluentFontWeight.semibold
                  : MixedFluentFontWeight.regular,
            ),
      ),
    );
  }
}

/// Preset value font weight to component initials
enum InitialsFontWeight {
  regular,
  medium,
}
