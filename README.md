# The Human Engineer — umabatra.com

Static website for Professor Uma Batra: the weekly newsletter *The Human
Engineer* and her book *The Bhagavad Gita for Effortless Understanding*.

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
| `newsletter.html` | Newsletter |
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
