# The Human Quests — umabatra.com

Static website for Professor Uma Batra: the weekly newsletter *The Human
Quests* and her book *The Bhagavad Gita for Effortless Understanding*.

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
| `archives.html` | Archives — works + past issues |
| `issues/NNNN-slug.html` | One past newsletter edition |
| `issues/TEMPLATE.html` | Blank edition to copy |
| `connect.html` | Connect |
| `404.html` | Not found |

## Local preview

No build step. Open `index.html` directly, or serve the folder:

```sh
python3 -m http.server 8000
```

Then visit <http://localhost:8000>.

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
