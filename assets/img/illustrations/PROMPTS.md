# Illustration prompts — The Human Quest

Nine watercolour plates from the Gita, generated in the Midjourney web app and
dropped into this folder. **The filename is the contract**: save each one at the
name in its heading and the theme picks it up with no code change.

Every prompt below is complete — copy one, paste it, generate. The style clause is
identical in all nine on purpose: consistency across the set matters more than any
single image, because one plate in a different style reads as a mistake on the page.

The `.jpg` files here are the paintings the site is running, imported from the
originals kept in `assets/midjourney-assets/`. To replace one, generate a new
painting and re-run the import with the same slot name.

## Muted on purpose

These plates sit beside running text, so they are painted quiet: low saturation,
dusty pigment, plenty of bare paper. Regal comes from the gold rules and the
typography, not from the colour of the art. Anything bright enough to pull the eye
off a paragraph is wrong for this page, however good it looks on its own.

The muting is enforced three times over, so no single step has to be perfect:
in the prompt, again in `tools/prepare-illustration.sh` (which desaturates and
lifts the whites on import), and again in the theme, which renders every plate
through `filter: saturate()`. If a plate still shouts on the page, turn
`--plate-mute` down in `assets/css/manuscript.css` rather than re-generating.

## Two rules that decide whether a plate works

- **Keep the ground pale.** The page composites each plate with
  `mix-blend-mode: multiply`, so white paper in the image disappears into the paper
  of the leaf and only the pigment lands. A plate with a dark or busy background
  becomes a grey rectangle sitting on the page.
- **Keep the subject small.** The bare paper is what lets the plate dissolve into
  the margin. A subject that fills the frame gets clipped by the mask.

If a result comes back dark or crowded, re-roll it rather than trying to rescue it
— the blend is unforgiving.

## Locking the style across the set

Generate `margin-lamp` first. Once you have one you like, copy its image URL and
append `--sref <that url>` to the other eight prompts. That carries the palette and
brush quality across the set far more reliably than the words alone do.

Append your usual `--v` flag to every prompt if you do not want the default.

---

## Margin plates — tall, hung in the outer margins

### `margin-chariot.jpg` · Gita 1.21, *“Place my chariot between the two armies”*

```
A chariot drawn by four pale horses seen from behind, a charioteer standing at the reins beside a warrior, viewed from far off across an empty plain in soft early light, the whole scene small and low in the frame with bare pale paper filling the space above, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:3 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `margin-lamp.jpg` · Gita 6.19, *“As a lamp in a windless place does not flicker”*

```
A single clay oil lamp burning with one perfectly still upright flame, standing alone on a bare surface with the faintest warm glow around the flame, small in a tall narrow composition of mostly bare paper, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:3 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `margin-lotus.jpg` · Gita 5.10, *“As a lotus leaf is untouched by water”*

```
A single lotus stem rising out of still water, one open flower and one broad leaf holding beads of water that will not wet it, the water suggested by two or three pale horizontal washes at the base, tall narrow composition with bare paper above, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:3 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `margin-banyan.jpg` · Gita 15.1, *“Roots above, branches below”*

```
An inverted banyan tree with its roots spreading upward into the sky and its branches reaching downward, the roots painted as fine dry brushwork against bare paper, tall narrow composition, the tree small enough that bare paper surrounds it, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:3 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `margin-conch.jpg` · Gita 1.15, *“Krishna blew Panchajanya”*

```
A single large conch shell resting alone on bare paper, its spiral turned toward the viewer, painted in soft greyed ochre and chalky shell white with one faint cool shadow beneath it, small in a tall narrow composition of mostly bare paper, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:3 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

---

## Register plate — one wide painting, gold-mounted across the page

### `band-kurukshetra.jpg` · Gita 1.21, *“Between the two armies”*

```
A wide empty plain in soft early light with two distant armies drawn up facing each other along the horizon and a single chariot halted in the gap between them, everything small and far away, most of the picture pale sky and bare ground, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 16:5 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

---

## Spot paintings — circular, at the head of the three home cards

Each is masked to a circle, so the subject has to sit dead centre.

### `spot-flame.jpg` · pairs with **One Gita Insight**

```
A single still upright flame centred on bare paper with nothing else in frame, the faintest warm glow around it, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:1 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `spot-crucible.jpg` · pairs with **One Engineering Reflection**

The one plate that is hers rather than the Gita’s, and it earns its place.

```
A small crucible tilted to pour a thin thread of molten metal, centred on bare paper with nothing else in frame, the metal a soft muted saffron against the pale ground, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:1 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

### `spot-lotus.jpg` · pairs with **One Mental Lens**

```
A single open lotus flower seen from directly above, centred on bare paper with nothing else in frame, petals in dusty rose and pale saffron with a greyed blue centre, painted in soft watercolour on cold-pressed handmade paper, visible brush strokes and wash edges, pigment settling into the paper grain, a muted low-saturation palette of dusty saffron, faded vermilion, greyed lapis blue, pale gold ochre and soft malachite on warm ivory, colours quiet and restrained like an antique painting softened with age, regal but never bright, large areas of bare paper, no ink outlines, edges dissolving into the paper, the loose sensibility of a Pahari miniature --ar 1:1 --style raw --stylize 120 --no text, letters, calligraphy, frame, border, watermark, signature, dark background, black outlines, photo, photorealistic, 3d render, digital airbrush, neon, high saturation, heavy contrast, vivid colours
```

---

## How the current set was imported

Saturation and crop are recorded per plate so the import is reproducible. The
crop matters for spots: they are masked to a small circle, so a subject painted
small on a large sheet arrives as a smudge in a field of blank paper.

```sh
A=assets/midjourney-assets
tools/prepare-illustration.sh $A/margin-chariot.png   margin-chariot   80
tools/prepare-illustration.sh $A/margin-lamp.png      margin-lamp      80
tools/prepare-illustration.sh $A/margin-conch.png     margin-conch     80
tools/prepare-illustration.sh $A/band-kurukshetra.png band-kurukshetra 80
tools/prepare-illustration.sh $A/margin-banyan.png    margin-banyan    58
tools/prepare-illustration.sh $A/margin-lotus.png     margin-lotus     58
tools/prepare-illustration.sh $A/spot-flame.png    spot-flame    80 '46%x46%+27%+28%'
tools/prepare-illustration.sh $A/spot-crucible.png spot-crucible 80 '68%x68%+24%+18%'
tools/prepare-illustration.sh $A/spot-lotus.png    spot-lotus    58 '86%x86%+7%+7%'
```

The banyan and the two lotuses came back stronger than the rest of the set and
fill their sheets, so they are pushed to 58% saturation rather than 80% — the
plates have to sit behind the text, and a plate that fills its frame carries
more colour onto the page than one painted small.

## After generating

Upscale, download, then run each one through the import script. It sizes the export
for its slot, desaturates it to the page's level, and flattens the paper to true
white so the multiply blend is clean:

```sh
tools/prepare-illustration.sh ~/Downloads/uma_a_single_clay_oil_lamp.png margin-lamp
```

Pass a saturation percentage as a third argument to override the default 80:

```sh
tools/prepare-illustration.sh ~/Downloads/lamp.png margin-lamp 65   # quieter still
```

A fourth argument crops before resizing, as percentages of the source:

```sh
tools/prepare-illustration.sh ~/Downloads/flame.png spot-flame 80 '46%x46%+27%+28%'
```

Then reload the page. No CSS or HTML changes needed — the filename is the only
wiring.
