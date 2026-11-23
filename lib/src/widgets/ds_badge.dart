import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Info badge with a leading dot (`Badge`, Tone=Info, Emphasis=Subtle).
class DsBadge extends StatelessWidget {
  const DsBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DsSizes.badgeHeight,
      padding: const EdgeInsets.symmetric(horizontal: DsSpacing.badgePadX),
      decoration: BoxDecoration(
        color: DsColors.statusInfoBgSubtle,
        borderRadius: BorderRadius.circular(DsRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: DsColors.statusInfoBgBold,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: DsSpacing.inlineXs),
          Text(
            label,
            style:
                DsTypography.overline.copyWith(color: DsColors.statusInfoText),
          ),
        ],
      ),
    );
  }
}

/// Unread marker (`NotificationDot`, Kind=Dot).
class DsNotificationDot extends StatelessWidget {
  const DsNotificationDot({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: DsSizes.notificationDot,
        height: DsSizes.notificationDot,
        decoration: const BoxDecoration(
          color: DsColors.statusDangerBgBold,
          shape: BoxShape.circle,
        ),
      );
}

/// Initials avatar (`Avatar`, Content=Initials), tinted sky.
class DsAvatar extends StatelessWidget {
  const DsAvatar({super.key, required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) => Container(
        width: DsSizes.avatarSm,
        height: DsSizes.avatarSm,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: DsColors.statusInfoBgSubtle,
          shape: BoxShape.circle,
        ),
        child: Text(
          initials,
          style: DsTypography.overline.copyWith(color: DsColors.statusInfoText),
        ),
      );
}
