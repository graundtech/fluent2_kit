import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentAvatar extends StatelessWidget {
  final Widget child;

  /// Avatar will be displayed in a square
  final bool? isGroup;

  /// The avatar stroke
  final FluentStrokeStyle? strokeStyle;

  /// Signaling the user's current availability and status to others, presence is indicated through an avatar badge.
  final StatusPresenceBadge? statusPresenceBadge;

  /// Signifying the dynamic information linked to a specific avatar or user, an avatar cutout is commonly used in notifications or activity feeds.
  final Widget? cutout;

  /// The avatar size
  final FluentAvatarSize? size;

  /// The avatar cutout size
  final CutoutSize? cutoutSize;

  /// Fluent Avatars can have presence badges, stroke, cutout (avatars at 40 and 56 pixels).
  ///
  /// Both a photo and the initials (Use FluentInitials component) of a person on a circular background can be used inside child or group may be displayed on a square background.
  const FluentAvatar({
    required this.child,
    super.key,
    this.isGroup = false,
    this.strokeStyle,
    this.statusPresenceBadge,
    this.cutout,
    this.size,
    this.cutoutSize = CutoutSize.size20,
  }) : assert(
          cutout != null && statusPresenceBadge == null ||
              cutout == null && statusPresenceBadge != null ||
              cutout == null && statusPresenceBadge == null,
          'Cannot have statusPresenceBadge && cutout values',
        );

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    assert(
      (cutout == null) || (size?.value == 40 || size?.value == 56),
      'The cutout can only be passed for sizes 40 and 56.',
    );

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        // Avatar
        FluentContainer(
          strokeStyle: strokeStyle,
          width: size?.value ?? 56,
          height: size?.value ?? 56,
          color: colorMode(
            FluentColors.neutralBackground5Rest,
            FluentDarkColors.neutralBackground5Rest,
          ),
          cornerRadius: isGroup != true
              ? FluentCornerRadius.circle
              : FluentCornerRadius.large,
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),

        // Status Presence Badge
        if (statusPresenceBadge != null && cutout == null)
          switch (statusPresenceBadge) {
            StatusPresenceBadge.avaliable => Positioned(
                right: -1,
                bottom: -1,
                child: AvaliablePresenceBadge(),
              ),
            StatusPresenceBadge.away => Positioned(
                right: -1,
                bottom: -1,
                child: AwayPresenceBadge(),
              ),
            StatusPresenceBadge.blocked => Positioned(
                right: -1,
                bottom: -1,
                child: BlockedPresenceBadge(),
              ),
            StatusPresenceBadge.busy => const Positioned(
                right: -1,
                bottom: -1,
                child: BusyPresenceBadge(),
              ),
            StatusPresenceBadge.dnd => Positioned(
                right: -1,
                bottom: -1,
                child: DNDPresenceBadge(),
              ),
            StatusPresenceBadge.offline => Positioned(
                right: -1,
                bottom: -1,
                child: OfflinePresenceBadge(),
              ),
            StatusPresenceBadge.oof => Positioned(
                right: -1,
                bottom: -1,
                child: OOFPresenceBadge(),
              ),
            StatusPresenceBadge.unknown => Positioned(
                right: -1,
                bottom: -1,
                child: UnknownPresenceBadge(),
              ),
            _ => throw Exception('Invalid value in status presence badge')
          },

        // Cutouts
        if (cutout != null &&
            statusPresenceBadge == null &&
            (size?.value == 40 || size?.value == 56))
          Positioned(
            right: -4,
            bottom: -4,
            child: FluentContainer(
              color: colorMode(
                FluentColors.neutralBackground5Rest,
                FluentDarkColors.neutralBackground5Rest,
              ),
              cornerRadius: FluentCornerRadius.circle,
              width: cutoutSize == CutoutSize.size28 ? 28 : 20,
              height: cutoutSize == CutoutSize.size28 ? 28 : 20,
              strokeStyle: FluentStrokeStyle(
                thickness: FluentStrokeThickness.strokeWidth20,
                color: colorMode(FluentColors.neutralBackground3Rest,
                    FluentDarkColors.neutralBackground3Rest),
              ),
              padding: const EdgeInsets.all(2),
              child: cutout,
            ),
          ),
      ],
    );
  }
}

enum StatusPresenceBadge {
  // TODO: fix this name in the next version => available
  avaliable,
  away,
  blocked,
  busy,
  dnd,
  offline,
  oof,
  unknown
}

enum CutoutSize { size20, size28 }
