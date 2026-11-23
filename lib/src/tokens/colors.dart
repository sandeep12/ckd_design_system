import 'dart:ui';

/// Semantic color tokens.
///
/// Values mirror the Figma variable collection (`color/*`, `input/*`).
abstract final class DsColors {
  // Surfaces
  /// `color/surface/shell` — cobalt app shell behind auth screens.
  static const Color surfaceShell = Color(0xFF002BA0);

  /// `color/surface/raised` — cards, chips, inputs on shell.
  static const Color surfaceRaised = Color(0xFFFFFFFF);

  /// `color/surface/overlay` — overlay cards (mobile auth card).
  static const Color surfaceOverlay = Color(0xFFFFFFFF);

  // Text
  /// `color/text/primary`
  static const Color textPrimary = Color(0xFF1B1B1B);

  /// `color/text/secondary`
  static const Color textSecondary = Color(0xFF575757);

  /// `color/text/tertiary`
  static const Color textTertiary = Color(0xFF767676);

  /// `color/text/tertiary-on-page` — helper text under form fields.
  static const Color textTertiaryOnPage = Color(0xFF575757);

  /// `color/text/link`
  static const Color textLink = Color(0xFF002792);

  /// `color/text/on-shell`
  static const Color textOnShell = Color(0xFFFFFFFF);

  /// `color/text/on-shell-secondary`
  static const Color textOnShellSecondary = Color(0xFFE6EAF6);

  // Icons
  /// `color/icon/default`
  static const Color iconDefault = Color(0xFF575757);

  // Borders
  /// `color/border/strong` — checkbox box, strong outlines.
  static const Color borderStrong = Color(0xFFD6D6D6);

  // Primary action
  /// `color/action/primary/bg`
  static const Color actionPrimaryBg = Color(0xFF002BA0);

  /// `color/action/primary/bg-hover`
  static const Color actionPrimaryBgHover = Color(0xFF002792);

  /// `color/action/primary/bg-disabled`
  static const Color actionPrimaryBgDisabled = Color(0xFFE9E9E9);

  /// `color/action/primary/text`
  static const Color actionPrimaryText = Color(0xFFFFFFFF);

  /// `color/action/primary/text-disabled`
  static const Color actionPrimaryTextDisabled = Color(0xFFA5A5A5);

  // Inputs
  /// `input/bg`
  static const Color inputBg = Color(0xFFFAFAFA);

  /// `input/border`
  static const Color inputBorder = Color(0xFFE9E9E9);

  /// `input/text`
  static const Color inputText = Color(0xFF1B1B1B);

  /// `input/placeholder`
  static const Color inputPlaceholder = Color(0xFF575757);

  // Status — danger (crimson)
  /// `color/status/danger/text`
  static const Color statusDangerText = Color(0xFF92001D);

  /// `color/status/danger/icon`
  static const Color statusDangerIcon = Color(0xFFBB0025);

  /// `color/status/danger/border`
  static const Color statusDangerBorder = Color(0xFFCD0029);

  /// `color/status/danger/bg-subtle`
  static const Color statusDangerBgSubtle = Color(0xFFFAE6EA);

  // Status — info (sky accent)
  /// `color/status/info/bg-bold` — Skylight sky accent (tagline dot).
  static const Color statusInfoBgBold = Color(0xFF00B9EB);
}
