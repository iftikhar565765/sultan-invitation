#!/bin/bash
# NOOR — premium asset suite (emerald & ivory). Raw pieces on pure white
# for the border-flood cutout pipeline; textures full-bleed.
set -u
RAW=/home/z/my-project/noor-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== $name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'File saved to'; then
      echo "ok $name"; sleep 12; return 0
    fi
    sleep $((30 + attempt * 10))
  done
  echo "FAILED $name"
}

G="antique matte gold, fine goldwork line art, no shine, no gloss, no 3D bevel"
E="deep emerald green accents, muted jewel tone, matte"
C="flat elegant refined illustration, luxury wedding stationery style, high detail, isolated on pure white background, no text, no letters, no watermark"

# 1 — the hero arch: grand mihrab arch frame (interior white for the card)
gen arch-noor 1152x864 "one grand ornamental mihrab arch frame perfectly centred filling the frame, slender pointed Islamic arch with fine $G borders and delicate emerald green arabesque scrollwork along the band, small gold finial at the crown apex, two slim gold side columns with tiny $E inlay panels, the inside of the arch pure white empty, everything outside the arch pure white empty, $C"

# 2 — fanous lantern
gen lantern-noor 832x1248 "one slender hanging Moroccan-Egyptian fanous lantern of $G with deep emerald tinted glass panels and fine pierced arabesque openwork, small chain ring at top, $C"

# 3 — shamsa / star-lattice medallion
gen shamsa-noor 1024x1024 "one round Islamic geometric medallion, an eight-pointed khātim star rosette of fine $G line art interlacing into a delicate girih lattice, tiny $E details at the star points, perfectly symmetric, centred, generous white margin around it, $C"

# 4 — arabesque corner
gen corner-noor 1024x1024 "one top-left corner ornament of two slender antique gold arabesque scroll sprays with tiny emerald green leaves and small white jasmine buds curving gently inward, $G, $E, delicate thin lines, generous white space, $C"

# 5 — white roses & jasmine cluster
gen roses-noor 1024x1024 "one soft cluster of three ivory white garden roses with small white jasmine buds and slender deep emerald green leaves, gentle matte painterly style, muted warm tones, $C"

# 6 — hanging garland swag
gen swag-noor 1152x864 "one slim hanging swag garland curving in a gentle arc, alternating small ivory white rosebuds tiny gold beads and deep emerald green leaves, fine goldwork thread, $G, $C"

# 7 — ornamental divider rule
gen divider-noor 1152x864 "one single horizontal ornamental divider rule centred in the frame on a pure white background, a fine $G hairline with a small eight-pointed gold star and two tiny emerald leaf buds at the centre, thin elegant lines, generous white space above and below, $C"

# 8 — wax seal
gen seal-noor 1024x1024 "one round antique matte gold wax seal, embossed eight-pointed khātim star emblem at centre, fine beaded edge, slightly imperfect hand-poured wax edge, muted old gold, no shine, no gloss, $C"

# 9 — mosque dome with crescent finial
gen dome-noor 832x1248 "one single elegant mosque dome silhouette in deep emerald green stone with fine $G details, a delicate gold crescent finial at the apex, slender small minarets at the sides, soft matte painterly style, $E, $C"

# 10 — small crescent & star ornament
gen crescent-noor 1024x1024 "one delicate antique gold crescent moon cradling a small eight-pointed gold star, fine $G line art with the tiniest emerald accents, centred, generous white margin, $C"

echo ALL-DONE; ls -la "$RAW"
