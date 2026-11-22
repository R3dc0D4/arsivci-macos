#!/bin/zsh
# Arşivci v0.1 test dağıtımı. Eski MacRAR yayın betiğinin yerine geçer.
# Sertifika/notarizasyon bu aşamada kullanılmaz; GitHub ön sürümü tag workflow'u üretir.
set -euo pipefail
cd "$(dirname "$0")"

if [[ "${1:-}" == "publish" ]]; then
  print -u2 "Doğrudan yayın kapalı. GitHub'daki release.yml workflow'u vX.Y.Z etiketi gönderildiğinde yayınlar."
  exit 2
fi
if (( $# > 0 )); then
  print -u2 "Kullanım: ./release.sh"
  exit 2
fi

./build.sh
./package-release.sh
