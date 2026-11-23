/// Asset catalog for the design system package.
///
/// Use together with `package: DsAssets.package` in `Image.asset` /
/// `SvgPicture.asset`.
abstract final class DsAssets {
  static const String package = 'ckd_design_system';

  // Images
  static const String logoOed = 'assets/images/logo_oed.png';
  static const String artGraduationCap = 'assets/images/art_graduation_cap.svg';
  static const String artMailSent = 'assets/images/art_mail_sent.svg';

  // Icons (lucide, 20-grid exports)
  static const String icMail = 'assets/icons/ic_mail.svg';
  static const String icEye = 'assets/icons/ic_eye.svg';
  static const String icDot = 'assets/icons/dot.svg';

  // Icons — app shell & dashboard (lucide). Single-colour glyphs; tint
  // them with `DsIcon(color: …)` rather than relying on the baked colour.
  static const String icBell = 'assets/icons/ic_bell.svg';
  static const String icLayoutGrid = 'assets/icons/ic_layout_grid.svg';
  static const String icClipboardList = 'assets/icons/ic_clipboard_list.svg';
  static const String icUser = 'assets/icons/ic_user.svg';
  static const String icAward = 'assets/icons/ic_award.svg';
  static const String icChevronRight = 'assets/icons/ic_chevron_right.svg';
  static const String icCheckCircle = 'assets/icons/ic_check_circle.svg';
  static const String icCalendar = 'assets/icons/ic_calendar.svg';
  static const String icUploadCloud = 'assets/icons/ic_upload_cloud.svg';
  static const String icClock = 'assets/icons/ic_clock.svg';
  static const String icFileText = 'assets/icons/ic_file_text.svg';
  static const String icGraduationCap = 'assets/icons/ic_graduation_cap.svg';
  static const String icCalendarSm = 'assets/icons/ic_calendar_sm.svg';
  static const String icFileTextSm = 'assets/icons/ic_file_text_sm.svg';
  static const String icGraduationCapSm =
      'assets/icons/ic_graduation_cap_sm.svg';

  /// 32×32 cobalt disc that carves the active NavItem's concave fillets.
  static const String navFilletCarve = 'assets/icons/nav_fillet_carve.svg';
}
