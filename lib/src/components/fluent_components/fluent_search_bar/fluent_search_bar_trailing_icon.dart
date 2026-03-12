import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';
import 'package:fluent2ui/src/components/fluent_components/fluent_search_bar/cancel_icon.dart';

class FluentSearchBarTrailingIcon extends StatelessWidget {
  final void Function() onTapCancelIcon;
  final Widget icon;
  final bool isNotEmpty;
  final bool isLoading;
  final bool hasFocus;

  const FluentSearchBarTrailingIcon({
    super.key,
    required this.icon,
    required this.hasFocus,
    required this.isLoading,
    required this.isNotEmpty,
    required this.onTapCancelIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final icon = this.icon;
    return FluentContainer(
      child: isNotEmpty && isLoading
          ? CancelIcon(
              isLoading: isLoading,
              onTap: onTapCancelIcon,
            )
          : hasFocus && isNotEmpty
              ? CancelIcon(
                  isLoading: isLoading,
                  onTap: onTapCancelIcon,
                )
              : IconTheme(
                  data: IconThemeData(
                    color: colorMode(
                      FluentColors.neutralForeground2Rest,
                      FluentDarkColors.neutralForeground2Rest,
                    ),
                    size: FluentSize.size200.value,
                  ),
                  child: icon,
                ),
    );
  }
}
