import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Tones supported by [DsBadge] (Emphasis=Subtle).
enum DsBadgeTone { info, success }

/// Subtle badge with a leading dot (`Badge`, Emphasis=Subtle).
class DsBadge extends StatelessWidget {
  const DsBadge({super.key, required this.label, this.tone = DsBadgeTone.info});

  final String label;
  final DsBadgeTone tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DsSizes.badgeHeight,
      padding: const EdgeInsets.symmetric(horizontal: DsSpacing.badgePadX),
      decoration: BoxDecoration(
        color: tone == DsBadgeTone.success
            ? DsColors.statusSuccessBgSubtle
            : DsColors.statusInfoBgSubtle,
        borderRadius: BorderRadius.circular(DsRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: tone == DsBadgeTone.success
                  ? DsColors.statusSuccessText
                  : DsColors.statusInfoBgBold,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: DsSpacing.inlineXs),
          Text(
            label,
            style: DsTypography.overline.copyWith(
              color: tone == DsBadgeTone.success
                  ? DsColors.statusSuccessText
                  : DsColors.statusInfoText,
            ),
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
///
/// [large] is the 72px profile identity avatar.
class DsAvatar extends StatelessWidget {
  const DsAvatar({super.key, required this.initials, this.large = false});

  final String initials;
  final bool large;

  @override
  Widget build(BuildContext context) => Container(
        width: large ? DsSizes.avatarLg : DsSizes.avatarSm,
        height: large ? DsSizes.avatarLg : DsSizes.avatarSm,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: DsColors.statusInfoBgSubtle,
          shape: BoxShape.circle,
        ),
        child: Text(
          initials,
          style: (large ? DsTypography.avatarInitialsLg : DsTypography.overline)
              .copyWith(color: DsColors.statusInfoText),
        ),
      );
}
