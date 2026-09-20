#!/bin/sh
# Turn a Midjourney export into a web plate for the Manuscript theme.
#
#   tools/prepare-illustration.sh <source> <slot> [saturation] [crop]
#
#   tools/prepare-illustration.sh ~/Downloads/lamp.png margin-lamp
#   tools/prepare-illustration.sh ~/Downloads/lamp.png margin-lamp 58
#   tools/prepare-illustration.sh ~/Downloads/flame.png spot-flame 80 40%x40%+30%+27%
#
# saturation  percent, default 80. These plates sit beside running text and are
#             deliberately quiet — the regality comes from the gold rules and
#             the type, not the colour of the art. Lower it to push a loud
#             plate further back.
#
# crop        optional ImageMagick geometry, applied before resizing. Spots are
#             masked to a small circle, so a subject painted small on a large
#             sheet arrives as a smudge in a field of blank paper; crop to what
#             is actually painted. Give it as percentages of the source —
#             <w>%x<h>%+<left>%+<top>% — which are converted to pixels here.
#             (ImageMagick's own percentage geometry applies the % to the size
#             but leaves the offsets in pixels, which silently crops the wrong
#             corner.) The crops in use are recorded in
#             assets/img/illustrations/PROMPTS.md.
#
# The white-point pass is deliberately gentle. The page composites these plates
# with `mix-blend-mode: multiply`, so pure white vanishes into the leaf — but a
# painted sheet's ground is never pure white, and flattening it would strip out
# the handmade-paper quality that makes these read as paintings. The contrast
# stretch clips only the brightest fifth of the pixels; the theme's radial mask
# does the rest by dissolving the edges of the sheet into the page.

set -eu

SRC=${1:-}
SLOT=${2:-}
SAT=${3:-80}
CROP=${4:-}
DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT="$DIR/assets/img/illustrations/$SLOT.jpg"

usage() {
  echo "usage: tools/prepare-illustration.sh <source> <slot> [saturation] [crop]" >&2
  echo "slots: margin-* (1:3), band-* (16:5), spot-* (1:1)" >&2
  echo "saturation: percent, default 80" >&2
  echo "crop: ImageMagick geometry, e.g. 40%x40%+30%+27%" >&2
  exit 2
}

[ -n "$SRC" ] && [ -n "$SLOT" ] || usage
[ -f "$SRC" ] || { echo "no such file: $SRC" >&2; exit 1; }

case "$SLOT" in
  margin-*) SIZE=400x1200 ;;
  band-*)   SIZE=1600x500 ;;
  spot-*)   SIZE=400x400  ;;
  *) echo "unknown slot '$SLOT' — expected margin-*, band-* or spot-*" >&2; usage ;;
esac

if [ -n "$CROP" ]; then
  GEO=$(python3 - "$SRC" "$CROP" <<'PYEOF'
import re, subprocess, sys

src, crop = sys.argv[1], sys.argv[2]
m = re.fullmatch(r'(\d+(?:\.\d+)?)%x(\d+(?:\.\d+)?)%\+(\d+(?:\.\d+)?)%\+(\d+(?:\.\d+)?)%', crop)
if not m:
    sys.exit("crop must look like 46%x46%+27%+28% (percentages of the source)")

w, h = subprocess.run(['identify', '-format', '%w %h', src],
                      capture_output=True, text=True).stdout.split()
w, h = int(w), int(h)
cw, ch, cx, cy = (float(v) for v in m.groups())
print('%dx%d+%d+%d' % (round(w*cw/100), round(h*ch/100),
                       round(w*cx/100), round(h*cy/100)))
PYEOF
)
  echo "crop $CROP -> ${GEO}px"
  set -- "$SRC" -crop "$GEO" +repage
else
  set -- "$SRC"
fi

convert "$@" \
  -resize "${SIZE}^" -gravity center -extent "$SIZE" \
  -contrast-stretch 0x18% \
  -modulate 104,"$SAT",100 \
  -strip -quality 84 -sampling-factor 4:2:0 \
  "$OUT"

echo "wrote $OUT ($SIZE, saturation ${SAT}%${CROP:+, crop $CROP})"
