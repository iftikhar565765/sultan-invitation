#!/bin/bash
# Mumtaz — premium replacements for the pishtaq crown SVG + closing plate art.
# Raw pieces painted on pure white for the white-key cutout pipeline.
set -u
RAW=/home/z/my-project/mumtaz-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== $name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'File saved to'; then
      echo "ok $name"; sleep 15; return 0
    fi
    sleep $((40 + attempt * 15))
  done
  echo "FAILED $name"
}

# The hero crown: one grand cusped Mughal pishtaq arch, warm dawn inside,
# ivory marble band with goldwork + pietra dura accents, white outside the arch.
gen pishtaq-crown 1152x864 "Luxury Indian wedding invitation arch illustration: one single grand cusped multifoil Mughal pishtaq arch perfectly centred, filling most of the frame, the arch band made of honed warm ivory Makrana marble with fine antique matte gold filigree edging, delicate carnelian red and jade green pietra dura stone blossoms inlaid sparsely along the marble band, small gold lotus bud finial at the crown apex, the inside of the arch filled with a soft warm champagne peach dawn gradient glow darkest at the bottom fading gently upward, everything outside the arch pure white empty, flat elegant matte illustration, refined delicate craftsmanship, muted antique gold, no gloss, no bevel, no jewelry shine, isolated on pure white background, high detail, no text, no letters, no words"

# The closing plate: a moonlit ivory marble niche glowing on the night garden.
gen closing-niche 1152x864 "Luxury moonlit Mughal marble niche illustration: one single grand cusped multifoil arch panel perfectly centred filling most of the frame, carved from honed warm ivory Makrana marble softly glowing in warm dusk candlelight, fine antique matte gold filigree edging along the arch band, a small gold lotus bud finial at the crown apex, gentle warm amber glow rising from the bottom of the niche interior, soft gentle shadows, everything outside the arch pure white empty, flat elegant matte illustration, refined delicate craftsmanship, muted antique gold on warm ivory, no gloss, no bevel, isolated on pure white background, high detail, no text, no letters, no words"

echo DONE
