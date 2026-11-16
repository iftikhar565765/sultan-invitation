#!/bin/bash
# SULTAN — onyx & gold imperial Ottoman suite, regeneration Ⅱ.
# Hardened prompts: flat painted matte illustration, no photorealism,
# no 3D bevel, no garbage glyph details. Raw on pure white for the
# border flood-fill cutout pipeline. Textures are kept from v1.
set -u
RAW=/home/z/my-project/sultan-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8 9 10; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== sultan/$name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'completed'; then
      echo "ok sultan/$name"; sleep 8; return 0
    fi
    rm -f "$RAW/$name.png"
    sleep $((20 + attempt * 8))
  done
  echo "FAILED sultan/$name"
}

STYLE="flat painted illustration in the manner of an Ottoman illuminated manuscript, luxury wedding stationery artwork, muted matte antique gold, absolutely no photorealism, no photograph, no 3D rendering, no glossy metallic bevel, no embossed shine, uniform matte finish, crisp clean silhouette, isolated on pure white background, high detail, no text, no letters, no watermark"

# 1 — hero arch: imperial ogee arch, gold band + onyx inlay, candlelit glow inside
gen arch-sultan-tall 1152x864 "one single grand pointed ogee imperial arch frame perfectly centred filling most of the frame, the arch band of matte antique gold leaf with fine black onyx inlay rosettes and delicate hairline scrollwork, slim side colonnettes with tiny gold capitals, a small gold crescent finial at the crown apex, the inside of the arch filled with a soft warm candlelit amber glow gradient darkest at the bottom fading gently upward, everything outside the arch pure white empty, $STYLE"

# 2 — fanous lantern
gen lantern-sultan 768x1344 "one slender hanging Ottoman imperial fanous lantern, matte antique gold frame with fine pierced arabesque openwork, warm amber tinted glass panels, small ornate chain rising to a ring at the top, polished black onyx cap at base and crown, $STYLE"

# 3 — shamsa medallion
gen shamsa-sultan 1024x1024 "one round Islamic eight-pointed khatim star medallion of fine matte gold filigree line art radiating from a small polished onyx black stone centre, delicate hairline arabesque scrolls between the points, perfectly symmetric, centred, generous white margin around it, $STYLE"

# 4 — corner ornament (true corner, anchored top-left)
gen corner-sultan 1024x1024 "one top-left corner ornament of slender matte antique gold arabesque scrollwork hugging the top-left corner of the canvas with small Ottoman tulip buds and tiny ivory blossoms curving gently inward toward the centre, thin delicate lines, generous white space on the right and bottom, $STYLE"

# 5 — divider: ultra-thin horizontal rule
gen divider-sultan 1344x768 "an extremely thin horizontal gold divider rule running across the full width at the vertical centre of the canvas, a single fine hairline double rule with one tiny eight-pointed gold star at the exact centre and two small symmetric arabesque scrolls curling outward at the ends, the ornament occupies only the middle eight percent of the canvas height, everything above and below the rule pure white empty, $STYLE"

# 6 — crescent
gen crescent-sultan 1024x1024 "one slender elongated matte antique gold crescent moon elegantly curved with one tiny five-pointed gold star nestled in its upper curve, fine filigree scroll texture on the crescent surface, centred with generous white margin, $STYLE"

# 7 — roses (tight cluster, no white pockets)
gen roses-sultan 1024x1024 "one tight lush cluster of ivory cream roses with deep burgundy-black velvet leaves and tiny gold buds, flowers overlapping densely with no gaps between them, soft painterly matte illustration, muted candlelit jewel tones, crisp clean edges, isolated on pure white background, high detail, no text"

# 8 — wax seal
gen seal-sultan 1024x1024 "one round deep onyx black wax seal stamped with an embossed matte antique gold eight-pointed star and slender crescent at its centre, fine beaded pressed edge, slightly imperfect hand-poured wax rim, matte finish, centred, generous white margin, $STYLE"

# 9 — swag garland (wide)
gen swag-sultan 1344x768 "one elegant hanging garland swag curving in a gentle arc across the canvas, made of small ivory tulips and cream roses with fine matte gold leaves and thin gold ribbon tied at both upper corners, soft painterly matte illustration, muted candlelit tones, crisp clean edges, isolated on pure white background, high detail, no text"

# 10 — dome (closing plate)
gen dome-sultan 1152x864 "one majestic golden Ottoman mosque dome with a slender gold crescent finial at its crown, flanked by two elegant slim minarets with warm lit arched windows, deep onyx black stone bands with matte gold ornament, glowing candlelit twilight, painted matte illustration, muted antique gold, no photorealism, no photograph, crisp clean edges, isolated on pure white background, high detail, no text"

echo SULTAN-DONE
