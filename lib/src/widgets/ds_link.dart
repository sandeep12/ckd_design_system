import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/sizes.dart';
import '../tokens/typography.dart';

/// Standalone text link (`Link` / `Mobile/Link`).
///
/// On mobile ([touchRow] true) the link sits in a 48-high touch row so the
/// hit area meets the 44pt/48dp minimum.
class DsLink extends StatelessWidget {
  const DsLink({
    super.key,
    required this.label,
    this.onTap,
    this.touchRow = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool touchRow;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: DsTypography.body.copyWith(color: DsColors.textLink),
    );

    return InkWell(
      onTap: onTap,
      child: touchRow
          ? SizedBox(
              height: DsSizes.controlLg,
              child: Align(alignment: Alignment.centerLeft, child: text),
            )
          : text,
    );
  }
}
