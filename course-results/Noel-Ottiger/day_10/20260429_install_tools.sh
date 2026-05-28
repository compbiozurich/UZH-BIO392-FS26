#!/usr/bin/env bash
set -euo pipefail

echo "Installing system packages"
apt-get update
apt-get install -y --no-install-recommends \
    wget curl unzip ca-certificates tabix bcftools build-essential gawk file

mkdir -p "$HOME/bin" "$HOME/opt"
cd "$HOME/opt"

# ---------- PLINK 1.9 ----------
echo "Downloading PLINK 1.9"
PLINK_URL="https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20241022.zip"
wget --no-verbose --tries=3 --timeout=60 -O plink19.zip "$PLINK_URL"

rm -rf plink_1.9
mkdir -p plink_1.9
unzip -o plink19.zip -d plink_1.9 >/dev/null
rm plink19.zip

test -x plink_1.9/plink || { echo "PLINK binary missing after unzip"; exit 1; }
ln -sf "$HOME/opt/plink_1.9/plink" "$HOME/bin/plink"

# ---------- ADMIXTURE 1.3.0 ----------
echo "Downloading ADMIXTURE 1.3.0"
ADMIX_URL="https://dalexander.github.io/admixture/binaries/admixture_linux-1.3.0.tar.gz"
wget --no-verbose --tries=3 --timeout=60 -O admixture.tgz "$ADMIX_URL"

test "$(stat -c%s admixture.tgz)" -gt 100000 || { echo "ADMIXTURE download too small, aborting"; exit 1; }

rm -rf dist
tar -xzf admixture.tgz
rm admixture.tgz

ADMIX_BIN="$HOME/opt/dist/admixture_linux-1.3.0/admixture"
test -x "$ADMIX_BIN" || { echo "ADMIXTURE binary missing after extract"; exit 1; }
ln -sf "$ADMIX_BIN" "$HOME/bin/admixture"

# ---------- PATH ----------
if ! grep -q 'HOME/bin' "$HOME/.bashrc" 2>/dev/null; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
fi
export PATH="$HOME/bin:$PATH"