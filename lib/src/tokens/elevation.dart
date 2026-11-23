import 'package:flutter/widgets.dart';

/// Elevation tokens (`elevation/*`).
abstract final class DsElevation {
  /// `DS/Elevation/Modal` — 0 20 25 -5, 10% black.
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
  ];

  /// `DS/Elevation/Raised` — 0 2 4 -1, 10% black. Cards.
  static const List<BoxShadow> raised = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -1,
    ),
  ];
}
