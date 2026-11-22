# Template changelog

One row per version bump. A filled file names its version in front matter (`template: prd@1`), and the row's commit holds that version's shape.

## Never changes

These need a map decision and a new template name, not a bump:

- The ID schemes and how they're cited (`<KEY>/<ID>`):
  - PRD: `R<n>`, `Q<n>`
  - journeys: `J<n>`, `J<n>.<step>`
  - plan: `T<n>`
  - diagnosis: `C<n>`
- IDs are never renumbered or reused. A dropped item is struck through, and an inserted one gets a letter (`J1.2a`).
- The front-matter keys `template`, `ticket`, `status` and `confluence_id`.
- The file name pattern `{YYYY-MM-DD}-{topic}-<name>.md`.
- The Change log table.

## Bump or edit in place

- A change to what a filled file holds is a **bump**: adding, removing, renaming or reordering a heading, a table column, a front-matter key or an enum value.
- Changes to placeholder text, guidance, examples or typos are edits in place, with no bump.

## Versions

| Template | Version | Date | Commit | What changed | How to migrate |
| --- | --- | --- | --- | --- | --- |
| prd | 1 | 2026-11-22 | e81be4f | First version | — |
| journeys | 1 | 2026-11-22 | e81be4f | First version | — |
| spec | 1 | 2026-11-22 | 062542b | First version (PanDev nine sections) | — |
| diagnosis | 1 | 2026-11-22 | 062542b | First version | — |
| adr | 1 | 2026-11-22 | 062542b | First version | — |
| plan | 1 | 2026-11-22 | (this commit) | First version | — |
| brief | 1 | 2026-11-22 | (this commit) | First version | — |
| plan | 2 | 2026-11-22 | (this commit) | Added a `Build` column to the task table and a `**Build:**` line to each task: the build path and the sdlc gate it fails | Add the column and line to each task. Run the gates in `ticket/playbooks/build.md` to fill them. |
