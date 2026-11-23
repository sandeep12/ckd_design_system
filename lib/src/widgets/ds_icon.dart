import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../tokens/colors.dart';
import '../tokens/sizes.dart';

/// A design-system SVG glyph (lucide export) tinted to [color].
class DsIcon extends StatelessWidget {
  const DsIcon(
    this.asset, {
    super.key,
    this.size = DsSizes.iconMd,
    this.color = DsColors.iconDefault,
  });

  /// One of the `DsAssets.ic*` paths.
  final String asset;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      package: DsAssets.package,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
