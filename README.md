# The Human Quest — umabatra.com

Static website for Professor Uma Batra: the weekly newsletter *The Human
Quest* and her book *The Bhagavad Gita for Effortless Understanding*.

Rebuilt as hand-written HTML/CSS from the original Framer design, so the site
is dependency-free, fast, and hostable anywhere.

Design source: <https://olive-series-780689.framer.app/> — colours, type scale
and layout metrics were measured from that build. Note that only `/book` was
server-rendered there; the other pages existed only as client-rendered Framer
frames.

Live: <https://saurabhbatra96.github.io/the-human-engineer/>

## Pages

| File | Page |
| --- | --- |
| `index.html` | Home |
| `about.html` | About |
| `book.html` | The Book |
| `newsletter.html` | Newsletter (subscribe) |
| `styleguide.html` | The Manuscript theme, documented |
| `archives.html` | Archives — works + past issues |
| `issues/NNNN-slug.html` | One past newsletter edition |
| `issues/TEMPLATE.html` | Blank edition to copy |
| `connect.html` | Connect |
| `404.html` | Not found |
| `v1/` | The previous design, archived |

## Local preview

No build step. Open `index.html` directly, or serve the folder:

```sh
python3 -m http.server 8000
```

Then visit <http://localhost:8000>.

## The previous design, archived at /v1/

`v1/` is the site exactly as it stood at commit `2bbfbde`, the last one before
the Manuscript theme, served at
<https://saurabhbatra96.github.io/the-human-engineer/v1/>.

It carries its own copy of `assets/`, so it stays frozen no matter what
changes at the root — an archive that shared assets with the live site would
quietly drift. Its pages are `noindex`: a duplicate of the whole site would
otherwise compete with the live pages in search.

Regenerate it from the same commit with:

```sh
rm -rf v1 && mkdir v1 && git archive 2bbfbde | tar -x -C v1
rm -rf v1/.github v1/README.md v1/.gitignore v1/.nojekyll
```

then re-add the `noindex` meta to each page.

## Deployment

Pushing to `main` triggers `.github/workflows/deploy.yml`, which publishes the
repository root to GitHub Pages.

One-time setup: **Settings → Pages → Build and deployment → Source: GitHub
Actions**.

## Publishing a newsletter issue

1. Copy `issues/TEMPLATE.html` to `issues/NNNN-slug.html` (e.g.
   `issues/0002-tempering.html`) — number them in order, newest highest.
2. Fill in the title, `og:` tags, issue number, date, and the three 1–1–1
   sections, then delete the `noindex` meta line.
3. Add a matching row to the **Past issues** list in `archives.html`, newest
   first. The template comment in that file shows the exact markup.

Paths inside `issues/` are relative with `../` because the site is served from
a subpath on GitHub Pages — root-relative paths (`/assets/...`) would escape
to the wrong site.

## Adding a work to the Archives

`archives.html` has a **Works** list with a commented-out `.archive-item`
block. Copy it into the list, newest first, and fill in the meta line, title
and description. Remove the `.archive-empty` placeholder paragraph once the
first entry is in.

## Images

Web images live in `assets/img/` as PNGs. Print-resolution sources (`.tif`)
are gitignored — regenerate the cover with ImageMagick after a new source
arrives:

```sh
convert "COVER.tif" -resize 1400x -shave 9x8 -strip -colors 192 \
  -define png:compression-level=9 assets/img/book-cover.png
```

Update the `width`/`height` attributes on the `<img>` in `book.html` to match
the new dimensions.

## The Manuscript theme

The site is set as an illuminated manuscript leaf: gold-ruled panels, flat
perspective, painted margins. `assets/css/manuscript.css` holds the whole
design, and `styleguide.html` documents it — palette, type scale, ornament,
the anatomy of a ruled panel, and the rules the design holds to.

The theme keeps the same class names as `assets/css/style.css`, the earlier
design, which is still in the repository. Switching back is one link per page:

```html
<link rel="stylesheet" href="assets/css/style.css">
```

All ornament — the margin vine, the lotus rules, the corner florets, the journey
headpiece — is CSS background art built from inline SVG. There are no image
requests for any of it.

## Illustrations

Nine watercolour plates from the Gita: five tall margin plates, one wide
register plate, three circular spots. They live in
`assets/img/illustrations/`, **named by slot** — the filename is the only
wiring, so replacing a file replaces the art.

The originals as generated are kept in `assets/midjourney-assets/`; the web
versions are derived from them. Prompts, per-plate saturation and crops are in
`assets/img/illustrations/PROMPTS.md`, which also explains why this step is
manual: Midjourney has no official API, and the third-party "Midjourney API"
services break its terms of service.

To replace a plate, generate it and re-import:

```sh
tools/prepare-illustration.sh ~/Downloads/lamp.png margin-lamp
```

That sizes the export for its slot, desaturates it to the page's level, and
lifts the white point so the theme's `mix-blend-mode: multiply` drops the
paper cleanly. Pass a saturation percent as a third argument to push a loud
plate further back, or turn `--plate-mute` down in `assets/css/manuscript.css`
to quieten every plate at once — the art sits beside running text and must
never compete with it.

A page hangs plates in its margins with two rules in its head:

```html
<style>
  main::before { background-image: url(assets/img/illustrations/margin-chariot.jpg) }
  main::after  { background-image: url(assets/img/illustrations/margin-lamp.jpg) }
</style>
```

Write the URL into the rule, not into a custom property: a relative `url()`
inside a custom property resolves against a different base in Chrome than the
spec calls for, so the same declaration points at different files depending on
how deep the page sits.

## Wiring up the subscribe form

GitHub Pages serves static files only, so there is no server to receive form
posts. Until a provider is connected, the form opens a pre-filled email to
`info@umabatra.com` — functional, but manual.

To connect a real provider (Buttondown, ConvertKit, Mailchimp, Formspree,
Substack…), set the endpoint near the top of `assets/js/main.js`:

```js
var SUBSCRIBE_ENDPOINT = "https://buttondown.email/api/emails/embed-subscribe/USERNAME";
```

The form then posts to that URL directly and the mailto fallback switches off.

## Design tokens

Defined once as CSS custom properties in `assets/css/style.css`:

| Token | Value | Use |
| --- | --- | --- |
| `--cream` | `#FBF5E9` | Page and header background |
| `--tan` | `#F2E3C8` | Feature bands |
| `--dark` | `#231B14` | Dark bands, footer, body text |
| `--terracotta` | `#A94B23` | Buttons, eyebrows, accents |
| `--amber` | `#E89B16` | Book cover card, eyebrow on dark |
| `--border` | `#D9C8AB` | Hairlines and card borders |

Type: **EB Garamond** (headings, quotes) and **Source Sans 3** (body, UI),
loaded from Google Fonts.

## Custom domain

Add a `CNAME` file containing the bare domain, then point DNS at GitHub:

```
umabatra.com
```
