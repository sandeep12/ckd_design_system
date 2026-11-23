import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/typography.dart';

/// Material [ThemeData] configured from the design tokens.
abstract final class CkdTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      fontFamily: kDsFontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: DsColors.actionPrimaryBg,
        primary: DsColors.actionPrimaryBg,
        onPrimary: DsColors.actionPrimaryText,
        surface: DsColors.surfaceRaised,
        error: DsColors.statusDangerIcon,
      ),
      scaffoldBackgroundColor: DsColors.surfaceShell,
    );

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headlineMedium: DsTypography.h2,
        headlineSmall: DsTypography.h3,
        bodyLarge: DsTypography.body,
        bodyMedium: DsTypography.bodySm,
        bodySmall: DsTypography.caption,
        labelLarge: DsTypography.labelLg,
        labelMedium: DsTypography.label,
      ),
      splashFactory: InkRipple.splashFactory,
    );
  }
}
