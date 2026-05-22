import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool? value)? onChanged;

  const FluentCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final onChanged = this.onChanged;
    return Center(
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) {
            onChanged(value);
          }
        },
        child: Column(
          children: [
            Transform.scale(
              scale: 0.5,
              child: FluentContainer(
                cornerRadius: FluentCornerRadius.circle,
                strokeStyle: FluentStrokeStyle(
                  padding: 0,
                  color: value
                      ? Colors.transparent
                      : onChanged != null
                          ? colorMode(
                              FluentColors.neutralStrokeAccessibleRest,
                              FluentDarkColors.neutralStrokeAccessibleRest,
                            )
                          : colorMode(
                              FluentColors.neutralStrokeDisabledRest,
                              FluentDarkColors.neutralStrokeDisabledRest,
                            ),
                  thickness: FluentStrokeThickness.strokeWidth10,
                ),
                child: CircleAvatar(
                  backgroundColor: value == true
                      ? onChanged != null
                          ? FluentColors.of(context)?.brandBackground1Rest
                          : FluentColors.of(context)
                              ?.brandBackgroundDisabledRest
                      : Colors.transparent,
                  child: Checkbox(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    activeColor: Colors.transparent,
                    fillColor: WidgetStatePropertyAll(Colors.transparent),
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.transparent),
                    value: value,
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
