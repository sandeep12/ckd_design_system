import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Filter chip (`Tag`): 32 high pill; selected uses the `color/selected/*`
/// tokens, resting is a raised surface with the default border.
class DsTag extends StatelessWidget {
  const DsTag({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  static const double height = 32;

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: MouseRegion(
        cursor: onTap == null ? MouseCursor.defer : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: DsSpacing.insetMd),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? DsColors.selectedBg : DsColors.surfaceRaised,
              borderRadius: BorderRadius.circular(DsRadii.pill),
              border: Border.all(
                color:
                    selected ? DsColors.selectedBorder : DsColors.cardBorder,
                width: DsSizes.borderWidthDefault,
              ),
            ),
            child: Text(
              label,
              style: DsTypography.bodySm.copyWith(
                color:
                    selected ? DsColors.selectedText : DsColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
