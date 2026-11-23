/// Spacing tokens (`space/*`), in logical pixels.
abstract final class DsSpacing {
  // Inline (horizontal gaps)
  static const double inlineXs = 4;
  static const double inlineSm = 8;
  static const double inlineMd = 12;
  static const double inlineLg = 16;

  // Stack (vertical gaps)
  static const double stackXs = 4;
  static const double stackSm = 8;
  static const double stackMd = 12;
  static const double stackLg = 20;
  static const double stackXl = 24;

  // Inset (padding)
  static const double insetXs = 4;
  static const double insetSm = 8;
  static const double insetMd = 12;
  static const double insetLg = 20;
  static const double insetXl = 24;

  // Layout
  /// `space/layout/page-margin`
  static const double layoutPageMargin = 32;

  /// `space/layout/section-gap`
  static const double layoutSectionGap = 24;

  /// `space/layout/gutter`
  static const double layoutGutter = 24;

  /// `card/inset`
  static const double cardInset = 20;

  /// `card/gap`
  static const double cardGap = 12;

  /// `nav/inset` — sidebar horizontal padding.
  static const double navInset = 24;

  /// `nav/item-gap`
  static const double navItemGap = 4;

  /// `badge/pad-x`
  static const double badgePadX = 8;

  /// `button/pad-x-md`
  static const double buttonPadXMd = 20;
}
