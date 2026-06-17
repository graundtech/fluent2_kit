## 2.2.0

Adds a top sheet that drops down below the nav bar.

### Added

- Added `FluentTopSheet`, `FluentTopSheetController`, and `showFluentTopSheet` — a Fluent 2 top sheet anchored below the nav bar, dismissible by swiping the handle up or tapping the scrim.
- Added a Fluent Top Sheet example page with full, half (scrolling list), and nav-header (hero image + action buttons) variations.
- Added widget tests covering open, scrim-tap dismiss, and swipe-up dismiss.

## 2.1.1

Fixes Fluent switch visibility when used in brand navigation bars.

### Fixed

- Added a contextual outline for `FluentSwitchToggle` when it is enabled inside brand `FluentNavBar` actions, keeping the switch visible while preserving the Fluent iOS toggle colors on neutral surfaces.
- Added regression tests covering the Fluent iOS switch color specification and the brand navigation bar contrast adjustment.

## 2.1.0

Adds a composable OTP code field for verification flows.

### Added

- Added `FluentOtpCodeField`, `FluentOtpCodeGroup`, `FluentOtpCodeSlot`, `FluentOtpCodeSeparator`, and `FluentOtpCodeFieldController`.
- Added a Fluent OTP Code Field example page with separator, disabled, invalid, four-digit, form, and controlled usage scenarios.
- Added widget tests for OTP input filtering, paste handling, completion callbacks, disabled state, error state, custom length, and controlled value updates.

## 2.0.0

Breaking cleanup release for typo fixes and public API polish.

### Changed

- Renamed presence badge APIs from `avaliable`/`Avaliable` to `available`/`Available`.
- Renamed shadow elevation APIs from `hight` to `high`.
- Standardized built-in component labels and example app copy in English.
- Cleaned up README, example documentation, and release/versioning guidance.

### Migration

```dart
// Before
StatusPresenceBadge.avaliable
AvaliablePresenceBadge()
MixedFluentShadow.hightElevation(...)
ElevationRamp.hight

// After
StatusPresenceBadge.available
AvailablePresenceBadge()
MixedFluentShadow.highElevation(...)
ElevationRamp.high
```

## 1.0.0

First release of **`fluent2_kit`** — a Flutter implementation of Microsoft's [Fluent 2](https://fluent2.microsoft.design/) design system, published under the [graund.io](https://pub.dev/publishers/graund.io) publisher.

This package is the successor to the now-unmaintained `fluent2ui` (previously published by a legacy account no longer under our control). It carries forward the full component library and design tokens, rebuilt and rebranded for a fresh start.

### Highlights

- **Theming** — `Fluent2ThemeData` with light/dark modes, brand color customization, and full design token integration (corner radius, typography, shadows, strokes, sizes, colors).
- **Components** — ~17 ready-to-use widgets: Avatar (with presence badges, activity rings, cutout), Button, FAB, NavBar, List (one-line / multi-line), Card, Radio, Checkbox, Switch Toggle, Segmented Control, Banner, Toast, Text Field (with Fluent 2 iOS spec states), Progress Bar, Heads-up Display, Sheet, Search Bar.
- **Design tokens** — `FluentCornerRadius`, `FluentSize`, `FluentTypography`, `FluentShadow`, `FluentStroke`, `FluentColors` / `FluentDarkColors`.
- **iOS-first** — components follow the Fluent 2 iOS spec; Material-based under the hood for Flutter portability.

### Migration from `fluent2ui`

Consumers of the previous `fluent2ui` package can migrate by:

1. Replacing `fluent2ui:` with `fluent2_kit:` in `pubspec.yaml`.
2. Rewriting imports: `package:fluent2ui/...` → `package:fluent2_kit/...`.
3. The public API is otherwise compatible with `fluent2ui` 9.x — including the `Fluent2ThemeData` / `Fluent2Debug` renames introduced in the migration (formerly `GbtFluentThemeData` / `GbtFluent2Debug`).

### Previous history (as `fluent2ui`)

For reference, the legacy package went through these milestones before being deprecated:

- **9.x** — final releases under the legacy publisher.
- **8.x** — switched FluentSheet to `ClampingScrollPhysics`; SDK ^3.8, Flutter ^3.32.
- **7.x** — removed deprecated APIs; SDK ^3.7, Flutter ^3.29.
- **6.x** — FluentToast/FluentTextField/FluentListItemMultiLine fixes; SDK ^3.4, Flutter ^3.22.
- **5.x** — section description API change (`icon` → `leading`); dark mode polish.
- **4.x** — added FluentIcon; dark mode compatibility; section header refinements.
- **3.x** — first publication to pub.dev; stable baseline.
