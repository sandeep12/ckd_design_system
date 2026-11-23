import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';

/// White chip with the OEd logo, used on the cobalt shell (`logo-chip`).
class DsLogoChip extends StatelessWidget {
  const DsLogoChip({super.key, this.logoWidth = 130});

  final double logoWidth;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DsColors.surfaceRaised,
        borderRadius: BorderRadius.circular(DsRadii.control),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DsSpacing.insetMd,
          vertical: DsSpacing.insetSm,
        ),
        child: Image.asset(
          DsAssets.logoOed,
          package: DsAssets.package,
          width: logoWidth,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
