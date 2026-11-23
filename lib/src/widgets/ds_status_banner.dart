import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Inline danger banner, as drawn on the auth error states
/// (e.g. "invalid credentials").
class DsDangerBanner extends StatelessWidget {
  const DsDangerBanner({super.key, required this.message, this.title});

  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DsColors.statusDangerBgSubtle,
        borderRadius: BorderRadius.circular(DsRadii.surface),
        border: Border.all(
          color: DsColors.statusDangerBorder,
          width: DsSizes.borderWidthDefault,
        ),
      ),
      padding: const EdgeInsets.all(DsSpacing.insetMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline,
            size: DsSizes.iconMd,
            color: DsColors.statusDangerIcon,
          ),
          const SizedBox(width: DsSpacing.inlineSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: DsTypography.label.copyWith(
                      color: DsColors.statusDangerText,
                    ),
                  ),
                Text(
                  message,
                  style: DsTypography.bodySm.copyWith(
                    color: DsColors.statusDangerText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
