import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets.dart';

/// Spot illustration art variants (`AuthIllustration`).
enum DsAuthArt {
  /// Sign-in hero.
  graduationCap,
}

/// Spot illustration for authentication moments, Skylight brand-arc
/// language: sky arc + navy disc + white glyph + sky dots. 280×220.
class DsAuthIllustration extends StatelessWidget {
  const DsAuthIllustration({
    super.key,
    this.art = DsAuthArt.graduationCap,
    this.width = 280,
    this.height = 220,
  });

  final DsAuthArt art;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      switch (art) {
        DsAuthArt.graduationCap => DsAssets.artGraduationCap,
      },
      package: DsAssets.package,
      width: width,
      height: height,
    );
  }
}
