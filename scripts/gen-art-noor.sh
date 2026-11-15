#!/bin/bash
# NOOR — emerald & gold Muslim wedding suite: premium art on pure white
# for the flood-fill cutout pipeline. Textures are full-bleed.
set -u
RAW=/home/z/my-project/noor-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== noor/$name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'File saved to'; then
      echo "ok noor/$name"; sleep 12; return 0
    fi
    sleep $((35 + attempt * 12))
  done
  echo "FAILED noor/$name"
}

GOLD="fine antique gold leaf arabesque filigree, Ottoman illuminated manuscript style, delicate hairline scrolls, muted matte gold, no gloss, no 3D bevel, flat elegant luxury composition, crisp clean silhouette edges, no halo, no glow bleeding outside the object, isolated on pure white background, high detail, no text, no letters, no calligraphy"

# ---------- hero & scene art ----------
gen arch-noor 1152x1152 "a grand ornate golden ogee pointed mihrab arch frame perfectly centred filling the frame, the arch band of matte antique gold on deep emerald green stone with fine girih star pattern inlay, small delicate arabesque crest with a tiny crescent finial at the crown apex, interior of the arch pure white empty, everything outside the arch pure white empty, $GOLD"
gen lantern-noor 1024x1024 "one hanging Ottoman brass fanous lantern with softly translucent amber glass panels, slender ornate chains rising to a small ring at the top, matte antique brass with deep emerald enamel accents, unlit panels with no bloom, $GOLD"
gen shamsa-noor 1024x1024 "a round Islamic eight-pointed star medallion, fine matte gold arabesque filigree radiating from a small turquoise stone centre, perfectly symmetrical and delicate, $GOLD"
gen crescent-noor 1024x1024 "a slender matte antique gold crescent moon with one tiny five-pointed gold star nestled in its curve, fine filigree surface texture, $GOLD"
gen dome-noor 1152x864 "a majestic golden mosque dome with a slender gold crescent finial, flanked by two elegant slim minarets with warm lit arched windows, deep emerald green stone bands and matte gold ornament, twilight grandeur, $GOLD"
gen roses-noor 1024x1024 "a lush cluster of deep crimson and ivory cream roses with dark emerald green leaves and tiny gold buds, soft painterly matte illustration, muted jewel tones, crisp clean edges, isolated on pure white background, high detail, no text"
gen corner-noor 1024x1024 "a top-left corner ornament of slender antique gold arabesque scrollwork with tiny gold blossoms curving gently inward, $GOLD"
gen swag-noor 1152x864 "a slim hanging swag garland curving in a gentle arc, of tiny gold arabesque scrolls and ivory jasmine buds with deep emerald green leaves, illuminated manuscript style, $GOLD"
gen divider-noor 1024x1024 "a slender horizontal antique gold divider ornament: a fine line with one tiny eight-pointed star at the centre and small arabesque scrolls curling at the ends, $GOLD"
gen seal-noor 1024x1024 "a round deep emerald green wax seal with an embossed matte gold crescent moon and star at the centre, fine beaded edge, slightly imperfect hand-poured wax edge, matte finish, luxury, isolated on pure white background, high detail, no text"

# ---------- textures (full-bleed, not cut out) ----------
gen velvet-emerald 1440x720 "seamless deep emerald green silk velvet texture, very dark luxurious fabric, soft subtle diagonal sheen, gentle folds of light, minimal, elegant, no objects, no text, no border"
gen paper-ivory 1440x720 "seamless warm ivory cream handmade paper texture, very subtle fibre grain, faint warm golden undertone, matte luxury stationery, minimal, no objects, no text, no border"

echo NOOR-DONE
