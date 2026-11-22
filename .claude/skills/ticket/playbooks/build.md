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

- **In the session:** use **incremental-implementation** with **tdd**. Implement a slice, test it, verify it, commit it, then do the next slice. The brief is the task's checklist.
- **Through the factory:** run `sdlc` with the brief once the factory accepts briefs. One brief is one run and one PR. Each agent reads only its slice of the brief.

The map ticket "Build here or hand to sdlc" settles which path a task takes. Until it closes, build in the session.
