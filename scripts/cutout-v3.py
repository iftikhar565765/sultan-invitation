#!/usr/bin/env python3
"""Sultan v3 — cut out the newly generated black-background assets.

Edge flood-fill on a dark key (bg is pure/near black), then enclosed
near-black pockets larger than a threshold are removed too (keeps fine
engraving lines, drops trapped background), gentle edge feathering,
FASTOCTREE 256-colour compression. Outputs into assets/art/.
"""

from PIL import Image
import os
from collections import deque

RAW = os.path.join(os.path.dirname(__file__), "..", "_raw-art")
ART = os.path.join(os.path.dirname(__file__), "..", "assets", "art")


def is_bg(px, tol=62):
    r, g, b = px
    mx, mn = max(r, g, b), min(r, g, b)
    return mx < tol and (mx - mn) < tol


def cutout_dark(name, out_name, pocket_min=600, feather=1):
    src = os.path.join(RAW, name)
    dst = os.path.join(ART, out_name)
    im = Image.open(src).convert("RGBA")
    W, H = im.size
    px = im.load()

    # 1. flood-fill background from the border
    bg = bytearray(W * H)
    q = deque()
    for x in range(W):
        for y in (0, H - 1):
            if is_bg(px[x, y][:3]) and not bg[y * W + x]:
                bg[y * W + x] = 1; q.append((x, y))
    for y in range(H):
        for x in (0, W - 1):
            if is_bg(px[x, y][:3]) and not bg[y * W + x]:
                bg[y * W + x] = 1; q.append((x, y))
    while q:
        x, y = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < W and 0 <= ny < H and not bg[ny * W + nx]:
                if is_bg(px[nx, ny][:3]):
                    bg[ny * W + nx] = 1
                    q.append((nx, ny))

    # 2. enclosed near-black pockets — remove only large ones
    seen = bytearray(W * H)
    for start in range(W * H):
        if bg[start] or seen[start]:
            continue
        r, g, b, _ = px[start % W, start // W]
        if not is_bg((r, g, b)):
            continue
        # BFS this pocket
        comp = []
        q = deque([start])
        seen[start] = 1
        while q:
            idx = q.popleft()
            comp.append(idx)
            x, y = idx % W, idx // W
            for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nx, ny = x + dx, y + dy
                if 0 <= nx < W and 0 <= ny < H:
                    nidx = ny * W + nx
                    if not seen[nidx] and not bg[nidx]:
                        rr, gg, bb, _ = px[nx, ny]
                        if is_bg((rr, gg, bb)):
                            seen[nidx] = 1
                            q.append(nidx)
        if len(comp) >= pocket_min:
            for idx in comp:
                bg[idx] = 1

    # 3. apply alpha + feather
    for y in range(H):
        for x in range(W):
            idx = y * W + x
            r, g, b, a = px[x, y]
            if bg[idx]:
                px[x, y] = (r, g, b, 0)
            elif a and feather:
                # soften: if most 4-neighbours are bg, halve alpha
                nb = 0
                for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    nx, ny = x + dx, y + dy
                    if 0 <= nx < W and 0 <= ny < H and bg[ny * W + nx]:
                        nb += 1
                if nb >= 2:
                    px[x, y] = (r, g, b, a // 2)

    # 4. crop to content and quantize
    bbox = im.getchannel("A").getbbox()
    if bbox:
        im = im.crop(bbox)
    im = im.quantize(256, method=Image.FASTOCTREE)
    im.save(dst, optimize=True)
    print(f"  {name} -> {out_name} {im.size}, {os.path.getsize(dst)//1024} KB")


if __name__ == "__main__":
    print("sultan v3 cutouts")
    cutout_dark("shamsa-raw.png", "shamsa-sultan.png", pocket_min=700)
    cutout_dark("dome-raw.png", "dome-sultan.png", pocket_min=400)
    cutout_dark("flourish-raw.png", "flourish-sultan.png", pocket_min=500)
    print("done")
