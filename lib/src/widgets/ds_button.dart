import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/typography.dart';

/// Button size variants.
enum DsButtonSize {
  /// 48 high, full width — the primary-action contract.
  lg,
}

/// Primary action button (`Button`, Tone=Primary).
///
/// Supports disabled and loading states as drawn in Figma.
class DsButton extends StatelessWidget {
  const DsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.size = DsButtonSize.lg,
    this.expand = true,
  });

  final String label;

  /// Null renders the disabled state.
  final VoidCallback? onPressed;

  final bool loading;
  final DsButtonSize size;

  /// Whether the button stretches to the container width.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;

    final child = SizedBox(
      height: DsSizes.buttonHeightLg,
      width: expand ? double.infinity : null,
      child: Material(
        color: enabled || loading
            ? DsColors.actionPrimaryBg
            : DsColors.actionPrimaryBgDisabled,
        borderRadius: BorderRadius.circular(DsRadii.button),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(DsRadii.button),
          hoverColor: DsColors.actionPrimaryBgHover,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: DsSizes.buttonPadXLg),
            child: Row(
              mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (loading) ...[
                  SizedBox(
                    width: DsSizes.iconMd,
                    height: DsSizes.iconMd,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: const AlwaysStoppedAnimation(
                        DsColors.actionPrimaryText,
                      ),
                    ),
                  ),
                  const SizedBox(width: DsSizes.buttonGap),
                ],
                Text(
                  label,
                  style: DsTypography.labelLg.copyWith(
                    color: enabled || loading
                        ? DsColors.actionPrimaryText
                        : DsColors.actionPrimaryTextDisabled,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return child;
  }
}
