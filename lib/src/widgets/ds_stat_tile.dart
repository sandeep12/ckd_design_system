import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import 'ds_card.dart';
import 'ds_icon.dart';

/// Metric tile (`StatTile`): overline label, sky icon chip, Display value.
class DsStatTile extends StatelessWidget {
  const DsStatTile({
    super.key,
    required this.label,
    required this.value,
    required this.iconAsset,
  });

  final String label;
  final String value;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return DsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: DsTypography.overline
                      .copyWith(color: DsColors.textTertiary),
                ),
              ),
              DsIconChip(
                child: DsIcon(iconAsset, color: DsColors.statusInfoIcon),
              ),
            ],
          ),
          const SizedBox(height: DsSpacing.cardGap),
          Text(value, style: DsTypography.display),
        ],
      ),
    );
  }
}
