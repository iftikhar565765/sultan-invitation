# SULTAN · سلطان — Art Direction (v2 · The Gilded Firman)

## The lesson of v1 (why we rebuild)
The first pass generated **photorealistic 3D-render assets** — a carved stone arch,
photoreal roses, a lantern photographed inside a dark box, gold slabs with baked
white halos. Photoreal cutouts on a dark page read as *cheap clip-art collage*.
They also fought each other: three different rendering styles on one page, no
shared light source, no shared line weight. The layout then stacked everything
on top of everything — text over carving, cards over arches — and nothing could
breathe. Verdict: rebuild the art voice AND the layout from zero.

## Concept — "The Gilded Firman" (الفرمان المذهّب)
A firman is an imperial Ottoman decree: a manuscript page illuminated by court
gilders — *tezhip*, literally "ornamenting with gold". The site IS one.
Every section is a page of a single imperial decree announcing the Nikah:

1. **The ground** — deep ink lacquer (near-black, warm), candle-glow vignettes,
   film grain, drifting gold motes. Never a photograph. Never marble.
2. **The pages** — ivory manuscript panels with **double gold hairline frames**
   and small corner sprays (the classical illuminated margin). All long-form
   text lives on ivory; contrast is guaranteed by the ground, not by shadows.
3. **The interludes** — lacquer-black bands between pages carry the loud gold
   moments: the ayat plate, save-the-date, itinerary, countdown.
4. **One hero ornament per view** — a single grand shamsa behind the couple
   card; everywhere else ornament whispers (hairlines, 1-color sprays, small
   seals). Ornament frames content, never sits on top of it.

## The asset law (how art stops looking cheap)
One voice only: **classical flat tezhip gold illumination** — matte antique gold
(#C8A45D family), fine engraved linework, crisp silhouettes, symmetrical,
isolated on transparent ground. Explicitly banned in every prompt:
3D renders, bevels, baked shadows/halos, photographs, scenes, gradients into
brown murk, glitter, neon glow. Gold behaves like real leaf: flat, deep,
quietly lustrous. The style must survive at 80px and at 900px.

| Asset | Role | Used in |
|---|---|---|
| `shamsa-sultan.png`  | grand radial sun medallion | hero, ayat, nikah node, countdown |
| `arch-sultan.png`    | tall mihrab arch frame, open center | opening + hero card |
| `corner-sultan.png`  | rumi arabesque L-spray | panel corners (×4 mirrored) |
| `divider-sultan.png` | palmette rule | dividers, footer |
| `seal-sultan.png`    | tughra-inspired round seal | envelope, save-date, closing |
| `lantern-sultan.png` | flat fanous silhouette | opening, venue (subtle) |
| `crescent-sultan.png`| crescent + star emblem | small accents |
| `dome-sultan.png`    | flat gold dome skyline | save-date emblem, closing |
| `tulip-sultan.png`   | Ottoman tulip sprig | palette / dress-code accent |

## Palette
| Token | Value | Role |
|---|---|---|
| `--night-deep` | #0C0A07 | lacquer ground |
| `--night` | #16120D | warm lacquer bands |
| `--ivory` | #F6F0E4 | manuscript pages |
| `--paper-raised` | #FBF7EC | raised paper |
| `--parchment` | #F0E8D6 | warm washes |
| `--champagne` | #C8A45D | antique gold — ornament only |
| `--champagne-soft` | #8F7434 | burnished gold |
| `--gold-ink` | #6E5622 | gold for TEXT on ivory (4.5:1+) |
| `--burgundy` | #7A5C28 | bronze headings on ivory |
| `--wine` | #221A11 | deep accents |
| `--crimson` | #E7D3A8 | pale gold on dark |
| `--ink` | #251E15 | body ink on ivory |
| `--ink-soft` | #5E5140 | captions |

Readability law (unchanged, the noor lesson): raw gold is ornament, never body
text on ivory. On lacquer, only pale gold (#E7D3A8+) or ivory carries text.

## Type
- Display: **Bodoni Moda** — engraved imperial caps
- Editorial: **Cormorant Garamond** light — the decree prose
- Script: **Great Vibes** — the names
- Arabic/ayat: **Amiri** · UI/body: **EB Garamond** · labels: **Jost**

## Layout law (pixel-perfect, no "floating above")
- One container rhythm: `--measure` 68ch text, panels max 880px, full-bleed bands.
- Section padding: `clamp(72px, 12vh, 128px)` desktop, ≥64px mobile. Nothing
  overlaps unless it is framed inside the same layer (corner sprays pinned to
  panel corners, inside overflow-safe).
- No absolute-positioned asset may cross a text column. Hero shamsa sits
  behind the card at ≤40% opacity with the card fully opaque above it.
- Mobile: single column, arch/shamsa scale by `min(78vw, …)`, corner sprays
  shrink to ≤96px and fade to 0.5. Zero horizontal overflow is a release gate.
- Motion: one reveal language (fade + 14px rise), 700ms, staggered 70ms;
  `prefers-reduced-motion` honoured (reveal must end at `transform: none`).

## Sections (in order)
1. **Envelope** — lacquer stage, ivory envelope, gold tughra seal, bismillah
   watermark, letterbox parting on open.
2. **Hero** — lacquer stage; grand shamsa at 34% opacity behind an ivory
   manuscript card (thin double gold frame, corner sprays); bismillah,
   blessing, names, date, venue; scroll cue.
3. **The Ayat** — lacquer band; gold-framed plate; Ar-Rum 30:21 in Amiri.
4. **Our Story** — ivory manuscript page; dropcap; Rumi; Al-Baqarah 2:187 mini-ayat.
5. **Save the Date** — lacquer band; flat gold dome skyline; calendar buttons.
6. **The Celebrations** — ivory page; gold timeline, Arabic numerals,
   Mayun → Mehndi → Nikah → Rukhsati → Walima; particulars row.
7. **The Palette** — ivory page; swatches (JS-filled); tulip sprig dress-code note.
8. **The Festivities** — lacquer band; day-words string (JS-filled).
9. **Venue** — lacquer stage; mihrab arch glow with lanterns; address; map button.
10. **Countdown** — lacquer band; shamsa; gold numerals.
11. **Kindly Respond** — ivory manuscript reply card; full form.
12. **Closing** — lacquer; dome art; the Prophet's ﷺ dua; seal; replay.
