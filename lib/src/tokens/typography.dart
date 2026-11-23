import 'package:flutter/widgets.dart';

import 'colors.dart';

/// Geist, bundled with this package.
///
/// The `packages/` prefix lets consuming apps use the family directly.
const String kDsFontFamily = 'packages/ckd_design_system/Geist';

/// Type ramp tokens (`typography/*`), family Geist.
abstract final class DsTypography {
  /// `DS/H2` — 30/36, ExtraBold 800.
  static const TextStyle h2 = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 30,
    height: 36 / 30,
    fontWeight: FontWeight.w800,
    color: DsColors.textPrimary,
  );

  /// `DS/H3` — 24/32, Bold 700.
  static const TextStyle h3 = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w700,
    color: DsColors.textPrimary,
  );

  /// `DS/Body` — 16/24, Regular 400.
  static const TextStyle body = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    color: DsColors.textPrimary,
  );

  /// `DS/Body-sm` — 14/20, Regular 400.
  static const TextStyle bodySm = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: DsColors.textPrimary,
  );

  /// `DS/Label` — 14/20, Bold 700.
  static const TextStyle label = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w700,
    color: DsColors.textPrimary,
  );

  /// `DS/Label-lg` — 16/24, Bold 700 (mobile Lg button).
  static const TextStyle labelLg = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w700,
    color: DsColors.textPrimary,
  );

  /// `DS/Caption` — 12/16, Regular 400.
  static const TextStyle caption = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: DsColors.textPrimary,
  );

  /// `DS/Display` — 48/56, ExtraBold 800, -0.4 tracking (stat values).
  static const TextStyle display = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 48,
    height: 56 / 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.4,
    color: DsColors.textPrimary,
  );

  /// `DS/H1` — 36/44, ExtraBold 800. One per screen.
  static const TextStyle h1 = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w800,
    color: DsColors.textPrimary,
  );

  /// `DS/H4` — 20/28, Bold 700.
  static const TextStyle h4 = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w700,
    color: DsColors.textPrimary,
  );

  /// `DS/Overline` — 12/16, Bold 700, 0.4 tracking. Uppercase eyebrows.
  static const TextStyle overline = TextStyle(
    fontFamily: kDsFontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
    color: DsColors.textPrimary,
  );
}
