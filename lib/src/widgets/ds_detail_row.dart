import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../tokens/colors.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import 'ds_card.dart';
import 'ds_icon.dart';

/// One read-only field in a profile list (`DetailRow`): sunken icon chip,
/// caption label over a body value, optional trailing affordance.
///
/// Kind=Link → pass [onTap] (adds a chevron). Kind=Action → pass [trailing]
/// (e.g. a `DsLink`).
class DsDetailRow extends StatelessWidget {
  const DsDetailRow({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.value,
    this.trailing,
    this.onTap,
    this.showDivider = true,
  });

  final String iconAsset;
  final String label;
  final String value;
  final Widget? trailing;
  final VoidCallback? onTap;

  /// Bottom 1px subtle rule; off for the last row in a card.
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final row = Container(
      padding: const EdgeInsets.all(DsSpacing.insetMd),
      decoration: BoxDecoration(
        color: DsColors.surfaceRaised,
        border: showDivider
            ? const Border(
                bottom: BorderSide(
                  color: DsColors.borderSubtle,
                  width: DsSizes.borderWidthDefault,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          DsIconChip(
            color: DsColors.surfaceSunken,
            child: DsIcon(iconAsset, color: DsColors.iconDefault),
          ),
          const SizedBox(width: DsSpacing.inlineMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: DsTypography.caption
                      .copyWith(color: DsColors.textTertiary),
                ),
                const SizedBox(height: DsSpacing.stackXs),
                Text(value, style: DsTypography.body),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: DsSpacing.inlineMd),
            trailing!,
          ] else if (onTap != null) ...[
            const SizedBox(width: DsSpacing.inlineMd),
            const DsIcon(DsAssets.icChevronRight, color: DsColors.iconDefault),
          ],
        ],
      ),
    );
    if (onTap == null) return row;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: row,
      ),
    );
  }
}
