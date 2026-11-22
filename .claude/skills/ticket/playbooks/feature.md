# Feature

You own the design. The PMs own the requirements, and the user decides when each document is done.

1. **Restate.** ✋ (This is the router's restatement.)
2. **Draft the PRD and journeys.** Write `<YYYY-MM-DD>-<topic>-prd.md` and `<YYYY-MM-DD>-<topic>-journeys.md` in `work/<KEY>-<slug>/` from `templates/prd.md` and `templates/journeys.md`, with context from `twg`. IDs (`R<n>`, `J<n>`, `J<n>.<step>`, `Q<n>`) are never renumbered. Principle: Experience First.
   Show the drafts and wait for the user's "publish". ✋ Then publish both per `publish.md`.
3. **Refine with the PMs** until the user says the PRD is done. ✋ Each refine pass follows `publish.md`. The user replies to PM comments personally.
4. **Spec.** **how** or an Explore subagent traces the subsystem, **sketch** writes two shapes and picks one, then **spec-driven-development** writes `<YYYY-MM-DD>-<topic>-spec.md` from `templates/spec.md`. Draft an ADR from `templates/adr.md` with **documentation-and-adrs** only when a decision is hard to reverse, surprising without context, and a real trade-off.
   Principles: Foundational Thinking, Redesign from First Principles, Model the Domain, Type System Discipline, Boundary Discipline, and Exhaust the Design Space (it runs **prototype**) for a design with no precedent.
   ✋ The user approves by filling in "Approved by". Then publish the spec and any ADRs per `publish.md`.
5. **Plan.** **planning-and-task-breakdown** writes `<YYYY-MM-DD>-<topic>-plan.md` from `templates/plan.md`, with the throughput checkpoint inside. Each task's acceptance criteria cite journey steps (`<KEY>/J<n>.<step>`) or requirements (`<KEY>/R<n>`). Mark a task that admits several valid shapes. Principles: Sequence Work into Verifiable Units, Subtract Before You Add, Separate Before Serializing Shared State.
   ✋ The user approves the plan, which authorizes one ready-for-review PR per task, stacked. Then publish it per `publish.md`.
6. **Build each task** per `build.md`. **arena** runs only for a marked task. Principles: Laziness Protocol, Boundary Discipline, Type System Discipline, Test Behavior Not Implementation, Build the Lever, and Migrate Callers Then Delete Legacy APIs or Make Operations Idempotent when their triggers hit.
7. **Verify** each task against the journey steps it cites, on the real surface. "Inconclusive" or the wrong surface is a fail. Principle: Prove It Works.
8. **Open the PR** per `open-pr.md`.

**Reply at the end:** what was built, what you chose and why, and open decisions. Use tables for design alternatives.
