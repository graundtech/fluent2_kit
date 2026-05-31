# fluent2_kit example

Runnable gallery app that demonstrates every public component shipped by [`fluent2_kit`](../). It doubles as the living reference used by the package's documentation — if you want to see how a widget is meant to be wired up, the screen for it is here.

## Running the app

```sh
cd example
flutter pub get
flutter run
```

The example depends on `fluent2_kit` via a local `path: ../` reference, so edits made in `lib/` upstream are picked up on the next `flutter run` / hot reload.

## What's inside

The component demos live under [`lib/screens/components_example_view/`](lib/screens/components_example_view) and cover: avatar, banner, button, card, controls (checkbox, radio, switch), FAB, list, nav bar, popover, presence badges, progress indicators, segmented control, sheet, tab bar, text field, and toast. Design token demos (corner radius, spacing, typography, shadow, stroke, color) live alongside under [`lib/screens/design_tokens_view/`](lib/screens/design_tokens_view).

## Local Android build

To package the example as an APK or AAB without CI, use the script at the repo root:

```sh
scripts/build_android_example.sh --apk
```

See the [root README](../README.md#local-android-example-builds) for full options and signing setup.

## See also

- [`../README.md`](../README.md) — package overview, theming, design tokens.
- [`../COMPONENTS.md`](../COMPONENTS.md) — public component catalog.
- [`../AGENTS.md`](../AGENTS.md) — repo conventions and workflows.
