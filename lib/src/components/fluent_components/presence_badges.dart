import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class AvailablePresenceBadge extends StatelessWidget {
  const AvailablePresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_available_12_filled,
        color: colorMode(
          Color(0xFF13A10E),
          Color(0xFF3DB838),
        ),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class AwayPresenceBadge extends StatelessWidget {
  const AwayPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_away_12_filled,
        color: Color(0xFFEAA300),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class BlockedPresenceBadge extends StatelessWidget {
  const BlockedPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_blocked_12_regular,
        color: colorMode(
          Color(0xFFD13438),
          Color(0xFFD7494C),
        ),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class BusyPresenceBadge extends StatelessWidget {
  const BusyPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_busy_12_filled,
        color: colorMode(Color(0xFFD13438), Color(0xFFD7494C)),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class DNDPresenceBadge extends StatelessWidget {
  const DNDPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      cornerRadius: FluentCornerRadius.circle,
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_dnd_12_filled,
        color: colorMode(Color(0xFFD13438), Color(0xFFD7494C)),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class OfflinePresenceBadge extends StatelessWidget {
  const OfflinePresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      cornerRadius: FluentCornerRadius.circle,
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_offline_12_regular,
        color: colorMode(
          FluentColors.neutralForeground3Rest,
          FluentDarkColors.neutralForeground3Rest,
        ),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class OOFPresenceBadge extends StatelessWidget {
  const OOFPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      cornerRadius: FluentCornerRadius.circle,
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_oof_12_regular,
        color: colorMode(
          Color(0xFFC239B3),
          Color(0xFFD161C4),
        ),
        size: FluentSize.size120.value,
      ),
    );
  }
}

class UnknownPresenceBadge extends StatelessWidget {
  const UnknownPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentContainer(
      color: colorMode(
        FluentColors.neutralBackground3Rest,
        FluentDarkColors.neutralBackground3Rest,
      ),
      cornerRadius: FluentCornerRadius.circle,
      strokeStyle: FluentStrokeStyle(
          color: colorMode(
            FluentColors.neutralBackground3Rest,
            FluentDarkColors.neutralBackground3Rest,
          ),
          thickness: FluentStrokeThickness.strokeWidth20),
      child: Icon(
        FluentIcons.presence_unknown_12_regular,
        color: colorMode(
          FluentColors.neutralForeground3Rest,
          FluentDarkColors.neutralForeground3Rest,
        ),
        size: FluentSize.size120.value,
      ),
    );
  }
}
