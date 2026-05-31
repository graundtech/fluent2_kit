# AGENTS.md instructions

This is an open source Flutter package, published at https://pub.dev/packages/fluent2_kit. It implements Microsoft's Fluent 2 design system for iOS-first mobile experiences.

## Repo map

- `lib/fluent2_kit.dart` — main package barrel and preferred public entrypoint.
- Other top-level files in `lib/` — secondary public entrypoints when imported directly.
- `lib/src/` — internal implementation unless re-exported by a public entrypoint.
- `example/` — runnable demo app; the living reference for component usage.
- `test/` — unit and widget tests.
- `docs/` — versioning and release policies.
- `COMPONENTS.md` — catalog of every public widget with a short description.

## Public API

Anything exported from a top-level public entrypoint in `lib/` is public and subject to SemVer. Code under `lib/src/` is internal unless it is re-exported by one of those public entrypoints.

Before changing or removing a public symbol, check whether it counts as a breaking change per `docs/VERSIONING.md` and apply the deprecation policy described there.

## Conventions

- **Reuse existing components.** Consult `COMPONENTS.md` and use the components whenever possible instead of building one-offs.
- **Naming.** Public widgets and tokens use the `Fluent*` prefix (`FluentButton`, `FluentColors`, `Fluent2ThemeData`).
- **Theming.** Style only through `Fluent2ThemeData` and the `Fluent{CornerRadius,Size,Typography,Shadow,Stroke,Colors}` token classes. Never hardcode literal colors, paddings, or radii.
- **Platform intent.** Components follow the Fluent 2 iOS spec; Material is used internally for Flutter portability. Don't propose Material-style affordances unless they match the iOS spec.
- **Commits.** Conventional Commits (`feat:`, `fix:`, `refactor!:`, `chore:`, `docs:`, `ci:`); use `!` or a `BREAKING CHANGE:` footer for breakings.

## Workflows

Pre-PR checklist:

```bash
flutter pub get
flutter analyze
flutter test
flutter pub publish --dry-run   # catches pub.dev packaging issues
```

Running the demo app:

```bash
cd example && flutter run
```

Cutting a release: see `docs/RELEASING.md`. Do not bump `pubspec.yaml` version, tag, or publish without following that flow.

## SDK constraints

`sdk: ^3.11.0`, `flutter: ">=3.41.0"`. Don't introduce APIs that require versions above these without flagging the bump explicitly.

## References

- `COMPONENTS.md` — public component catalog.
- `docs/VERSIONING.md` — SemVer policy, deprecation rules, support window.
- `docs/RELEASING.md` — step-by-step release process.
- `README.md` "Coexisting with fluent_ui" — how to handle the name collision when both packages are imported.
- Fluent 2 spec: https://fluent2.microsoft.design/
