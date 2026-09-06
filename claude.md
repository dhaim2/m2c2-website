# Project Description

Aesthetic direction: the design of the website should be simple, minimalistic, but informative. 

# Content

The website will have the following pages. 

1. A "Home" page that describes the M2C2 initiative. 

2. A "Members" or "Network" page that has details on past participants; also include a sub-tab for key organizers. 

3. A "Workshop" page that includes 1) a "Call for Proposals" for the next workshop (currently inactive); 2) a 

# Directory

Claude will update the project directory here after every commit. 

```
index.html              Home — mission + goals
workshops.html          Workshops — CFP (inactive) + past workshops list
network.html            Network — Organizers / Participants / Junior Fellows tabs
css/style.css           Theme (brand colors from logo: navy #192943, purple #866AFB)
js/site.js              Tab switching on the Network page
data/participants.csv   Participant database (single source of truth for people)
build.py                Bakes the CSV into network.html (run after CSV edits)
assets/                 Logo mark, full logo, favicon (cropped from design JPGs)
source/                 Original documents (design JPGs, proposals, CFPs, decks,
                        workshop programs) — UNTRACKED, Dropbox only, never publish
instructions.md         Maintainer guide (editing + build + deploy workflow)
website-outline.md      Content outline / planning document
```

# Rules for Claude