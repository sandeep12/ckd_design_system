import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Button size variants.
enum DsButtonSize {
  /// 48 high, Label-lg — the mobile primary-action contract.
  lg,

  /// 40 high, Label — web inline / card actions.
  md,
}

/// Button tones.
enum DsButtonTone {
  /// Cobalt fill.
  primary,

  /// White fill with a 1px border.
  secondary,
}

/// Action button (`Button`).
///
/// Supports disabled and loading states as drawn in Figma.
class DsButton extends StatelessWidget {
  const DsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.size = DsButtonSize.lg,
    this.tone = DsButtonTone.primary,
    this.expand = true,
    this.leadingIcon,
  });

  final String label;

  /// Null renders the disabled state.
  final VoidCallback? onPressed;

  final bool loading;
  final DsButtonSize size;
  final DsButtonTone tone;

  /// Whether the button stretches to the container width.
  final bool expand;

  /// Optional leading glyph; tinted by the caller.
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    final isLg = size == DsButtonSize.lg;
    final isPrimary = tone == DsButtonTone.primary;

    final Color bg;
    final Color fg;
    if (!enabled && !loading) {
      bg = DsColors.actionPrimaryBgDisabled;
      fg = DsColors.actionPrimaryTextDisabled;
    } else if (isPrimary) {
      bg = DsColors.actionPrimaryBg;
      fg = DsColors.actionPrimaryText;
    } else {
      bg = DsColors.actionSecondaryBg;
      fg = DsColors.actionSecondaryText;
    }

    final radius = BorderRadius.circular(DsRadii.button);

    return SizedBox(
      height: isLg ? DsSizes.buttonHeightLg : DsSizes.buttonHeightMd,
      width: expand ? double.infinity : null,
      child: Material(
        color: bg,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: isPrimary
              ? BorderSide.none
              : const BorderSide(
                  color: DsColors.actionSecondaryBorder,
                  width: DsSizes.borderWidthDefault,
                ),
        ),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: radius,
          hoverColor: isPrimary
              ? DsColors.actionPrimaryBgHover
              : DsColors.actionSecondaryBgHover,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLg ? DsSizes.buttonPadXLg : DsSpacing.buttonPadXMd,
            ),
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
                      valueColor: AlwaysStoppedAnimation(fg),
                    ),
                  ),
                  const SizedBox(width: DsSizes.buttonGap),
                ] else if (leadingIcon != null) ...[
                  leadingIcon!,
                  const SizedBox(width: DsSizes.buttonGap),
                ],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: (isLg ? DsTypography.labelLg : DsTypography.label)
                        .copyWith(color: fg),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
