import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/elevation.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';

/// Card surface (`card/*`): white, 1px card border, 12 radius, raised.
class DsCard extends StatelessWidget {
  const DsCard({
    super.key,
    required this.child,
    this.color = DsColors.cardBg,
    this.padding = const EdgeInsets.all(DsSpacing.cardInset),
  });

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(DsRadii.surface),
        border: Border.all(
          color: DsColors.cardBorder,
          width: DsSizes.borderWidthDefault,
        ),
        boxShadow: DsElevation.raised,
      ),
      child: child,
    );
  }
}

/// Horizontal subtle divider (`Divider`, Emphasis=Subtle).
class DsDivider extends StatelessWidget {
  const DsDivider({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: DsSizes.borderWidthDefault,
        width: double.infinity,
        child: ColoredBox(color: DsColors.borderSubtle),
      );
}

/// 40×40 tinted chip holding a glyph (stat tiles, notification rows).
class DsIconChip extends StatelessWidget {
  const DsIconChip({
    super.key,
    required this.child,
    this.color = DsColors.statusInfoBgSubtle,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: DsSizes.iconChip,
        height: DsSizes.iconChip,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(DsRadii.control),
        ),
        child: child,
      );
}
