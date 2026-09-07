# M2C2 Website — Maintainer Instructions

How to edit and publish the M2C2 website. The site is fully static — plain HTML, CSS,
and one small build script. No frameworks, no dependencies beyond Python.

## Project layout

```
index.html          Home (mission + goals)
workshops.html      Workshops (CFP + past workshops)
network.html        Network (Organizers / Participants / Junior Fellows tabs)
css/style.css       Theme (colors, fonts, layout)
js/site.js          Tab switching on the Network page (nothing else)
css/fonts.css       @font-face rules for the self-hosted fonts in assets/fonts/
404.html · robots.txt · .nojekyll   Hosting extras (copied by package.sh)
package.sh          Builds dist/ + a dated zip of just the deployable files
data/participants.csv   Participant database — single source of truth for people
build.py            Bakes the CSV into network.html
assets/             Logo mark, full logo, favicon
assets/people/      Headshots (organizers + fellows), square JPGs ~480px
programs/           Public workshop programs (PDF), linked from workshops.html
source/             Original documents (posters, proposals, CFPs, programs) —
                    NOT version-controlled, lives in Dropbox only
```

## Editing page text

Edit the HTML files directly — what's in the file is what's on the page.

| Content | Where |
|---------|-------|
| Tagline, mission, goal cards | `index.html` |
| CFP notice + guidelines | `workshops.html` (the `<div class="notice">` box) |
| Past workshop summaries | `workshops.html` (each `<li>` in the timeline) |
| Organizer cards | `network.html` |
| Junior Fellows program description | `network.html` |
| Contact emails / sponsors (footer) | **All three** HTML files — keep them in sync |

⚠️ In `network.html`, do **not** hand-edit anything between the
`<!-- BEGIN:... -->` / `<!-- END:... -->` marker comments — the build script
overwrites those blocks.

## Managing the participant list

All people (participants and junior fellows) live in `data/participants.csv`:

| Column | Meaning |
|--------|---------|
| `name` | Full name |
| `institution` | Current affiliation |
| `role` | `organizer`, `senior`, or `fellow` |
| `events` | Semicolon-separated, e.g. `FSU 2025; Duke 2026` |
| `cohort` | Fellow cohort year (blank for non-fellows) |
| `current` | Fellows only: current affiliation shown on the card (`institution` = affiliation at the time of the fellowship, shown as a second line) |
| `website` | Optional URL — if filled, the name becomes a link |
| `photo` | Optional filename in `assets/people/` (fellows only; blank = initials circle) |
| `display` | `TRUE` to show on the site, `FALSE` to hide |

**Workflow:**

```
1. Edit data/participants.csv  (Excel, R, or any text editor)
2. Run:  python build.py
3. Commit both the CSV and network.html
```

`build.py` regenerates the Participants table (senior scholars only, name and
institution) and the fellow cohort cards (photo, linked name, institution) inside
`network.html`. It sorts by surname, groups fellows by cohort (newest first), and
skips any row with `display=FALSE`. Organizers are hand-written cards in `network.html`. If you edit the CSV but forget to run the build,
the site keeps showing the old list.

**Privacy rule:** only list people who appeared in public-facing roles (organizers,
presenters, discussants, chairs, fellows). No home addresses, phone numbers, or
non-public attendee info anywhere on the site. The programs in `programs/` are
public versions (sessions, papers, authors, chairs, discussants only; no hotels,
venues, meals, paper links, or attendee lists). The originals in `source/programs/`
are never published. To hide someone pending consent, set their `display` to `FALSE`.

## Previewing locally

Everything works by double-clicking the HTML files. For a proper local server:

```
python -m http.server 8765
```

then open http://localhost:8765.

## Theme

Brand colors (sampled from the logo) are defined once at the top of `css/style.css`:

```css
--navy:   #192943;   /* primary text, footer */
--purple: #866AFB;   /* accent, links, highlights */
```

Headings use Poppins, body text uses Inter (loaded from Google Fonts; the site falls
back to system fonts offline). Logo assets in `assets/` were cropped from the poster
JPG in `source/design/` — if a proper standalone logo file (SVG/PNG) becomes
available, replace `assets/m2c2-mark.png` and `assets/m2c2-logo.png`.

## Version control

The project is a git repository (branch `master`). After making changes:

```
git add -A
git commit -m "Describe what changed"
```

Conventions:

- After editing `data/participants.csv`, run `python build.py` **before** committing,
  and commit the CSV and `network.html` together.
- `claude.md` has a Directory section that should be kept up to date as files are
  added or removed.
- `.gitignore` excludes OS junk (`desktop.ini`), Python caches, local tooling
  (`.claude/`), and the entire `source/` folder.
- The `source/` folder (original documents — proposals, CFPs, decks, workshop
  programs, poster JPGs) is **deliberately untracked**: some files contain personal
  details, and git history was scrubbed of them. They live in Dropbox only — never
  commit them, and never publish them with the site.

## Deploying

The site is static, so any static host works as-is (GitHub Pages, Netlify, university
hosting). Run `./package.sh`: it rebuilds `network.html`, copies only the deployable
files into `dist/` (the four HTML pages, `css/`, `js/`, `assets/`, `programs/`,
`robots.txt`, `.nojekyll`) and zips them as `m2c2-site-<date>.zip`. Upload the contents
of `dist/` (or unzip the archive) to the host's web root. Nothing else is needed: fonts are
self-hosted in `assets/fonts/` (no Google Fonts call at runtime), all paths are relative,
and `404.html` is the not-found page (most hosts pick it up by name; GitHub Pages does).
The `source/` folder, `data/`, `build.py` and the docs never go up.

Preview while unhosted: https://dhaim2.github.io/m2c2-website/ (GitHub Pages from this repo).

## Reactivating the Call for Proposals

When the next CFP opens, edit the notice box in `workshops.html`: replace the
"not yet open" text with the event dates, eligibility, deadline, and submission form
link. The CFP template language is in `website-outline.md` (section 2a) and the past
CFP PDFs in `source/about/`.
