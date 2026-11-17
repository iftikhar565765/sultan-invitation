#!/usr/bin/env python3
"""Sultan v3 asset repair.

1. Whiteness-keyed alpha defringe: neutral bright pixels (white halo /
   white blobs left by incomplete knock-out) fade to transparent while
   saturated gold strokes keep their alpha. Soft (alpha-proportional) so
   antialiased edges survive.
2. Arch interior: recolour the low-saturation "mirror" interior into a
   deep onyx night with a warm glow — the gold crescent then floats in
   a doorway instead of a bathroom mirror.
"""

from PIL import Image
import os

ART = os.path.join(os.path.dirname(__file__), "..", "assets", "art")


def whiteness_defringe(path, lo=185, hi=242, max_kill=1.0, sat_max=0.16):
    """alpha *= 1 - whiteness for near-neutral bright pixels."""
    im = Image.open(path).convert("RGBA")
    px = im.load()
    W, H = im.size
    changed = 0
    for y in range(H):
        for x in range(W):
            r, g, b, a = px[x, y]
            if a == 0:
                continue
            mn = min(r, g, b)
            mx = max(r, g, b)
            # neutral (not gold): low chroma
            chroma = (mx - mn) / 255.0
            if chroma <= sat_max and mn >= lo:
                w = (mn - lo) / float(hi - lo)
                w = max(0.0, min(1.0, w)) * max_kill
                na = int(a * (1.0 - w))
                if na != a:
                    px[x, y] = (r, g, b, na)
                    changed += 1
    im.save(path, optimize=True)
    print(f"  defringe {os.path.basename(path)}: {changed} px softened")


def recolor_arch_interior(path):
    im = Image.open(path).convert("RGBA")
    px = im.load()
    W, H = im.size
    # interior = low-saturation pixels in the middle band of the arch
    changed = 0
    cx, cy = W // 2, int(H * 0.46)
    for y in range(H):
        for x in range(W):
            r, g, b, a = px[x, y]
            if a == 0:
                continue
            mn, mx = min(r, g, b), max(r, g, b)
            chroma = (mx - mn) / 255.0
            val = mx / 255.0
            if chroma < 0.10 and 0.15 < val < 0.96:
                # vertical night gradient, warm glow near centre
                t = abs(y - cy) / float(H * 0.42)
                t = max(0.0, min(1.0, t))
                # deep onyx #12100B -> #262015 with candle glow at centre
                base = (int(0x12 + (0x26 - 0x12) * t),
                        int(0x10 + (0x20 - 0x10) * t),
                        int(0x0B + (0x15 - 0x0B) * t))
                # subtle vignette towards arch walls
                dx = (x - cx) / float(W * 0.30)
                dy = (y - cy) / float(H * 0.42)
                d = min(1.0, (dx * dx + dy * dy) ** 0.5)
                glow = max(0.0, 1.0 - d)
                rr = int(base[0] + glow * 26)
                gg = int(base[1] + glow * 20)
                bb = int(base[2] + glow * 10)
                px[x, y] = (rr, gg, bb, a)
                changed += 1
    im.save(path, optimize=True)
    print(f"  arch interior recoloured: {changed} px")


if __name__ == "__main__":
    print("sultan v3 asset repair")
    whiteness_defringe(os.path.join(ART, "shamsa-sultan.png"))
    whiteness_defringe(os.path.join(ART, "divider-sultan.png"))
    whiteness_defringe(os.path.join(ART, "tulip-sultan.png"))
    whiteness_defringe(os.path.join(ART, "seal-sultan.png"))
    whiteness_defringe(os.path.join(ART, "crescent-sultan.png"))
    recolor_arch_interior(os.path.join(ART, "arch-sultan.png"))
    print("done")
