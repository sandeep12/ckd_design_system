import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Tone of the [DsEmptyState] glyph disc.
enum DsEmptyStateTone { info, danger }

/// Dashed-outline empty / failure panel: glyph disc, H3 title, body copy
/// and an optional action.
class DsEmptyState extends StatelessWidget {
  const DsEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.action,
    this.tone = DsEmptyStateTone.info,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;
  final DsEmptyStateTone tone;

  static const double _disc = 64;

  @override
  Widget build(BuildContext context) {
    final isDanger = tone == DsEmptyStateTone.danger;
    return CustomPaint(
      painter: _DashedBorderPainter(),
      child: Padding(
        padding: const EdgeInsets.all(DsSpacing.insetXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _disc,
              height: _disc,
              decoration: BoxDecoration(
                color: isDanger
                    ? DsColors.statusDangerBgSubtle
                    : DsColors.statusInfoBgSubtle,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: DsSizes.iconMd,
                color: isDanger
                    ? DsColors.statusDangerIcon
                    : DsColors.statusInfoIcon,
              ),
            ),
            const SizedBox(height: DsSpacing.stackLg),
            Text(title, style: DsTypography.h3, textAlign: TextAlign.center),
            const SizedBox(height: DsSpacing.stackMd),
            Text(
              message,
              style:
                  DsTypography.bodySm.copyWith(color: DsColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[
              const SizedBox(height: DsSpacing.stackLg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  static const double _dash = 6;
  static const double _gap = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = DsColors.borderDefault
      ..style = PaintingStyle.stroke
      ..strokeWidth = DsSizes.borderWidthDefault;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Offset.zero & size,
        const Radius.circular(DsRadii.surface),
      ));
    for (final metric in path.computeMetrics()) {
      var d = 0.0;
      while (d < metric.length) {
        canvas.drawPath(metric.extractPath(d, d + _dash), paint);
        d += _dash + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
