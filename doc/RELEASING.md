# Release process

This document is the step-by-step recipe for cutting a new release of `fluent2_kit`. The versioning rules behind it live in [`VERSIONING.md`](VERSIONING.md).

A release ships in three coordinated places, in this order:

1. **Git tag** on the release commit — `vMAJOR.MINOR.PATCH`.
2. **GitHub release** with notes — links the tag to a user-facing changelog.
3. **pub.dev** publication — what `flutter pub get` actually downloads.

If any of the three is missing, the release isn't complete.

## Pre-release checklist

Before starting the release commands:

- [ ] Working tree is clean (`git status` is empty).
- [ ] On `main` (or the maintenance branch for a backport), in sync with origin.
- [ ] `flutter test` passes.
- [ ] `flutter analyze` is clean.
- [ ] `flutter pub publish --dry-run` reports no errors.
- [ ] `pubspec.yaml` `version:` field matches the version you intend to release.
- [ ] `CHANGELOG.md` has a section for the new version at the top, written in the project's existing format.

If any item fails, fix it and commit before continuing.

## Stable release

Replace `X.Y.Z` with the actual version throughout.

### 1. Bump version

Edit `pubspec.yaml`:

```yaml
version: X.Y.Z
```

Add an entry at the top of `CHANGELOG.md`:

```markdown
## X.Y.Z

<summary line>

### Added / Changed / Deprecated / Removed / Fixed
- <bullet>
```

For breaking changes, add a `### Migration` subsection with before/after snippets.

Commit the bump and changelog together:

```bash
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: release vX.Y.Z"
git push origin main
```

### 2. Create the Git tag

Always use an **annotated** tag with a meaningful message:

```bash
git tag -a vX.Y.Z -m "Release vX.Y.Z

<one-line summary — what makes this release worth tagging>"

git push origin vX.Y.Z
```

Tags are immutable. If you tagged the wrong commit or made a mistake in the message, treat it as a botched release and cut `vX.Y.Z+1` instead of force-moving the tag.

### 3. Create the GitHub release

Extract the matching CHANGELOG section into a temp file, then create the release:

```bash
awk '/^## X\.Y\.Z/{flag=1; next} flag && /^## /{flag=0} flag' CHANGELOG.md > /tmp/release-notes.md

gh release create vX.Y.Z \
  --title "vX.Y.Z — <short subtitle>" \
  --notes-file /tmp/release-notes.md \
  --latest \
  --verify-tag
```

Flag reference:

- `--latest` — mark this as the "Latest" release (shown on the repo home). Skip for pre-releases.
- `--verify-tag` — fail if the Git tag isn't on origin yet (catches the "forgot to push" case).
- `--notes-file` — release body in Markdown.

### 4. Publish to pub.dev

```bash
flutter pub publish
```

Confirm the prompt. The package appears on pub.dev within a couple of minutes.

### 5. Post-release verification

```bash
gh release view vX.Y.Z                            # title, notes, marked Latest
git ls-remote --tags origin | grep vX.Y.Z         # tag is on origin
flutter pub deps                                  # local resolution OK
open "https://pub.dev/packages/fluent2_kit"       # version is live
```

## Pre-releases (`-beta`, `-rc`)

Same flow as stable, with two differences:

- `pubspec.yaml`: `version: X.Y.Z-rc.1` (or `-beta.N`, `-dev.N`).
- `gh release create` flags:
  - **Add** `--prerelease`.
  - **Remove** `--latest` — pre-releases should not become the default for new users.

pub.dev recognizes pre-release versions automatically and won't surface them as the recommended version.

## Hotfix on an older major

If a security or critical bug fix is needed on a major that no longer matches `main`:

1. Check out the maintenance branch: `git checkout release/N.x` (create from the previous major's tag if it doesn't exist yet).
2. Apply the fix; bump the patch in `pubspec.yaml` and `CHANGELOG.md`.
3. Run the standard release flow (tag, GitHub release **without** `--latest`, publish).
4. Cherry-pick or port the fix forward to `main` if applicable.

See [`VERSIONING.md`](VERSIONING.md#support-policy) for which majors are still in support.

## Retracting a release

If a release ships with a serious defect:

- **pub.dev**: use `flutter pub retract <version>` within 7 days, or contact pub.dev admins after. Retracted versions stay installable for existing pinned consumers but won't be picked by new resolutions.
- **GitHub**: edit the release notes to add a `> ⚠️ Retracted — see vX.Y.Z+1` banner. Do **not** delete the release or the tag — that breaks anyone with a pinned dep.
- Cut a follow-up patch (`vX.Y.Z+1`) with the fix immediately.

Never delete or move a published tag.
