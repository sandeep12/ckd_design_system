import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import 'ds_card.dart';
import 'ds_icon.dart';

/// One meta item in an exam card (`meta`: 16px glyph + caption).
class DsExamMeta {
  const DsExamMeta({required this.iconAsset, required this.label});

  final String iconAsset;
  final String label;
}

/// Score block shown on result cards.
class DsExamScore {
  const DsExamScore({required this.value, required this.caption, this.passed});

  /// e.g. `92%`.
  final String value;

  /// e.g. `Passed`.
  final String caption;

  /// Tints the caption: true → success, false → danger, null → secondary.
  final bool? passed;
}

/// Worded status strip with a glyph — never colour alone.
class DsExamStatus {
  const DsExamStatus({
    required this.iconAsset,
    required this.message,
    this.trailing,
  });

  final String iconAsset;
  final String message;

  /// Optional bold value on the right (e.g. `A (94/100)`).
  final String? trailing;
}

/// One exam in a student list (`ExamCard`): code eyebrow, title, optional
/// score, meta row and either a single [action] or a worded [status] strip.
class DsExamCard extends StatelessWidget {
  const DsExamCard({
    super.key,
    required this.code,
    required this.title,
    this.meta = const [],
    this.score,
    this.action,
    this.status,
    this.onTap,
  });

  final String code;
  final String title;
  final List<DsExamMeta> meta;
  final DsExamScore? score;
  final Widget? action;
  final DsExamStatus? status;
  final VoidCallback? onTap;

  static const double _statusStripHeight = 100;

  @override
  Widget build(BuildContext context) {
    final card = DsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CODE: $code',
                      style: DsTypography.overline
                          .copyWith(color: DsColors.textTertiary),
                    ),
                    const SizedBox(height: DsSpacing.stackXs),
                    Text(title, style: DsTypography.h4),
                  ],
                ),
              ),
              if (score != null) ...[
                const SizedBox(width: DsSpacing.inlineMd),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(score!.value, style: DsTypography.h3),
                    Text(
                      score!.caption,
                      style: DsTypography.caption.copyWith(
                        color: switch (score!.passed) {
                          true => DsColors.statusSuccessText,
                          false => DsColors.statusDangerText,
                          null => DsColors.textSecondary,
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          const SizedBox(height: DsSpacing.stackMd),
          const DsDivider(),
          if (meta.isNotEmpty) ...[
            const SizedBox(height: DsSpacing.stackMd),
            Wrap(
              spacing: DsSpacing.inlineMd,
              runSpacing: DsSpacing.stackXs,
              children: [
                for (final m in meta)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DsIcon(m.iconAsset, size: DsSizes.iconSm),
                      const SizedBox(width: DsSpacing.inlineXs),
                      Text(
                        m.label,
                        style: DsTypography.caption
                            .copyWith(color: DsColors.textSecondary),
                      ),
                    ],
                  ),
              ],
            ),
          ],
          if (action != null) ...[
            const SizedBox(height: DsSpacing.stackMd),
            action!,
          ] else if (status != null) ...[
            const SizedBox(height: DsSpacing.stackMd),
            Container(
              height: _statusStripHeight,
              padding: const EdgeInsets.all(DsSpacing.insetMd),
              decoration: BoxDecoration(
                color: DsColors.surfaceSunken,
                borderRadius: BorderRadius.circular(DsRadii.control),
              ),
              child: Row(
                children: [
                  DsIcon(status!.iconAsset, color: DsColors.iconSubtle),
                  const SizedBox(width: DsSpacing.inlineSm),
                  Expanded(
                    child: Text(
                      status!.message,
                      style: DsTypography.bodySm
                          .copyWith(color: DsColors.textSecondary),
                    ),
                  ),
                  if (status!.trailing != null)
                    Text(status!.trailing!, style: DsTypography.label),
                ],
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap == null) return card;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: onTap, child: card),
    );
  }
}
