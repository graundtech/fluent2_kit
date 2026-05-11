import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentPresenceBadgesView extends StatelessWidget {
  const FluentPresenceBadgesView({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = <_PresenceBadgeSample>[
      // Note: class name "AvaliablePresenceBadge" has a typo in the package.
      _PresenceBadgeSample("Available", AvaliablePresenceBadge()),
      _PresenceBadgeSample("Away", AwayPresenceBadge()),
      _PresenceBadgeSample("Busy", BusyPresenceBadge()),
      _PresenceBadgeSample("Do Not Disturb", DNDPresenceBadge()),
      _PresenceBadgeSample("Blocked", BlockedPresenceBadge()),
      _PresenceBadgeSample("Out of Office", OOFPresenceBadge()),
      _PresenceBadgeSample("Offline", OfflinePresenceBadge()),
      _PresenceBadgeSample("Unknown", UnknownPresenceBadge()),
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Presence Badges",
          subtitle: "Components > Presence Badges",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description:
                    "Presence badges indicate a user's availability and are typically overlaid on an avatar.",
              ),
              FluentStrokeDivider(
                height: FluentSize.size480.value,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: FluentSize.size160.value,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: FluentSize.size240.value,
                  runSpacing: FluentSize.size240.value,
                  children: badges
                      .map(
                        (sample) => SizedBox(
                          width: 96,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: FluentSize.size240.value,
                                height: FluentSize.size240.value,
                                child: sample.badge,
                              ),
                              SizedBox(height: FluentSize.size80.value),
                              FluentText(
                                sample.label,
                                textAlign: TextAlign.center,
                                style: FluentThemeDataModel.of(context)
                                    .fluentTextTheme
                                    ?.caption2,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PresenceBadgeSample {
  final String label;
  final Widget badge;

  _PresenceBadgeSample(this.label, this.badge);
}
