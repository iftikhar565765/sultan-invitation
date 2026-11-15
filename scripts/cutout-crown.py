#!/usr/bin/env python3
"""Mumtaz — premium cutouts for the crown/niche replacement art.

Border flood-fill background removal (keeps interior marble highlights fully
opaque), optional interior-keying for enclosed white regions (hero arch
opening), edge feathering and white-unmixing. Output straight to assets/art.
"""
import numpy as np
from PIL import Image
from scipy import ndimage
import os

RAW = "/home/z/my-project/mumtaz-invitation/_raw-art"
OUT = "/home/z/my-project/mumtaz-invitation/assets/art"


def dist_from_white(rgb):
    return np.sqrt(((1.0 - rgb) ** 2).sum(axis=2)) / np.sqrt(3)


def cutout(name, t_bg=0.030, interior_key=False, t_int=0.10, feather=1.1,
           unmix=True, maxdim=None):
    img = Image.open(os.path.join(RAW, name + ".png")).convert("RGB")
    rgb = np.asarray(img).astype(np.float32) / 255.0
    d = dist_from_white(rgb)

    # background = near-white AND connected to the image border
    bg_candidate = d < t_bg
    seed = np.zeros_like(bg_candidate)
    seed[0, :] = seed[-1, :] = seed[:, 0] = seed[:, -1] = True
    outside = bg_candidate & ndimage.binary_propagation(seed, mask=bg_candidate)

    a = np.where(outside, 0.0, 1.0)

    if interior_key:
        # enclosed near-white regions (the arch opening) fade out
        solid = a > 0.5
        holes = ndimage.binary_fill_holes(solid) & ~solid
        ramp = np.clip((d - t_int) / (0.30 - t_int), 0, 1)
        a = np.where(holes, ramp, a)

    # soft feather on the silhouette
    a = ndimage.gaussian_filter(a, feather)
    a = np.clip(a, 0, 1)

    if unmix:
        af = np.maximum(a, 1e-4)[..., None]
        rgb_out = np.clip((rgb - (1.0 - a[..., None]) * 1.0) / af, 0, 1)
    else:
        rgb_out = rgb

    rgba = np.dstack([(rgb_out * 255).astype(np.uint8),
                      (a * 255).astype(np.uint8)]).astype(np.uint8)
    im = Image.fromarray(rgba, "RGBA")
    bbox = im.getchannel("A").point(lambda v: 255 if v > 8 else 0).getbbox()
    if bbox:
        im = im.crop(bbox)
    w, h = im.size
    if maxdim and max(w, h) > maxdim:
        s = maxdim / max(w, h)
        im = im.resize((round(w * s), round(h * s)), Image.LANCZOS)
    path = os.path.join(OUT, name + ".png")
    im.save(path, "PNG", optimize=True)
    print(f"{name}: {im.size[0]}x{im.size[1]} -> {os.path.getsize(path)//1024}KB")


if __name__ == "__main__":
    # hero crown: interior of the arch keys out (card paper + CSS dawn behind)
    cutout("pishtaq-crown", t_bg=0.028, interior_key=True, t_int=0.10)
    # closing niche: everything inside stays opaque (it sits on the dark night)
    cutout("closing-niche", t_bg=0.028, interior_key=False)
