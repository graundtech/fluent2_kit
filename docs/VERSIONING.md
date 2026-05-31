# Versioning policy

`fluent2_kit` follows [Semantic Versioning 2.0.0](https://semver.org). This document defines what counts as a breaking change in this package, how breakings are announced, and how legacy versions are supported.

## Version scheme

Versions are `MAJOR.MINOR.PATCH`:

| Component | When it bumps |
|-----------|---------------|
| **MAJOR** | Any backwards-incompatible change to the public API. |
| **MINOR** | New functionality added in a backwards-compatible way (new widget, new optional parameter, new token, etc.). |
| **PATCH** | Backwards-compatible bugfixes, internal refactors, or documentation changes that ship in a release. |

The version in `pubspec.yaml` is the source of truth and is always equal to the version on pub.dev and the Git tag.

## What counts as the "public API"

The public API is everything exported from top-level public entrypoints in `lib/`, including `fluent2_kit.dart`, `theme_data.dart`, `fluent_icons.dart`, `color_mode.dart`, and `fluent2_debug.dart`. Code under `lib/src/...` is internal unless it is re-exported by one of those public entrypoints.

A breaking change includes — but is not limited to:

- Removing or renaming an exported symbol (class, function, top-level const, enum value, typedef).
- Removing or renaming a public parameter; making an optional parameter required.
- Changing the type of a public parameter, return type, or field in a way callers cannot adopt without changes.
- Changing the default value of an optional parameter in a way that produces visibly different behavior.
- Changing visual output of a widget when the change cannot be opted out of (e.g., default theme tokens).
- Tightening SDK / Flutter version constraints.

A non-breaking change includes:

- Adding new optional parameters with sensible defaults.
- Adding new widgets, tokens, or theme fields.
- Internal refactors with no API impact.
- Bugfixes that align behavior with documented intent.

## Pre-releases

For changes that need real-world validation before a stable release, use a pre-release suffix:

| Suffix | Purpose |
|--------|---------|
| `X.Y.Z-dev.N` | Internal/development snapshots; not announced. |
| `X.Y.Z-beta.N` | Public preview; API may still shift. |
| `X.Y.Z-rc.N` | Release candidate; API frozen, gathering final feedback. |

Pre-releases are tagged on Git (`v2.0.0-rc.1`), published to pub.dev (which won't promote them to "latest"), and marked `--prerelease` on the GitHub release.

## Breaking changes

Breaking changes are unavoidable in an evolving design system, but they should never surprise consumers. Policy:

1. **Deprecate before remove (when viable).** Mark the symbol with `@Deprecated('use X instead — to be removed in vN+1.0.0')` for at least one minor release before removal. This gives consumers a build-time warning and a documented path forward.
2. **Major bump is mandatory** for every breaking change, no matter how small.
3. **Document migration.** Every major release ships with a migration section in `CHANGELOG.md` and the GitHub release notes: what changed, why, and how to update calling code (with before/after snippets).
4. **Pre-release first.** Non-trivial majors should go through at least one `rc` before the stable tag.

## Support policy

Only the latest major receives active development. The previous major may receive **security fixes** for up to 6 months after the new major is published, on a `release/N.x` branch — bugfixes and features will not be backported.

If you depend on this package in production and a security issue affects an older major, open an issue describing the impact.

## Tag convention

Git tags use the `v` prefix: `v1.0.0`, `v2.0.0-rc.1`. The prefix is intentional — it keeps tags grouped and matches the dominant convention for GitHub Actions and tooling that detect releases via `v\d+\.\d+\.\d+`.

Tags are **annotated** (`git tag -a`) so they carry author, date, and a release message. Tags are immutable once pushed.

## Relation to pub.dev

Every published version on pub.dev has a matching Git tag on the same commit. A release flow always touches both — see [`RELEASING.md`](RELEASING.md).

## Legacy history (`fluent2ui`)

`fluent2_kit` is the successor to the now-deprecated [`fluent2ui`](https://pub.dev/packages/fluent2ui) package, which reached `9.x` before being abandoned by the previous publisher. Versioning for `fluent2_kit` restarts at `1.0.0`. The legacy tags `v3.0.0`–`v9.0.0` that previously existed in this repo were removed to avoid confusion; the `fluent2ui` package history on pub.dev is unaffected and remains available there for reference.
