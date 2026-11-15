# SULTAN · سلطان — Art Direction
## "The Imperial Court" — an onyx-and-gold Ottoman nikah invitation

### Concept
A midnight walima at the imperial court. The entire page is polished onyx
black marble lit by candlelight; the invitation itself arrives as ivory
letters raised on the darkness, framed in matte antique gold. The visual
language is Ottoman imperial — muqarnas corbels, tughra-inspired seals,
fanous lanterns with amber glass, tulip arabesques — executed as premium
transparent PNG art, never clip-art. Cinematic, restrained, and deep:
film grain, letterbox reveals, gold dust, and slow light. Nothing busy,
nothing glittering, nothing literal.

### Palette
| Token | Value | Role |
|---|---|---|
| `--night-deep` | #0E0B08 | onyx page ground (the dark of the court) |
| `--night` | #191410 | warm onyx bands |
| `--ivory` | #F5EFE3 | ivory letter paper |
| `--paper-raised` | #FBF7EC | raised card paper |
| `--parchment` | #F1E9D8 | warm parchment washes |
| `--champagne` | #C8A45D | antique gold — lines & ornament |
| `--champagne-soft` | #8F7434 | burnished gold |
| `--gold-ink` | #6E5622 | deep gold for TEXT on ivory (≥4.5:1) |
| `--burgundy` | #8A6A2E | bronze — headings on ivory |
| `--wine` | #241B12 | deep bronze-black accents |
| `--crimson` | #E9D6AE | pale gold — light accent on dark |
| `--ink` | #241D14 | body ink on ivory |
| `--ink-soft` | #5E5140 | soft ink (captions) |

### Readability law (the noor lesson)
Raw gold (#C8A45D) is NEVER body text on ivory — it fails contrast
(2.1:1). All text on light paper uses `--ink`, `--ink-soft`, `--burgundy`
or `--gold-ink`. Raw gold text is reserved for dark grounds, where it
clears 6:1. Ornament, hairlines and seals may use raw gold anywhere.

### Type
- Display: **Bodoni Moda** — fashion-noir engraved caps (the imperial voice)
- Editorial: **Cormorant Garamond** light italic — the courtly prose voice
- Script: **Great Vibes** — the couple's names
- Arabic / ayat: **Amiri** (classical naskh) · display **Aref Ruqaa**
- UI/body: **EB Garamond** · labels **Jost**

### Sections (in order)
1. **Envelope** — ivory envelope on onyx, gold tughra seal, letterbox bars
   part like a curtain when the seal breaks.
2. **Hero** — full-bleed onyx stage; grand muqarnas arch of gold crowning
   an ivory card; amber fanous lanterns at the shoulders; gold dust
   drifting; Bismillah above the arch; Ar-Rum 30:21 beneath the names.
3. **The Ayat** — onyx band, gold frame, 30:21 in Amiri + translation.
4. **Our Story** — ivory letter panels floating on the dark, corner
   arabesques, Rumi quote.
5. **Save the Date** — onyx band with golden dome emblem, calendar buttons.
6. **The Celebrations** — five Muslim events (Mayun / Mehndi / Nikah /
   Rukhsati / Walima) as gold-numbered cards on the dark.
7. **The Particulars & Palette** — ivory letter; onyx, gold, ivory swatches.
8. **Venue** — arch-framed on the dark, lanterns, map link.
9. **Countdown** — onyx band, gold numerals.
10. **Kindly Respond** — ivory RSVP letter card.
11. **Closing** — tughra seal, the Prophet's ﷺ dua in Amiri, gold rule.

### Cinematic grammar
- Film grain overlay (SVG turbulence, 4% opacity) across the whole page.
- Letterbox bars inside the envelope stage that part on open.
- Radial candlelight vignettes behind arches and seals.
- Gold-dust particles drifting in the hero (CSS only, slow).
- One light-sweep across display headings as they enter view.
- Reveal easing `cubic-bezier(.16,.84,.24,1)` at 0.9s — filmic, unhurried.

### Rules
- Premium transparent PNG art via the white-key flood-fill cutout pipeline.
- Arabic text is real webfont text (Amiri) — never AI-generated
  calligraphy images.
- Onyx stays WARM (brown-black) — never blue-black, never grey.
- Small geometric marks may be inline SVG; everything else is PNG art.
