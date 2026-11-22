# Build a task

A task is ready when:
- its source has "Approved by" filled in: the plan for a Feature, the diagnosis for a Bug fix
- each question it cites has a PM answer or a working answer

## Write the run brief

Write `work/<KEY>-<slug>/briefs/T<n>-brief.md` from `templates/brief.md`:
- Copy from the sources, never rewrite: the plan task's fields, the spec's named design subsections and rollout steps whole, the spec's scope table, and the cited PRD and journey rows word for word.
- Every H2 section is present, once, in the template's order. An empty one says `None.`.
- A Bug fix has no plan. Its diagnosis becomes one brief, `T1`, mapped as `templates/brief.md` describes.

## Pick the build path

A task goes through `sdlc` only when it passes all four gates:
1. Its target is registered with the factory as a writable target (`~/.factory/targets.yaml`, with test and lint set).
2. sdlc accepts briefs. Until the factory ships that change, no task passes.
3. Its Shape is `one`. An `arena` task builds in the session.
4. Every task it depends on has merged. sdlc can't open a PR on top of an open parent.

Otherwise it builds in the session. Size and risk aren't gates.

- **When:** propose the path per task while writing the plan. The user approves it with the plan. For a Bug fix, apply the gates to T1 at the diagnosis checkpoint and state the path in that reply.
- **Record:** the plan's `Build` column and each task's `**Build:** sdlc | session (<gate that failed>)` line.
- **Re-check** the gates when each task's build starts. If the path changed, switch without asking, add a Change log row and say so in the reply. Leave `session (pinned)` alone.
- A child whose parent PR is still open builds in the session now. Don't wait on a merge.

## Build

**Through sdlc:** run `npm run sdlc -- --target <t> --complexity <Size> --brief <path> --ship` in the background from the factory, with `--bug` for a Bug fix's T1. One brief is one run and one PR, and each agent reads only its slice. If the run stops, don't retry it: read its report, take its branch into the session, finish there as below, and log `session (sdlc run <adw_id> stopped: <reason>)`.

**In the session:** produce what an sdlc run produces.
1. Cut the task's branch from its parent task's branch, or from the trunk.
2. Build with **incremental-implementation** and **tdd**: implement a slice, test it, verify it, commit it, then do the next slice. The brief is the checklist. For a Bug fix, commit the Repro test, failing, before the fix.
3. Prove it:
   - On a registered target, run the factory's `quality` chain, then `verify` with `--base <parent branch>`. That gives sdlc's checks and its verification report.
   - On an unregistered target, run the repo's own tests and its verify skill if it has one. Without one, the PR says "Not verified in the running app".
4. Review it in place of sdlc's reviewer: run `simplify`, then have a fresh subagent review the diff against the brief's reviewer slice (Task, Design, Scope, ADRs, Journeys, Rollout). Fix its required findings. Its nits go in the PR body.
5. Open one ready-for-review PR against the parent per `open-pr.md`. The body carries the brief's working answers with a box for the PM to tick, its Links, the verification report and the nits.
