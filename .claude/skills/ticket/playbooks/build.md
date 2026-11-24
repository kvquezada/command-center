# Build a task

A task is ready when:
- its source has "Approved by" filled in: the plan for a Feature, the diagnosis for a Bug fix
- each question it cites has a PM answer or a working answer

## Write the run brief

Write `work/<KEY>-<slug>/briefs/T<n>-brief.md` from `templates/brief.md`:
- Copy from the sources, never rewrite: the plan task's fields, the spec's named design subsections and rollout steps whole, the spec's scope table, and the cited PRD and journey rows word for word.
- Every H2 section is present, once, in the template's order. An empty one says `None.`.
- A Bug fix has no plan. Its diagnosis becomes one brief, `T1`, mapped as `templates/brief.md` describes.

## Build

Build each task in the session.
1. Cut the task's branch from its parent task's branch, or from the trunk.
2. Build with **incremental-implementation** and **tdd**: implement a slice, test it, verify it, commit it, then do the next slice. The brief is the checklist. For a Bug fix, commit the Repro test, failing, before the fix.
3. Prove it: run the repo's own tests and its verify skill if it has one. Without one, the PR says "Not verified in the running app".
4. Review it: run `simplify`, then have a fresh subagent review the diff against the brief's reviewer slice (Task, Design, Scope, ADRs, Journeys, Rollout). Fix its required findings. Its nits go in the PR body.
5. Open one ready-for-review PR against the parent per `open-pr.md`. The body carries the brief's working answers with a box for the PM to tick, its Links, the verification report and the nits.
