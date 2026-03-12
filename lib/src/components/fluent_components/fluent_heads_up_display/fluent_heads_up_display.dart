import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentHeadsUpDisplay extends StatefulWidget {
  final String? text;

  const FluentHeadsUpDisplay({
    super.key,
    this.text,
  });

  @override
  State<FluentHeadsUpDisplay> createState() => _FluentHeadsUpDisplayState();
}

class _FluentHeadsUpDisplayState extends State<FluentHeadsUpDisplay> {
  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final text = widget.text;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 192,
        maxHeight: text == null ? 100 : 108,
        minWidth: text == null ? 100 : 108,
        minHeight: text == null ? 100 : 108,
      ),
      child: FluentContainer(
        color: colorMode(
          FluentColors.neutralBackgroundStaticDarkRest,
          FluentDarkColors.neutralBackgroundStaticDarkRest,
        ),
        cornerRadius: FluentCornerRadius.medium,
        child: Padding(
          padding: EdgeInsets.all(
            FluentSize.size160.value,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: colorMode(
                  FluentColors.controlsHudForeground2Rest,
                  FluentDarkColors.controlsHudForeground2Rest,
                ),
              ),
              if (text != null) ...[
                SizedBox(
                  height: 12,
                ),
                FluentText(
                  text,
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.body1
                      ?.fluentCopyWith(
                        fluentColor: colorMode(
                          FluentColors.neutralForegroundStaticLightRest,
                          FluentDarkColors.neutralForegroundStaticLightRest,
                        ),
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
