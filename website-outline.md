# M2C2 Website — Draft Outline

Draft content outline for the Multi-Method Conflict Consortium (M2C2) static website,
based on the assets in this folder (founding proposal, intro decks, workshop programs,
Junior Fellow CFPs, final report, and design files).

**Aesthetic direction:** simple, minimalistic, informative. Brand colors from the logo
(`source/design/`): dark navy (~#1B2A41), periwinkle/purple (~#8275F6), white. Light and
dark logo variants available. Logo motif: circular "swirl" of interlocking arcs/dots.

**Privacy rule:** no personal details on the site (no home addresses, phone numbers,
passwords, or non-public attendee info). Workshop program files are **not** published
for now; past workshops appear as brief summaries only.

---

## Site structure

```
Home  |  Workshops  |  Network (▾ Organizers · Participants · Junior Fellows)
```

---

## 1. Home

Kept deliberately simple: logo, mission, goals. No timeline, no news feed.

**Hero:** M2C2 logo + tagline.

> *A diverse community of scholars at all career stages, drawing on a range of methods
> and approaches to produce cutting-edge, policy-relevant research on political violence.*
> (from Michigan 2024 intro deck)

**Mission** (sources: founding proposal, CFPs, intro decks)

- Research on conflict and political violence is methodologically diverse, but research
  communities are siloed — in professional networks, training and socialization,
  knowledge accumulation, and professional advocacy.
- M2C2 bridges quantitative, qualitative, and mixed-methods conflict researchers at all
  career stages and from around the globe.
- A core objective: encourage scholars to learn from diverse approaches to conflict
  research, even if their own work is not multi-method.

**Goals**

1. **Integrate professional networks** — regular in-person conferences and workshops
   convening scholars from different methodological traditions.
2. **Promote mixed-methods collaboration and mentorship** — co-authorship connections,
   the Junior Fellows program, student training.
3. **Encourage cross-method research ethics** — apply ethical research practices across
   methodological traditions.
4. **Policy engagement and professional advocacy** — translate research for policymakers
   and advocate for discipline-wide policies (journals, conferences) that foster
   cross-method engagement.

**Footer:** contact emails for the organizers; host-institution / sponsor
acknowledgements.

---

## 2. Workshops

**Intro paragraph:** M2C2 convenes regular workshops and mini-conferences hosted at the
organizers' home institutions, structured around senior panels and junior read-ahead
feedback sessions.

### 2a. Call for Proposals (currently inactive)

- Placeholder text: "The call for proposals for the next M2C2 workshop is not yet open."
- When active, follows the CFP template (see `source/about/M2C2 Junior CFP - Duke.pdf`):
  overview, eligibility (scholars not yet in tenure-track positions; advanced grad
  students and postdocs), submission guidelines (working papers on political violence
  and conflict; single-method submissions welcome), deadline + submission form link,
  travel funding/honorarium details.

### 2b. Past Workshops

Brief summaries only — **no program PDFs/docs published** (they contain personal
details). Each entry: year, host, one- to two-sentence description.

- **2026 — Duke University (May 15–16).** Mini-conference co-sponsored by Duke Law
  School, TISS, Duke Political Science, and the Duke Program in American Grand Strategy.
  Eight thematic panels spanning rebel governance, repression, protest, post-war
  rebuilding, and qualitative methods & AI; five Junior Fellows presented.
- **2025 — Florida State University (Mar 20–22).** Mini-conference with 49 attendees
  (22 external, from North America and Europe). Four thematic panels plus six
  presentations by the inaugural Junior Fellows class.
- **2024 — University of Michigan (May 9–11).** Workshop hosted by the International
  Policy Center, Ford School of Public Policy, featuring seven senior research
  presentations.
- **2022 — Peace Science Society, Denver (Nov 3).** Founding workshop, "Building a
  Multi-Method Conflict Research Consortium": group sessions on the consortium's goals
  and obstacles to cross-method engagement, plus three paper sessions.

---

## 3. Network

Three sub-tabs. Participant and fellow listings are rendered from the static database
(`data/participants.csv` — see Data section below), so the lists are managed in one
place rather than hard-coded in HTML.

### 3a. Organizers

Short bios, photos, emails:

- **Dotan Haim** — Assistant Professor of Political Science, Florida State University (dhaim@fsu.edu)
- **Megan Stewart** — Associate Professor of Public Policy, University of Michigan (mgnstwrt@umich.edu)
- **Mara Revkin** — Associate Professor of Law and Political Science, Duke University (revkin@law.duke.edu)

### 3b. Participants

Alphabetical list of past participants (name, institution, events attended), generated
from the database. Initially includes organizers, senior presenters, discussants, and
chairs from the four workshops; rows can be hidden via the `display` flag pending
consent.

### 3c. Junior Fellows

**Program description** (from CFPs): each workshop selects a class of M2C2 Junior
Fellows — scholars not yet in tenure-track positions. Fellows receive:

1. **Read-ahead feedback session** — in-depth small-group discussion of their paper.
2. **Mentorship program** — one-on-one meetings with mentors plus a year of virtual
   peer-mentorship and professionalization sessions.
3. **Future M2C2 programming** — standing invitation to future consortium events.

**Cohorts** (from the database, `role = fellow`, grouped by `cohort`):

- **2026 (Duke):** Beenish Riaz (Columbia), Stephen Rangazas (Dartmouth), Timothy Jones
  (Duke), Nguyen Ha (Vanderbilt), Martín Macías-Medellín (Michigan)
- **2025 (FSU, inaugural class):** Elena Barham (Mannheim), Adee Weller (Emory),
  Ana Paula Pellegrino (Georgetown), Finn Klebe (UCL), Jiyoung Kim (UCLA),
  Gilad Wenig (UCLA)

---

## Data: static participant database

Single source of truth: **`data/participants.csv`** (easy to edit in Excel/R).
**Build step:** after editing the CSV, run `python build.py` — it regenerates the
participants table and fellow cohort lists inside `network.html` (between the
`BEGIN/END` marker comments). The site is fully static; no JavaScript data loading.

| Column | Meaning |
|--------|---------|
| `name` | Full name |
| `institution` | Current affiliation |
| `role` | `organizer` \| `senior` \| `fellow` |
| `events` | Semicolon-separated list (`PSS 2022; Michigan 2024; FSU 2025; Duke 2026`) |
| `cohort` | Fellow cohort year (blank for non-fellows) |
| `website` | Optional personal/faculty URL |
| `display` | `TRUE`/`FALSE` — only `TRUE` rows are shown on the site |

Seeded with organizers, senior scholars, and fellows from the four programs. General
attendees (e.g., the FSU 2025 audience list) are *not* seeded; add them later with
`display=FALSE` until consent is confirmed.

---

## Supporting / footer content

- **Sponsors & acknowledgements:** COSSPP (FSU), International Policy Center & Ford
  School (Michigan), Duke Law School, TISS, Duke Political Science, Duke Program in
  American Grand Strategy, Peace Science Society.
- **Design assets:** light logo (`source/design/M2C2 FSU - A1 (poster).jpg`), dark variant
  (`source/design/M2C2 FSU - A4 (flyer).jpg`). A standalone logo file (SVG/PNG without event
  text) would be useful — request from designer if available.

---

## Open questions for the organizers

1. Is there a standalone logo file? (The JPGs are event posters.)
2. Confirm listed participants are OK appearing on the Network page (flip `display`
   per row as needed).
3. Should the site mention longer-term plans (annual conference, seed grants, syllabus
   bank, policy engagement) from the founding proposal, or stick to established
   activities?
