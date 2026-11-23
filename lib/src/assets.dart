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
}
