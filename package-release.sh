#!/bin/zsh
# Arşivci'nin yerel test dağıtımını (DMG + ZIP) üretir.
# Geliştirici sertifikası yoksa uygulama ad-hoc imzalıdır; Apple notarizasyonu içermez.
set -euo pipefail
cd "$(dirname "$0")"

APP="build/Arşivci.app"
[[ -d "$APP" ]] || { print -u2 "Önce ./build.sh çalıştırın."; exit 1; }
BUNDLE_ID=$(/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' "$APP/Contents/Info.plist")
VERSION=$(/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' "$APP/Contents/Info.plist")
[[ "$BUNDLE_ID" == "com.r3dc0d4.arsivci" ]] || { print -u2 "Yanlış uygulama kimliği: $BUNDLE_ID"; exit 1; }
[[ "$VERSION" == <->.<->.<-> ]] || { print -u2 "Geçersiz sürüm: $VERSION"; exit 1; }

/usr/bin/codesign --verify --deep --strict "$APP"
ARCHS=$(/usr/bin/lipo -archs "$APP/Contents/MacOS/Arsivci")
[[ "$ARCHS" == *arm64* && "$ARCHS" == *x86_64* ]] || { print -u2 "Evrensel uygulama değil: $ARCHS"; exit 1; }

mkdir -p dist
DMG="dist/Arsivci-$VERSION.dmg"
ZIP="dist/Arsivci-$VERSION.zip"
SHA="dist/Arsivci-$VERSION.sha256"
if [[ -e "$DMG" || -e "$ZIP" || -e "$SHA" ]]; then
  print -u2 "Paket zaten var; üzerine yazılmadı: $DMG / $ZIP"
  exit 1
fi

STAGING=$(/usr/bin/mktemp -d "${TMPDIR:-/tmp/}arsivci-release.XXXXXX")
cleanup() {
  if [[ -n "${STAGING:-}" && -d "$STAGING" ]]; then /bin/rm -rf -- "$STAGING"; fi
}
trap cleanup EXIT

/usr/bin/ditto "$APP" "$STAGING/Arşivci.app"
/bin/ln -s /Applications "$STAGING/Applications"
/bin/cp README.md RELEASE_NOTES.md "$STAGING/"

/usr/bin/hdiutil create -volname "Arşivci $VERSION" -srcfolder "$STAGING" -format UDZO -ov "$DMG"
/usr/bin/ditto -c -k --keepParent "$APP" "$ZIP"
/usr/bin/hdiutil verify "$DMG"
/usr/bin/unzip -tq "$ZIP"
(cd dist && /usr/bin/shasum -a 256 "Arsivci-$VERSION.dmg" "Arsivci-$VERSION.zip" > "Arsivci-$VERSION.sha256")
/usr/bin/shasum -a 256 "$DMG" "$ZIP"

print "✔ Arşivci $VERSION paketleri: $DMG, $ZIP ve $SHA"
print "ℹ Apple Developer ID/notarizasyon olmadan hazırlanmış erken test sürümüdür."
