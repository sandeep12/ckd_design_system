import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/typography.dart';

/// Control height variants for [DsTextField].
enum DsFieldSize {
  /// Web `Input` — 40 high.
  md,

  /// `Mobile/Input` — 48 high (44pt/48dp touch minimum).
  lg,
}

/// `FormField` pattern: FieldLabel + Input + HelperText.
///
/// Renders the error state (`aria-invalid`) with the crimson danger tokens
/// when [errorText] is non-null.
class DsTextField extends StatelessWidget {
  const DsTextField({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.helperText,
    this.errorText,
    this.leadingIconAsset,
    this.trailingIconAsset,
    this.onTrailingIconTap,
    this.obscureText = false,
    this.enabled = true,
    this.size = DsFieldSize.md,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
  });

  /// Field label. Null renders a bare input (e.g. the dashboard exam-code
  /// field); a bare input only adds a message line when there is one.
  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final String? helperText;
  final String? errorText;

  /// SVG asset path within this package (see [DsAssets]).
  final String? leadingIconAsset;
  final String? trailingIconAsset;
  final VoidCallback? onTrailingIconTap;

  final bool obscureText;
  final bool enabled;
  final DsFieldSize size;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  bool get _hasError => errorText != null;

  @override
  Widget build(BuildContext context) {
    final height =
        size == DsFieldSize.lg ? DsSizes.controlLg : DsSizes.inputHeight;
    final borderColor =
        _hasError ? DsColors.statusDangerBorder : DsColors.inputBorder;

    final message = errorText ?? helperText;
    final messageColor =
        _hasError ? DsColors.statusDangerText : DsColors.textTertiaryOnPage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FieldLabel
        if (label != null) ...[
          Text(label!, style: DsTypography.label),
          const SizedBox(height: DsSizes.inputGapLabel),
        ],
        // Input
        Container(
          height: height,
          decoration: BoxDecoration(
            color: DsColors.inputBg,
            borderRadius: BorderRadius.circular(DsRadii.input),
            border: Border.all(
              color: borderColor,
              width: DsSizes.borderWidthDefault,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: DsSizes.inputPadX),
          child: Row(
            children: [
              if (leadingIconAsset != null) ...[
                _FieldIcon(asset: leadingIconAsset!),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  enabled: enabled,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  autofillHints: autofillHints,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  style: DsTypography.body.copyWith(
                    color: DsColors.inputText,
                  ),
                  cursorColor: DsColors.inputText,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: DsTypography.body.copyWith(
                      color: DsColors.inputPlaceholder,
                    ),
                  ),
                ),
              ),
              if (trailingIconAsset != null) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onTrailingIconTap,
                  behavior: HitTestBehavior.opaque,
                  child: MouseRegion(
                    cursor: onTrailingIconTap != null
                        ? SystemMouseCursors.click
                        : MouseCursor.defer,
                    child: _FieldIcon(asset: trailingIconAsset!),
                  ),
                ),
              ],
            ],
          ),
        ),
        // HelperText — labelled fields reserve the line so layout matches
        // Figma; bare inputs only show it when there is a message.
        if (label != null || message != null) ...[
          const SizedBox(height: DsSizes.inputGapLabel),
          SizedBox(
            height: 16,
            child: message == null
                ? null
                : Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsTypography.caption.copyWith(color: messageColor),
                  ),
          ),
        ],
      ],
    );
  }
}

class _FieldIcon extends StatelessWidget {
  const _FieldIcon({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      package: DsAssets.package,
      width: DsSizes.iconMd,
      height: DsSizes.iconMd,
    );
  }
}
