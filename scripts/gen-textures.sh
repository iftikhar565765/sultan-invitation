#!/bin/bash
# Only the two marble textures — spaced, with per-call timeout.
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
gen marble-texture 1440x720 "seamless honed Makrana marble surface texture, warm ivory cream stone, very faint soft grey veining, subtle warm undertone, matte satin finish, luxury stone surface, soft diffused museum light, minimal, no objects, no text, no border, flat even lighting, high detail"
gen marble-dusk 1440x720 "seamless polished warm umber espresso brown marble surface texture in soft candlelight, subtle darker chocolate veining, deep bronze umber tones, faint warm amber glow low in the frame, matte finish, luxury stone surface, minimal, no objects, no text, no border, flat even lighting, high detail"
echo TEXTURES-DONE
