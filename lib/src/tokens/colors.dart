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

  // Surfaces — app shell & page
  /// `color/surface/page` — content panel / page ground.
  static const Color surfacePage = Color(0xFFFAFAFA);

  /// `color/surface/sunken` — status strips, wells.
  static const Color surfaceSunken = Color(0xFFF5F5F5);

  /// `color/surface/brand-subtle` — hero cards.
  static const Color surfaceBrandSubtle = Color(0xFFE6EAF6);

  /// `color/surface/shell-hover` — user card on the shell.
  static const Color surfaceShellHover = Color(0xFF3355B3);

  /// `color/text/placeholder`
  static const Color textPlaceholder = Color(0xFF575757);

  /// `color/icon/subtle`
  static const Color iconSubtle = Color(0xFF767676);

  /// `color/border/subtle` — dividers, light chrome rules.
  static const Color borderSubtle = Color(0xFFF5F5F5);

  /// `color/border/default` — dashed empty-state outlines.
  static const Color borderDefault = Color(0xFFD6D6D6);

  // Cards
  /// `card/bg`
  static const Color cardBg = Color(0xFFFFFFFF);

  /// `card/border`
  static const Color cardBorder = Color(0xFFE9E9E9);

  // Secondary action
  /// `color/action/secondary/bg`
  static const Color actionSecondaryBg = Color(0xFFFFFFFF);

  /// `color/action/secondary/bg-hover`
  static const Color actionSecondaryBgHover = Color(0xFFF5F5F5);

  /// `color/action/secondary/border`
  static const Color actionSecondaryBorder = Color(0xFFE9E9E9);

  /// `color/action/secondary/text`
  static const Color actionSecondaryText = Color(0xFF434343);

  // Status — info (sky)
  /// `color/status/info/bg-subtle`
  static const Color statusInfoBgSubtle = Color(0xFFE6F8FD);

  /// `color/status/info/text`
  static const Color statusInfoText = Color(0xFF006681);

  /// `color/status/info/icon`
  static const Color statusInfoIcon = Color(0xFF00A8D6);

  // Status — success
  /// `color/status/success/text`
  static const Color statusSuccessText = Color(0xFF476800);

  // Status — danger (bold)
  /// `color/status/danger/bg-bold` — notification dot.
  static const Color statusDangerBgBold = Color(0xFFBB0025);

  // Navigation
  /// `nav/bg` — sidebar + top bar on the cobalt shell.
  static const Color navBg = Color(0xFF002BA0);

  /// `nav/item-bg-selected` — active tongue (fuses into the page panel).
  static const Color navItemBgSelected = Color(0xFFFAFAFA);

  /// `nav/item-bg-hover`
  static const Color navItemBgHover = Color(0xFF3355B3);

  /// `nav/item-text`
  static const Color navItemText = Color(0xFFE6EAF6);

  /// `nav/item-text-active`
  static const Color navItemTextActive = Color(0xFF001F72);

  /// `nav/tabbar-bg`
  static const Color tabbarBg = Color(0xFFFFFFFF);

  /// `nav/tabbar-item-text`
  static const Color tabbarItemText = Color(0xFF767676);

  /// `nav/tabbar-item-text-active`
  static const Color tabbarItemTextActive = Color(0xFF001F72);

  /// `color/selected/bg` — tab bar selected pill.
  static const Color selectedBg = Color(0xFFE6EAF6);

  /// `color/selected/border` — selected filter tag outline.
  static const Color selectedBorder = Color(0xFF002BA0);

  /// `color/selected/text` — selected filter tag label.
  static const Color selectedText = Color(0xFF001F72);

  /// `color/status/success/bg-subtle` — success badge fill.
  static const Color statusSuccessBgSubtle = Color(0xFFD8EBB0);
}
