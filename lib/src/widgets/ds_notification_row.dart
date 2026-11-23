import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import 'ds_card.dart';
import 'ds_icon.dart';

/// One row in the dashboard Notifications hub (`NotificationRow`).
class DsNotificationRow extends StatelessWidget {
  const DsNotificationRow({
    super.key,
    required this.iconAsset,
    required this.title,
    this.subtitle,
    this.timeAgo,
    this.muted = false,
    this.onTap,
  });

  final String iconAsset;
  final String title;
  final String? subtitle;

  /// Short relative time, e.g. `2m`.
  final String? timeAgo;

  /// Neutral (sunken) chip instead of the sky info chip.
  final bool muted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(DsRadii.control);
    return Material(
      color: DsColors.surfacePage,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.all(DsSpacing.insetMd),
          child: Row(
            children: [
              DsIconChip(
                color: muted
                    ? DsColors.surfaceSunken
                    : DsColors.statusInfoBgSubtle,
                child: DsIcon(
                  iconAsset,
                  color: muted ? DsColors.iconSubtle : DsColors.statusInfoIcon,
                ),
              ),
              const SizedBox(width: DsSpacing.inlineMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: DsTypography.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: DsSpacing.stackXs),
                      Text(
                        subtitle!,
                        style: DsTypography.caption
                            .copyWith(color: DsColors.textTertiary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              if (timeAgo != null) ...[
                const SizedBox(width: DsSpacing.inlineMd),
                Text(
                  timeAgo!,
                  style: DsTypography.caption
                      .copyWith(color: DsColors.textPlaceholder),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
