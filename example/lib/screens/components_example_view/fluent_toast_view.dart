import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentToastView extends StatelessWidget {
  const FluentToastView({super.key});

  @override
  Widget build(BuildContext context) {
    void showToast(FluentToastColor color) {
      FluentToast(
          toastColor: color,
          title: FluentText("Fluent 2 is here"),
          text: FluentText("See what’s changed."),
          icon: Icon(FluentIcons.sparkle_20_filled),
          action: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                FluentToastOverlayEntry.of(context).remove();
              },
              icon: Icon(Icons.cancel),
            ),
          )).show(
        context: context,
        duration: null,
        onDismissed: () {
          print("Fechou!");
        },
      );
    }

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Toast",
          subtitle: "Components > Fluent Toast",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FluentSectionDescription(
                description:
                    "Toast notifications can be dismissed automatically or after the user performs the action/cancel.",
              ),
              FluentStrokeDivider(
                height: FluentSize.size480.value,
              ),
              FluentContainer(
                width: double.maxFinite,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size120.value,
                  children: [
                    FluentButton(
                      title: "Accent Toast",
                      onPressed: () => showToast(
                        FluentToastColor.accent,
                      ),
                    ),
                    FluentButton(
                      title: "Neutral Toast",
                      onPressed: () => showToast(
                        FluentToastColor.neutral,
                      ),
                    ),
                    FluentButton(
                      title: "Danger Toast",
                      onPressed: () => showToast(
                        FluentToastColor.danger,
                      ),
                    ),
                    FluentButton(
                      title: "Warning Toast",
                      onPressed: () => showToast(
                        FluentToastColor.warning,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
