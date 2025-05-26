#!/bin/bash

# Script stolen from https://github.com/AxOS-project/sleex-packages/blob/main/build-all.sh
set -e

OUTDIR="./out"
mkdir -p "$OUTDIR"

GREEN='\033[0;32m'
NC='\033[0m'

for file in .; do
    echo $file
    [[ -f "PKGBUILD" ]] || continue
    echo -e "${GREEN}==> Building package in $file${NC}"
    pushd "$file" > /dev/null
    makepkg -fs --noconfirm
    rm -r pkg/
    mv ./*.pkg.tar.zst "../$OUTDIR/"
    popd > /dev/null
done

for dir in */; do
    [[ -f "${dir}/PKGBUILD" ]] || continue
    echo -e "${GREEN}==> Building package in $dir${NC}"
    pushd "$dir" > /dev/null
    makepkg -fs --noconfirm
    rm -r pkg/
    mv ./*.pkg.tar.zst "../$OUTDIR/"
    popd > /dev/null
done

echo -e "${GREEN}✅ All packages built and moved to $OUTDIR${NC}"
notify-send "All packages built" "All packages have been built and moved to $OUTDIR" -a "Theom packages"