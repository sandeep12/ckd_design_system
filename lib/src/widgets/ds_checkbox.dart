import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Checkbox size variants.
enum DsCheckboxSize {
  /// Web `Checkbox` — 20 box, 8 gap.
  md,

  /// `Mobile/Checkbox` — 24 box, 12 gap, whole row is the touch target
  /// (min height 48).
  lg,
}

/// Checkbox with trailing label (`Checkbox` / `Mobile/Checkbox`).
class DsCheckbox extends StatelessWidget {
  const DsCheckbox({
    super.key,
    required this.value,
    required this.label,
    this.onChanged,
    this.size = DsCheckboxSize.md,
  });

  final bool value;
  final String label;
  final ValueChanged<bool>? onChanged;
  final DsCheckboxSize size;

  @override
  Widget build(BuildContext context) {
    final box = size == DsCheckboxSize.lg ? DsSizes.iconLg : DsSizes.iconMd;
    final gap =
        size == DsCheckboxSize.lg ? DsSpacing.inlineMd : DsSpacing.inlineSm;
    final minHeight = size == DsCheckboxSize.lg ? DsSizes.controlLg : box;

    return InkWell(
      onTap: onChanged == null ? null : () => onChanged!(!value),
      borderRadius: BorderRadius.circular(DsRadii.control),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: box,
              height: box,
              decoration: BoxDecoration(
                color: value
                    ? DsColors.actionPrimaryBg
                    : DsColors.surfaceRaised,
                borderRadius: BorderRadius.circular(DsRadii.controlSm),
                border: Border.all(
                  color: value
                      ? DsColors.actionPrimaryBg
                      : DsColors.borderStrong,
                  width: DsSizes.borderWidthDefault,
                ),
              ),
              child: value
                  ? Icon(
                      Icons.check,
                      size: box - 6,
                      color: DsColors.actionPrimaryText,
                    )
                  : null,
            ),
            SizedBox(width: gap),
            Expanded(
              child: Text(label, style: DsTypography.body),
            ),
          ],
        ),
      ),
    );
  }
}
