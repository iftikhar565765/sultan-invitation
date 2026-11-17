from PIL import Image
import os, glob
files = sorted(glob.glob('assets/art/*.png'))
# contact sheet on 2 backgrounds: white + dark
W = 300
rows = len(files)
sheet = Image.new('RGB', (W*2+40, rows*280+20), (40,36,30))
from PIL import ImageDraw
d = ImageDraw.Draw(sheet)
for i,f in enumerate(files):
    im = Image.open(f).convert('RGBA')
    a = im.getchannel('A')
    # stats
    bbox = a.getbbox()
    # white bg check: sample corners of opaque area
    opaque = sum(1 for p in a.getdata() if p > 240)
    total = im.width*im.height
    ext = os.path.basename(f)
    # render on dark and on white
    for j,bg in enumerate([(255,255,255),(20,16,12)]):
        tile = Image.new('RGBA', im.size, bg+(255,))
        tile.alpha_composite(im)
        tile.thumbnail((W,260))
        x = j*(W+10)+10; y = i*280+16
        sheet.paste(tile.convert('RGB'), (x,y))
    d.text((6, i*280+2), f"{ext} {im.width}x{im.height} opaque={opaque*100//total}% bbox={bbox}", fill=(255,220,120))
sheet.save('/home/z/my-project/qa/sultan3/art-audit.png')
print('saved', sheet.size)
for f in files:
    im = Image.open(f).convert('RGBA')
    a = im.getchannel('A')
    opaque = sum(1 for p in a.getdata() if p > 240); total = im.width*im.height
    print(f"{os.path.basename(f):24s} {im.width}x{im.height}  opaque={opaque*100//total}%")
