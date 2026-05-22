#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXAMPLE_DIR="$ROOT_DIR/example"

PACKAGE_FORMAT="apk"
RUN_TESTS=1
CLEAN_BUILD=0
BUILD_NUMBER=""
BUILD_NAME=""

usage() {
  cat <<USAGE
Usage: scripts/build_android_example.sh [options]

Options:
  --apk                  Build only the release APK. Default.
  --aab                  Build only the release Android App Bundle.
  --both                 Build APK and Android App Bundle.
  --clean                Run flutter clean before building.
  --skip-tests           Skip package and example tests.
  --build-number VALUE   Override Android versionCode.
  --build-name VALUE     Override Android versionName.
  -h, --help             Show this help.

Signing:
  To create a signed release, add example/android/key.properties and the
  referenced keystore file. Without them, Android falls back to debug signing.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apk)
      PACKAGE_FORMAT="apk"
      shift
      ;;
    --aab)
      PACKAGE_FORMAT="aab"
      shift
      ;;
    --both)
      PACKAGE_FORMAT="both"
      shift
      ;;
    --clean)
      CLEAN_BUILD=1
      shift
      ;;
    --skip-tests)
      RUN_TESTS=0
      shift
      ;;
    --build-number)
      BUILD_NUMBER="${2:-}"
      if [[ -z "$BUILD_NUMBER" ]]; then
        echo "Missing value for --build-number" >&2
        exit 1
      fi
      shift 2
      ;;
    --build-name)
      BUILD_NAME="${2:-}"
      if [[ -z "$BUILD_NAME" ]]; then
        echo "Missing value for --build-name" >&2
        exit 1
      fi
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

build_args=(--release)
if [[ -n "$BUILD_NUMBER" ]]; then
  build_args+=("--build-number=$BUILD_NUMBER")
fi
if [[ -n "$BUILD_NAME" ]]; then
  build_args+=("--build-name=$BUILD_NAME")
fi

cd "$ROOT_DIR"

if [[ "$CLEAN_BUILD" -eq 1 ]]; then
  (cd "$EXAMPLE_DIR" && flutter clean)
fi

flutter pub get

if [[ "$RUN_TESTS" -eq 1 ]]; then
  flutter test
fi

cd "$EXAMPLE_DIR"
flutter pub get

if [[ "$RUN_TESTS" -eq 1 ]]; then
  flutter test
fi

case "$PACKAGE_FORMAT" in
  apk)
    flutter build apk "${build_args[@]}"
    ;;
  aab)
    flutter build appbundle "${build_args[@]}"
    ;;
  both)
    flutter build apk "${build_args[@]}"
    flutter build appbundle "${build_args[@]}"
    ;;
esac

echo
echo "Build outputs:"
find "$EXAMPLE_DIR/build/app/outputs" -type f \( -name "*.apk" -o -name "*.aab" \) -print
