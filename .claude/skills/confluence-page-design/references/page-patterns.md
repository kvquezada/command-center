# Page patterns

Skeletons for the supported page types: meeting notes, decision/RFC, PRD, technical spec/plan and ADR. For any other kind of page, don't force one of these — apply the general rules in SKILL.md and order sections by what the reader needs first.

Each skeleton starts with the purpose-first header (just the summary panel at full width; no key-facts line, no table of contents). Adapt freely — the order of sections is "what the reader needs first", so reorder if this reader needs something else first. If the org has a template for the type, use that instead.

## Meeting notes
Reader: attendees and people who missed it, mostly skimming for outcomes.
- Title: `YYYY-MM-DD <Meeting name> — <topic>`.
- Header: summary panel with the 1–3 outcomes. Attendees go in the Discussion section as a short line (`[@Name]` when the account ID is unknown).
- H2 Decisions — decision list (top, because that's what people look for).
- H2 Action items — task list with owner + due date.
- H2 Discussion — short bullets per agenda item; long notes in expands.
Emoji: 📝.

## Decision / RFC
Reader: reviewers and future readers asking "why did we do this?".
- Header: summary panel (problem in one line, recommendation, decision status lozenge: In review / Decided). Approvers go in the Decision section.
- H2 Context — why now.
- H2 Options — `layout-three-equal` or a comparison table (wide) with pros/cons/cost.
- H2 Recommendation — `success` panel with the pick and the one-line reason.
- H2 Consequences & risks.
- H2 Decision — decision list, approvers, date.
- Appendix in expands.
Emoji: 🗳️.

## PRD (product requirements)
Reader: product, design, engineering and stakeholders aligning on *what* and *why* (not *how*).
- Header: summary panel (problem, who it's for, the one-line solution, target release).
- H2 Problem & opportunity — who hurts, evidence (numbers, quotes); stat tiles if there are 2–3 headline numbers.
- H2 Goals & non-goals — two columns (`layout-two-equal`).
- H2 Success metrics — table: metric, baseline, target, how measured.
- H2 Users & journey — embedded whiteboard of the user flow (see diagrams.md), short persona bullets.
- H2 Assumptions & constraints — `layout-two-equal`:
  - Left column, H3 **Assumptions** — *what are we assuming to be true?* Bullets, each a single testable statement (e.g. "Customers sign in with OTP before checkout"), with how/when it gets validated in brackets where known. Flag the riskiest one with ⚠️ + a word.
  - Right column, H3 **Constraints** — *what limitations exist that shape the solution?* Bullets with a bold lead-in for the kind: **Technical**, **Business/ops**, **Legal/compliance**, **Time/budget** (skip empty kinds). Each says what it rules out (e.g. "**Ops:** no change to how orders reach the kitchen → points can only affect price").
- H2 Requirements — table with ID, requirement as a user story, priority lozenge (Must / Should / Could), notes. Keep each row one sentence.
- H2 Dependencies — *all external dependencies, integrations and prerequisites.* Wide table: Dependency · Type (External service / Integration / Prerequisite / Team) · Owner (`[@Name]` if unknown) · Status lozenge (Not started neutral / In progress blue / Ready green / Blocked red) · Impact if late. Order by risk, blocked and not-started first. Link real systems as inline smart links (Jira epics, repos, vendor docs). If something is blocking, say so in one line above the table.
- H2 Out of scope / later.
- H2 Open questions — task list with owners.
- H2 Timeline & release — milestone table.
Emoji: 🎯.

## Technical spec / technical plan
Reader: engineers building and reviewing it; future maintainers.
- Header: summary panel (what's being built, why, the approach in one sentence, links to the PRD/RFC as inline smart links).
- H2 Context & goals — short; link out rather than repeat the PRD.
- H2 Architecture — embedded whiteboard diagram of components and data flow (see diagrams.md), then 3–6 bullets explaining each box.
- H2 Design — H3 per area (data model, API, UI, jobs). Schemas and API shapes in code blocks with the language set; endpoint lists as tables (method, path, purpose).
- H2 Alternatives considered — table or expands; the real argument belongs in an ADR/RFC.
- H2 Rollout & migration — numbered steps, feature flags, `warning` panel for irreversible steps.
- H2 Testing & observability.
- H2 Risks & open questions — table with owner + status lozenge.
- H2 Milestones / tasks — task list or Jira smart links.
Emoji: 🧩.

## ADR (architecture decision record)
Reader: someone months later asking "why is it like this?". Keep it short — one decision per page.
- Title: `ADR-NNN: <decision as a statement>` (e.g. "ADR-004: Store orders in MongoDB with Mongoose").
- Header: summary panel (decision in one sentence). Status (Proposed / Accepted / Superseded), date and deciders go in the Decision section.
- H2 Context — the forces and constraints, as bullets.
- H2 Decision — `success` panel with the decision stated plainly.
- H2 Options considered — comparison table (wide): option, pros, cons, verdict. Diagram only if the decision is structural (see diagrams.md).
- H2 Consequences — two columns: positive / negative (or trade-offs we accept).
- H2 Related — smart links to superseding/superseded ADRs, specs, PRs.
Emoji: 🏛️.
