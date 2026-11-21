---
name: confluence-page-design
description: Design and write beautiful, scannable, UX-optimized Confluence Cloud pages using K15t's "Rock the Docs" best practices — purpose-first title, summary panel, a one-column header that is just the summary panel, sensible widths and columns, restrained formatting, visual anchors, panels, status lozenges and expands. Use this skill whenever the user wants to create, draft, restructure, prettify, or polish a Confluence page or wiki page — especially a PRD, technical spec or plan, ADR, RFC/decision page or meeting notes, including ones that need an architecture or flow diagram embedded from a Confluence whiteboard — even if they just say "put this in Confluence", "make this page look nicer", or paste content and name a space. Also use when turning a Markdown doc, README or notes into a Confluence page.
---

# Confluence page design

Readers give a page about 15 seconds. They stay in the top half, scan down the left edge, and read about 20% of the words. Every rule below follows from that: **the top of the page must say why the page exists and what the reader gets, and the rest must be skimmable.** When a rule here conflicts with that goal, the goal wins.

## Workflow

1. **Pin down purpose and reader.** One sentence: "This page helps <reader> to <do/decide/know> <thing>." If you can't write it from what the user gave you, ask — it drives the title, summary and layout. Also note the page type (see `references/page-patterns.md`) and the target space/parent.
2. **Load the platform rules.** With the Atlassian MCP connected, call `executeRead` → `getContentFormatGuide` with `{toolName: "createConfluencePage"}` (or `updateConfluencePage` for edits) once per task, and fetch the space's instructions with `getConfluenceSpace` as the create tool describes. Confluence HTML is *not* standard HTML; the guide is the source of truth and overrides the cheat sheet in `references/html-cheatsheet.md` if they disagree. Apply space instructions to the whole page.
3. **Plan the page skeleton** before writing prose (sections below): title, emoji, summary, sections, visuals, highlights.
4. **Write the body** in Confluence HTML.
5. **Run the review checklist** at the bottom and fix anything that fails.
6. **Publish or hand over.** Pass `contentWidth: "wide"` on create (see §2). Creating a page is outward-facing: confirm space/parent and whether to publish or save as a draft (`draft: true`) unless the user already said. Don't pass `private: true` unless the user asks for a restricted page — it can fail with `permission_denied` ("Caller lacks write permission on the parent") even in the user's own personal space; if a create fails that way, check whether `private` was set before blaming scopes. Before retrying a failed create, keep the real body (never retry with a throwaway test body that would publish if it succeeds). If the MCP isn't available, save the HTML body to a file and tell the user. Afterwards, tell the user the page emoji you'd pick (the API can't set it) and, if useful, a header image.

## 1. Above the fold — purpose first

This is the part most readers actually see, so spend the most care here.

- **Title**: specific and searchable — the subject plus the context that tells it apart. "Checkout API — rate limits and retry policy", not "API notes". "2026-11-21 Pricing sync — decisions", not "Important meeting". No emoji in the title text (it hurts search); emoji belongs in the page-emoji slot.
- **Page emoji / header image**: pick one emoji that signals purpose (🎯 PRD, 🧩 tech spec, 🏛️ ADR, 🗳️ RFC/decision, 📝 meeting notes, 📘 anything else). Suggest a header image only if it actually conveys the point — no decorative images.
- **Summary**: the first block is a short info panel (2–4 sentences, or 3 bullets) saying what this page is, who it's for, and the key takeaway or current status. Keep it short or people skip it.
- **Header = the summary panel, nothing else**: open with the summary panel at full width (no layout section around it), then go straight into the first H2. Don't add a key-facts/meta line (status, owner, dates, approvers) or a Table of Contents macro — the user doesn't want them; who/when information belongs in the sections where it matters (e.g. approvers in an RFC's sign-off section, deciders in an ADR's decision section, attendees in meeting notes' discussion), and informative H2s plus Confluence's own page outline handle navigation.

## 2. Layout and width

- **Left-align** text and headings. Don't center titles or paragraphs; left edges are what eyes scan.
- **Wide page, readable lines.** Create pages with `contentWidth: "wide"` — users prefer the roomier canvas, and tables, tile rows and side-by-side layouts need it. A wide page makes full-width paragraphs too long to read comfortably (aim for ~60–80 characters per line), so keep the summary panel's lines short (one short sentence or bullet each) and keep long prose inside layouts: `layout-two-right-sidebar` for text-heavy sections (prose left, related links/contacts/notes right), two equal columns for text + visual. Short paragraphs, lists, tables and tile rows can run full width. Use `narrow` only if the user or space asks for it, and `max` only for dashboards or very wide tables.
- **Wide things stay wide.** Tables, charts and big diagrams get `data-layout="wide"` (or full-width when the page is `max`).
- **Columns by purpose** (Confluence allows up to 5; that's not a target):
  - 2 columns — text + visual side by side (steps left, screenshot right), or main content + sidebar (related links, key contacts, notes).
  - 3 columns — comparisons or parallel items (Option A / B / C, three teams, three phases).
  - 4–5 columns — only light content: stats, icon+label tiles, feature highlights on landing/overview pages. Never long text.
- **Breathing room.** Separate major sections with layout sections or a `<hr>`; keep paragraphs to ~3–4 lines; break long passages into lists.
- If the org has a corporate template for this page type, follow it instead of inventing a layout.

## 3. Structure

- The page title is the only H1. Main sections are **H2**, sub-sections **H3**, rarely H4. Never skip a level, never use bold paragraphs as fake headings — screen readers and Confluence's page outline depend on real headings.
- Headings should be informative ("Retry with exponential backoff"), not generic ("Details").
- Order sections by what the reader needs first: action/answer → context → reference detail.
- Put long reference material, logs, edge cases and FAQs in **expands** so the page stays short but complete.

## 4. Make it visual

- **Formatting: less is more.** Bold = must-read terms or actions. Italic = emphasis or a new term. Color = grouping or highlighting, sparingly, from the guide's palette only. Never let color alone carry meaning — pair it with an emoji, status lozenge or word (✅ Done, ⚠️ Risk).
- **Visual anchor.** Aim for at least one picture, diagram or chart per substantial page — it gives the text room and helps the ~65% of visual learners. Visuals tell part of the story; don't add stock decoration. Every image gets alt text (`data-alt` / `alt`). For specs, technical plans, PRDs, architecture/ADR pages and roadmaps, the best anchor is a **live diagram: build it as a Confluence whiteboard and embed it in the page** — follow `references/diagrams.md`. Otherwise consider a table, a status-tile row, a Remix infographic (if the guide offers it), or a placeholder panel telling the author which screenshot/diagram to add — don't invent image URLs.
- **Numbers that show a trend** belong in a chart (or at least a wide table with a one-line takeaway above it), not buried in prose.
- **Tables** for anything with ≥2 attributes across ≥3 items; header row with `<th>`; keep cells short.
- **Smart links**: paste URLs as smart links — `inline` by default, `block` card for the one link the page is promoting, `embed` for videos, Figma, Google Docs, Jira, whiteboards so they render in place. Plain `<a>` only when the anchor text must read as part of a sentence.

## 5. Emphasize and highlight — with restraint

- **Panels** carry meaning by type: `info` = context/summary, `success` = outcome/tip, `note` = heads-up, `warning` = risk or irreversible action, `error` = don't/breaking. Use one where a reader would otherwise miss something; more than ~3–4 callout panels on a page and they stop standing out. (A single row of stat tiles counts as one visual element, not one panel per tile — but use at most one tile row per page.)
- **Status lozenges** for state (In progress, Approved, Blocked) in summaries and tables.
- **Task and decision lists** for action items and decisions — they're native, trackable, and scannable.
- **Code blocks** for any command, config or snippet, always with the language set.
- **Expands** for optional depth.
- **Premium macros** (Spotlight, Carousel, Cards) are for showcase pages — product features, team highlights, intranet homepages — not knowledge-heavy docs where clarity beats impact. Only use them if the format guide lists them as available.
- The real best practice is knowing when *not* to add an element. Each element must earn its place; if removing it loses nothing, remove it.

## Review checklist

Read the draft as a 15-second skimmer, then check:

- [ ] Title is specific and searchable, no emoji, no generic words.
- [ ] First screen answers: what is this, who is it for, what's the takeaway/status.
- [ ] Summary panel is ≤4 sentences.
- [ ] Header is just the full-width summary panel — no layout section, no key-facts/meta line, no Table of Contents macro.
- [ ] Only H2/H3 (H4 rarely), no skipped levels, no fake bold headings.
- [ ] Page created with `contentWidth: "wide"` (unless told otherwise); long prose sits in layout columns, not full-width; tables/charts wide; columns match content (no long text in 4–5 columns).
- [ ] At least one visual anchor (or a clear placeholder for the author), all with alt text.
- [ ] Color never the sole signal; formatting sparse.
- [ ] Callout panels ≤ ~4 (one stat-tile row counts as one) and each has the right type; long detail tucked into expands.
- [ ] Links are smart links of the right appearance; no invented URLs, media IDs or user IDs (use `[@name]` text when the account ID is unknown).
- [ ] HTML follows the format guide's nesting rules (e.g. no tables, expands or nested panels inside panels; layout sections contain only columns).

## References

- `references/html-cheatsheet.md` — ready-to-paste Confluence HTML for the moves above (summary-panel header, panels, layouts, status tiles, expands, smart links). Read when writing the body.
- `references/page-patterns.md` — skeletons for the supported page types (meeting notes, decision/RFC, PRD, technical spec/plan, ADR). Read during step 3 to pick a structure; other page types use the general rules here.
- `references/diagrams.md` — creating a Confluence whiteboard diagram and embedding it live in the page. Read whenever the page would benefit from an architecture, flow, journey or timeline diagram.
