# ckd_design_system

Design tokens, theme and UI components for the ACA CKD product suite
(Skylight design direction). Source of truth: Figma file **ACA-CKD-V2**.

## Contents

| Area | Files |
| --- | --- |
| Color tokens | `lib/src/tokens/colors.dart` |
| Typography (Geist, bundled) | `lib/src/tokens/typography.dart` |
| Spacing / radii / sizes / elevation | `lib/src/tokens/*.dart` |
| Material theme | `lib/src/theme/ckd_theme.dart` |
| Components | `lib/src/widgets/` — button, text field, checkbox, link, logo chip, auth illustration, danger banner |
| Assets | `assets/` — OEd logo, lucide icons, auth illustration, Geist fonts |

## Usage

```yaml
dependencies:
  ckd_design_system:
    git:
      url: <this repo>
    # or during local development:
    # path: ../ckd_design_system
```

```dart
import 'package:ckd_design_system/ckd_design_system.dart';

MaterialApp(theme: CkdTheme.light(), ...);

DsButton(label: 'Log in', onPressed: ...);
DsTextField(label: 'Email ID', leadingIconAsset: DsAssets.icMail, ...);
```

Token values must not be hardcoded in apps — always consume them through
`DsColors`, `DsTypography`, `DsSpacing`, `DsRadii`, `DsSizes`, `DsElevation`.

## Component sizing conventions

- Web controls: 40-high inputs (`DsFieldSize.md`), 20 checkbox box.
- Mobile controls: 48-high inputs (`DsFieldSize.lg`), 24 checkbox box, whole
  row touch targets ≥ 48 — the 44pt/48dp minimum.
