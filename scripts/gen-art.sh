#!/bin/bash
# SULTAN — onyx & gold imperial Ottoman suite: premium art on pure white
# for the flood-fill cutout pipeline. Textures are full-bleed.
set -u
RAW=/home/z/my-project/sultan-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== sultan/$name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'File saved to'; then
      echo "ok sultan/$name"; sleep 12; return 0
    fi
    sleep $((35 + attempt * 12))
  done
  echo "FAILED sultan/$name"
}

GOLD="fine antique gold leaf arabesque filigree, Ottoman imperial manuscript style, delicate hairline scrolls, muted matte gold, no gloss, no 3D bevel, flat elegant luxury composition, crisp clean silhouette edges, no halo, no glow bleeding outside the object, isolated on pure white background, high detail, no text, no letters, no calligraphy"

# ---------- hero & scene art ----------
gen arch-sultan 1024x1024 "a flat ornamental ogive pointed arch FRAME only, perfectly centred filling the frame, slim muqarnas corbel steps along the inner edge, the arch band of matte antique gold with fine gold girih star pattern inlay, small crescent finial at the crown apex, thin slim band, the area inside the arch completely plain flat pure white empty, the area outside the arch completely plain flat pure white empty, no walls, no depth, no niche, no shading inside, $GOLD"
gen seal-sultan 1024x1024 "a round imperial medallion wax seal, abstract tughra-inspired flourish with three tall elegant streaming strokes rising from sweeping interlaced curves, encircled by a fine double gold border with tiny bead dots, matte antique gold with warm deep patina in the recesses, $GOLD"
gen corner-sultan 1024x1024 "a top-left corner ornament of slender antique gold arabesque scrollwork with small Ottoman tulip buds and thin laurel-like leaves curving gently inward, $GOLD"
gen lantern-sultan 1024x1024 "one hanging Ottoman imperial fanous lantern with softly translucent amber glass panels, slender ornate gold chains rising to a small ring at the top, matte antique gold frame with polished onyx black caps, unlit panels with no bloom, $GOLD"
gen shamsa-sultan 1024x1024 "a round Islamic eight-pointed star medallion, fine matte gold arabesque filigree radiating from a small polished onyx black stone centre, perfectly symmetrical and delicate, $GOLD"
gen divider-sultan 1024x1024 "a slim horizontal gold ornament rule, a fine double hairline with a small Ottoman tulip and two symmetric arabesque scrolls at the centre, perfectly centred and delicate, $GOLD"
gen crescent-sultan 1024x1024 "a slender elongated matte antique gold crescent moon with one tiny five-pointed gold star nestled in its curve, fine filigree surface texture, $GOLD"
gen roses-sultan 1024x1024 "a lush cluster of ivory cream roses with deep burgundy-black velvet leaves and tiny gold buds, soft painterly matte illustration, muted candlelit jewel tones, crisp clean edges, isolated on pure white background, high detail, no text"
gen swag-sultan 1024x1024 "an elegant hanging garland swag of small ivory tulips and cream roses with fine gold leaves and thin gold ribbon tied at both ends, soft painterly matte illustration, muted candlelit tones, crisp clean edges, isolated on pure white background, high detail, no text"
gen dome-sultan 1152x864 "a majestic golden Ottoman mosque dome with a slender gold crescent finial, flanked by two elegant slim minarets with warm lit arched windows, polished onyx black stone bands and matte gold ornament, candlelit twilight grandeur, $GOLD"

# ---------- full-bleed textures ----------
gen marble-onyx 1440x720 "seamless polished onyx black marble surface texture in soft candlelight, very faint warm gold veining threading through deep charcoal black stone, subtle bronze shimmer low in the frame, matte satin finish, luxury stone surface, soft diffused light, minimal, no objects, no text, no border, flat even lighting, high detail"
echo SULTAN-DONE
